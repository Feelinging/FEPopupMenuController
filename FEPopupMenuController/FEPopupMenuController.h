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

@property (nonnull, nonatomic, strong) NSArray<FEPopupMenuItem *> *items;

/**
 *  using FEPopupMenuItem init
 */
- (nonnull instancetype)initWithItems:(nonnull NSArray<FEPopupMenuItem * > *)items;

/**
 *  popup the view controller
 */
- (void)showInViewController:(nonnull UIViewController *)viewController atPosition:(CGPoint)position;

/**
 *  dismiss the view controller
 */
- (void)dismiss;

/**
 *  move the content to new position
 */
- (void)moveContentViewToPosition:(CGPoint)position;

/**
 *  the content table view
 */
@property (nonatomic, strong, readonly) UITableView *tableView;

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
@property (nullable, nonatomic, strong) UIColor *contentViewBackgroundColor;

/**
 *  the content view corner radius, default is 8.0
 */
@property (nonatomic, assign) CGFloat contentViewCornerRadius;

/**
 *  arrow view x position , default is (contentViewWidth - 25.0)
 */
@property (nonatomic, assign) CGFloat arrowX;

/**
 *  arrow of top on content view show or hidden, default is NO (hidden)
 */
@property (nonatomic, assign) BOOL isShowArrow;

/**
 *  the separator line color of each item, default is light grey (r:0.93,g:0.93,b:0.93)
 */
@property (nullable, nonatomic, strong) UIColor *itemSeparatorLineColor;

/**
 *  the separator inset, default is zero (0,0,0,0)
 */
@property (nonatomic, assign) UIEdgeInsets itemSeparatorInset;

@end
