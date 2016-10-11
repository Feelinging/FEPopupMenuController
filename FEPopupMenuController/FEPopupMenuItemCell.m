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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(NSString *)identifier{
    return @"FEPopupMenuItemCell";
}

+ (UINib *)nib{
    return [UINib nibWithNibName:[self identifier] bundle:[NSBundle bundleForClass:[self class]]];
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
        
        self.icon2titleSpacingConstraint.priority = 999.0;
        self.titleXALignmentConstraint.priority = UILayoutPriorityDefaultHigh;
    }else{
        self.iconImageview.hidden = YES;
        
        self.titleXALignmentConstraint.priority = 999.0;
        self.icon2titleSpacingConstraint.priority = UILayoutPriorityDefaultHigh;
    }
}

@end
