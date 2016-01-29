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

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIImage *iconImage;
@property (nonatomic, copy) FEPopupMenuItemActionBlock action;

- (instancetype)initWithTitle:(NSString *)title iconImage:(UIImage *)iconImage action:(FEPopupMenuItemActionBlock)action;

@end
