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

@property (nonatomic, strong) NSArray<FEPopupMenuItem *> * __nullable items;

/**
 *  using FEPopupMenuItem init
 */
- (instancetype __nonnull)initWithItems:(NSArray<FEPopupMenuItem * > * __nonnull)items;

/**
 *  popup the view controller
 */
- (void)showInViewController:(UIViewController * __nonnull)viewController atPosition:(CGPoint)position;

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

/**
 *  the content view background color, default is white
 */
@property (nonatomic, strong) UIColor *contentViewBackgroundColor;

/**
 *  the content view corner radius, default is 8.0
 */
@property (nonatomic, assign) CGFloat contentViewCornerRadius;

/**
 *  title Color of each line, default is 0x565656
 */
@property (nonatomic, strong) UIColor *itemTitleColor;

@end
