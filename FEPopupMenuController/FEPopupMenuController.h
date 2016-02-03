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
 *  using FEPopupMenuItem init
 */
- (instancetype)initWithItems:(NSArray<FEPopupMenuItem *> *)items;

/**
 *  popup the view controller
 */
- (void)showInViewController:(UIViewController *)viewController atPposition:(CGPoint)position;

/**
 *  dismiss the view controller
 */
- (void)dismiss;

/**
 *  move the content to new position
 */
- (void)moveContentViewToPosition:(CGPoint)position;

#pragma mark Custom Parameters

/**
 *  When selected a item will automatic dismiss the FEPopupMenuController, default is YES.
 */
@property (nonatomic, assign) BOOL automaticDismiss;

/**
 *  the content view width, default is 130.
 */
@property (nonatomic, assign) CGFloat contentViewWidth;

/**
 *  the content view position, default is (0,0)
 */
@property (nonatomic, assign) CGPoint contentViewPosition;

@end
