//
//  FEPopupMenuController.h
//  FEPopupMenuControllerDemo
//
//  Created by feeling on 16/1/29.
//  Copyright © 2016年 feeling. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FEPopupMenuItem.h"

@interface FEPopupMenuController : UIViewController

@property (nonatomic, strong) NSArray *items;

- (instancetype)initWithItems:(NSArray *)items;

- (void)showInViewController:(UIViewController *)viewController;
- (void)dismiss;

@end
