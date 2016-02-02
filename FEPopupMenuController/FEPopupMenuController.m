//
//  FEPopupMenuController.m
//  FEPopupMenuControllerDemo
//
//  Created by feeling on 16/1/29.
//  Copyright © 2016年 feeling. All rights reserved.
//

#import "FEPopupMenuController.h"
#import "FEPopupMenuItemCell.h"

@interface FEPopupMenuController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation FEPopupMenuController

-(instancetype)initWithItems:(NSArray *)items{
    if (self = [super init]) {
        self.items = items;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // background mask
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.25];
    
    // tap background
    UITapGestureRecognizer *tapBackgroundGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    [self.view addGestureRecognizer:tapBackgroundGestureRecognizer];
    
    // init contentView
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(160, 80, 130, 44 * [self.items count])];
    self.contentView.layer.cornerRadius = 8.0;
    self.contentView.clipsToBounds = YES;
    
    // init TableView
    self.tableView = [[UITableView alloc] initWithFrame:self.contentView.bounds];
    [self.tableView registerNib:[UINib nibWithNibName:@"FEPopupMenuItemCell" bundle:nil] forCellReuseIdentifier:[FEPopupMenuItemCell identifier]];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1];
    self.tableView.scrollEnabled = NO;
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark show & dismiss

-(void)showInViewController:(UIViewController *)viewController{
    // present style
    if (floor(NSFoundationVersionNumber) >= NSFoundationVersionNumber_iOS_8_0) {
        // iOS8+
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    }else{
        viewController.modalPresentationStyle = UIModalPresentationCurrentContext;
    }
    
    [viewController presentViewController:self animated:YES completion:nil];
}

-(void)dismiss{
    [self dismissViewControllerAnimated:YES completion:nil];
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

@end