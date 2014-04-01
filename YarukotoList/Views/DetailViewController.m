//
//  DetailViewController.m
//  YarukotoList
//
//  Created by 加賀谷 祐平 on 2014/03/07.
//  Copyright (c) 2014年 nanapi Inc. All rights reserved.
//

#import "DetailViewController.h"
#import "Recipe.h"
#import "AsyncImageView.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setRecipe:(Recipe *)newRecipe
{
    if (_recipe != newRecipe) {
        _recipe = newRecipe;
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    if (self.recipe) {
        self.title = self.recipe.title;
        
        CGRect bounds = [[UIScreen mainScreen] bounds];  //スクリーンサイズの取得
        bounds.origin.y += 20;  //ビューの配置場所を指定
        bounds.size.height -= 20;  //ビューのサイズを指定

        // 画像を非同期で読み込む　http://qiita.com/EntreGulss/items/d7d9fb5d0b93eb509d43
        AsyncImageView *asyncImageView = [[AsyncImageView alloc] initWithFrame:bounds];
        NSString *imageURL = self.recipe.image;
        [asyncImageView loadImage:imageURL];
//        [self.view addSubview:imageView];
        self.imageviw = asyncImageView;
/*
        // 画像のリサイズ
        CGFloat width = 300;  // リサイズ後幅のサイズ
        CGFloat height = 225;  // リサイズ後高さのサイズ
        
        UIGraphicsBeginImageContext(CGSizeMake(width, height));
        [imageView.image drawInRect:CGRectMake(0, 0, width, height)];
        imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();

 */
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
