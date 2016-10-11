//
//  FEPopupMenuController.m
//  FEPopupMenuControllerDemo
//
//  Created by feeling on 16/1/29.
//  Copyright © 2016年 feeling. All rights reserved.
//

#import "FEPopupMenuController.h"
#import "FEPopupMenuItemCell.h"
#import "FEPopupMenuControllerAnimatedTransitioning.h"

static const CGFloat kDefaultContentViewWidth = 130.0;
static const CGFloat kDefaultArrowWeight = 10.0;
static const CGFloat kDefaultArrowHeight = 7.0;

@interface FEPopupMenuController () <UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITapGestureRecognizer *tapBackgroundGestureRecognizer;
@property (nonatomic, strong) UIView *arrowView;

@end

@implementation FEPopupMenuController

-(instancetype)initWithItems:(NSArray<FEPopupMenuItem *> *)items {
    if (self = [super init]) {
        self.items = items;
        self.automaticDismiss = YES;
        self.contentViewWidth = kDefaultContentViewWidth;
        self.contentViewPosition = CGPointMake(0,0);
        self.contentViewBackgroundColor = [UIColor whiteColor];
        self.contentViewCornerRadius = 8.0;
        self.arrowX = self.contentViewWidth - 25.0;
        self.isShowArrow = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // background mask
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.25];
    
    // tap background
    self.tapBackgroundGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    self.tapBackgroundGestureRecognizer.delegate = self;
    [self.view addGestureRecognizer:self.tapBackgroundGestureRecognizer];
    
    // init contentView
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(self.contentViewPosition.x,
                                                            self.contentViewPosition.y,
                                                            self.contentViewWidth,
                                                            44 * [self.items count] + kDefaultArrowHeight)];

    
    // arrow
    if (self.isShowArrow) {
        self.arrowView.frame = CGRectMake(self.arrowX, 0, self.arrowView.bounds.size.width, self.arrowView.bounds.size.height);
        [self.contentView addSubview:self.arrowView];
    }
    
    // init TableView
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kDefaultArrowHeight,
                                                                   self.contentView.bounds.size.width,
                                                                   self.contentView.bounds.size.height - kDefaultArrowHeight)];
    [self.tableView registerNib:[FEPopupMenuItemCell nib] forCellReuseIdentifier:[FEPopupMenuItemCell identifier]];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1];
    self.tableView.scrollEnabled = NO;
    self.tableView.backgroundColor = self.contentViewBackgroundColor;
    self.tableView.layer.cornerRadius = self.contentViewCornerRadius;
    self.tableView.clipsToBounds = YES;
    
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    // contentView
    [self.contentView addSubview:self.tableView];
    [self.view addSubview:self.contentView];
    
    [self.tableView reloadData];
}

#pragma mark show & dismiss

-(void)showInViewController:(UIViewController *)viewController atPosition:(CGPoint)position{
    
    // postion
    [self moveContentViewToPosition:position];
    
    // reload
    [self.tableView reloadData];
    
    // present style
    if (floor(NSFoundationVersionNumber) >= NSFoundationVersionNumber_iOS_8_0) {
        // iOS8+
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    }else{
        // iOS7
        UIViewController *root = viewController;
        while (root.parentViewController) {
            root = root.parentViewController;
        }
        root.modalPresentationStyle = UIModalPresentationCurrentContext;
    }
    
    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [viewController presentViewController:self animated:YES completion:nil];
}

-(void)dismiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)moveContentViewToPosition:(CGPoint)position{
    self.contentViewPosition = position;
    self.contentView.frame = CGRectMake(position.x, position.y, self.contentViewWidth, self.contentView.frame.size.height);
}

#pragma mark UITableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.items count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FEPopupMenuItemCell *cell = [tableView dequeueReusableCellWithIdentifier:[FEPopupMenuItemCell identifier]];
    FEPopupMenuItem *item = self.items[indexPath.row];
    [cell configCellWithItem:item];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // automatic dismiss
    if (self.automaticDismiss) {
        [self dismiss];
    }

    FEPopupMenuItem *item = self.items[indexPath.row];

    // exec item action
    if (item.action) {
        item.action();
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if (gestureRecognizer == self.tapBackgroundGestureRecognizer && [touch.view isDescendantOfView:self.contentView]) {
        return NO;
    }
    return YES;
}

#pragma mark <UIViewControllerAnimatedTransitioning>

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    FEPopupMenuControllerAnimatedTransitioning *transitioning = [FEPopupMenuControllerAnimatedTransitioning new];
    //    transitioning.presenting = YES;
    return transitioning;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    FEPopupMenuControllerAnimatedTransitioning * transitioning = [FEPopupMenuControllerAnimatedTransitioning new];
    //    transitioning.presenting = NO;
    return transitioning;
}

#pragma mark -

- (UIView *)arrowView{
    if (!_arrowView) {
        // draw
        CGSize size = CGSizeMake(kDefaultArrowWeight, kDefaultArrowHeight);
        UIBezierPath *path = [[UIBezierPath alloc] init];
        [path moveToPoint:CGPointMake(size.width / 2.0, 0)];
        [path addLineToPoint:CGPointMake(0, size.height)];
        [path addLineToPoint:CGPointMake(size.width, size.height)];
        path.lineWidth = 1.0;
        
        CAShapeLayer *arrowLayer = [CAShapeLayer layer];
        arrowLayer.path = path.CGPath;
        
        _arrowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        _arrowView.layer.mask = arrowLayer;
        _arrowView.backgroundColor = self.contentViewBackgroundColor;
    }
    return _arrowView;
}

@end
