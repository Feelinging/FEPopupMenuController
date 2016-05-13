//
//  FEPopupMenuItemCell.h
//  FEPopupMenuControllerDemo
//
//  Created by feeling on 16/1/29.
//  Copyright © 2016年 feeling. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FEPopupMenuItem;

@interface FEPopupMenuItemCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImageview;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

/**
 *  if icon : priority high , else low
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *icon2titleSpacingConstraint;

/**
 *  if icon : priority low , else high
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleXALignmentConstraint;

/**
 *  identifier for cell
 */
+ (NSString *)identifier;

/**
 *  nib
 */
+ (UINib *)nib;

/**
 *  fill the cell with item
 */
- (void)configCellWithItem:(FEPopupMenuItem *)item;

@end
