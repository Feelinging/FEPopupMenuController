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
- (nonnull instancetype)initWithTitle:(nullable NSString *)title iconImage:(nullable UIImage *)iconImage action:(nullable FEPopupMenuItemActionBlock)action;

/**
 *  title of item
 */
@property (nullable, nonatomic, copy) NSString *title;

/**
 *  icon image of item
 */
@property (nullable, nonatomic, strong) UIImage *iconImage;

/**
 *  callback of item when selected
 */
@property (nullable, nonatomic, copy) FEPopupMenuItemActionBlock action;

/**
 *  the color of title
 */
@property (nullable, nonatomic, strong) UIColor *titleColor;

@end
