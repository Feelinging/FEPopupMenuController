//
//  FEPopupMenuController.m
//  FEPopupMenuControllerDemo
//
//  Created by feeling on 16/1/29.
//  Copyright © 2016年 feeling. All rights reserved.
//

#import "FEPopupMenuController.h"

@interface FEPopupMenuController () <UIViewControllerTransitioningDelegate>

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

@end