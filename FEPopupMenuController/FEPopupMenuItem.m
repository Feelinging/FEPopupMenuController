//
//  FEPopupMenuItem.m
//  FEPopupMenuView
//
//  Created by feeling on 16/1/29.
//  Copyright © 2016年 feeling. All rights reserved.
//

#import "FEPopupMenuItem.h"

@implementation FEPopupMenuItem

- (instancetype)initWithTitle:(NSString *)title iconImage:(UIImage *)iconImage action:(FEPopupMenuItemActionBlock)action{
    if (self = [super init]) {
        self.title = title;
        self.iconImage = iconImage;
        self.action = action;
    }
    return self;
}

@end
