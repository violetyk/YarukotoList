//
//  YarukotoTableViewCell.h
//  YarukotoList
//
//  Created by 加賀谷 祐平 on 2014/03/24.
//  Copyright (c) 2014年 nanapi Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YarukotoTableViewCell : UITableViewCell

// text
@property(nonatomic, strong) NSString *body;

// view
@property(nonatomic, strong) UILabel *bodyLabel;

// other
@property(nonatomic, readonly) CGFloat height;
@end
