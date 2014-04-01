//
//  DetailViewController.h
//  YarukotoList
//
//  Created by 加賀谷 祐平 on 2014/03/07.
//  Copyright (c) 2014年 nanapi Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Recipe;

@interface DetailViewController : UIViewController
@property (strong, nonatomic) Recipe *recipe;

//@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageviw;

@end
