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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    FEPopupMenuItem *item1 = [[FEPopupMenuItem alloc] initWithTitle:@"Item1" iconImage:nil action:^{
        NSLog(@"item1...");
    }];
    FEPopupMenuController *popupMenuController = [[FEPopupMenuController alloc] initWithItems:@[item1]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
