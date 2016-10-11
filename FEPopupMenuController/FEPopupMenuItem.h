//
//  FEPopupMenuItem.h
//  FEPopupMenuView
//
//  Created by feeling on 16/1/29.
//  Copyright © 2016年 feeling. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^FEPopupMenuItemActionBlock)(void);

@interface FEPopupMenuItem : NSObject

/**
 *  init FEPopupMenuItem with title text and icon image
 */
- (instancetype __nonnull)initWithTitle:(NSString *)title iconImage:(UIImage *)iconImage action:(FEPopupMenuItemActionBlock)action;

/**
 *  title of item
 */
@property (nonatomic, copy) NSString *title;

/**
 *  icon image of item
 */
@property (nonatomic, strong) UIImage *iconImage;

/**
 *  callback of item when selected
 */
@property (nonatomic, copy) FEPopupMenuItemActionBlock action;

/**
 *  the color of title in cell
 */
@property (nonatomic, strong) UIColor *titleColor;

@end
