//
//  ViewController.m
//  FEPopupMenuControllerDemo
//
//  Created by feeling on 16/1/29.
//  Copyright © 2016年 feeling. All rights reserved.
//

#import "ViewController.h"
#import "FEPopupMenuController.h"

@interface ViewController ()

@property (nonatomic, strong) FEPopupMenuController *popupMenuController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    FEPopupMenuItem *item1 = [[FEPopupMenuItem alloc] initWithTitle:@"全部童鞋" iconImage:nil action:^{
        NSLog(@"selected item1...");
    }];
    FEPopupMenuItem *item2 = [[FEPopupMenuItem alloc] initWithTitle:@"男生" iconImage:[UIImage imageNamed:@"homenear_icon_boy"] action:^{
        NSLog(@"selected item2...");
    }];
    FEPopupMenuItem *item3 = [[FEPopupMenuItem alloc] initWithTitle:@"女生" iconImage:[UIImage imageNamed:@"homenear_icon_girl"] action:^{
        NSLog(@"selected item3...");
    }];
    FEPopupMenuItem *item4 = [[FEPopupMenuItem alloc] initWithTitle:@"高级筛选" iconImage:nil action:^{
        NSLog(@"selected item4...");
    }];
    self.popupMenuController = [[FEPopupMenuController alloc] initWithItems:@[item1,item2,item3,item4]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  right top bar button action
 */
- (IBAction)popMenuAction:(UIBarButtonItem *)sender {
    CGPoint showPoint = CGPointMake(CGRectGetWidth(self.view.frame) - self.popupMenuController.contentViewWidth - 20, 64 + 10);
    [self.popupMenuController showInViewController:self atPoint:showPoint];
}

@end
