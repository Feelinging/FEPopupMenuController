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

@property (nonatomic, strong) NSArray<FEPopupMenuItem *> *items;

/**
 *  with FEPopupMenuItem init
 */
- (instancetype)initWithItems:(NSArray<FEPopupMenuItem *> *)items;

/**
 *  popup
 */
- (void)showInViewController:(UIViewController *)viewController;

/**
 *  hidden
 */
- (void)dismiss;

#pragma mark Custom Parameters

/**
 *  When selected a item will automatic dismiss the FEPopupMenuController, default is YES.
 */
@property (nonatomic, assign) BOOL automaticDismiss;

@end
