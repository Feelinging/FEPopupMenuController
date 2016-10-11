//
//  FEPopupMenuItemCell.m
//  FEPopupMenuControllerDemo
//
//  Created by feeling on 16/1/29.
//  Copyright © 2016年 feeling. All rights reserved.
//

#import "FEPopupMenuItemCell.h"
#import "FEPopupMenuItem.h"

@implementation FEPopupMenuItemCell

+(NSString *)identifier{
    return @"FEPopupMenuItemCell";
}

+ (UINib *)nib{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSURL *bundleURL = [bundle URLForResource:@"FEPopupResource" withExtension:@"bundle"];
    UINib *nib = [UINib nibWithNibName:[self identifier] bundle:[NSBundle bundleWithURL:bundleURL]];
    return nib;
}

-(void)configCellWithItem:(FEPopupMenuItem *)item{
    
    // Title
    self.titleLabel.text = item.title;

    // Title Color
    if (item.titleColor) {
        self.titleLabel.textColor = item.titleColor;
    }else{
        self.titleLabel.textColor = [UIColor colorWithRed:0.33 green:0.33 blue:0.33 alpha:1];
    }
    
    // Icon
    if (item.iconImage) {
        self.iconImageview.image = item.iconImage;
        self.iconImageview.hidden = NO;
        
        self.titleXCenterConstraint.constant = (15 + 10) / 2.0;
    }else{
        self.iconImageview.hidden = YES;
        
        self.titleXCenterConstraint.constant = 0;
    }
}

@end
