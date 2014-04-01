//
//  Recipe.h
//  YarukotoList
//
//  Created by 加賀谷 祐平 on 2014/03/07.
//  Copyright (c) 2014年 nanapi Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Thing;

@interface Recipe : NSManagedObject

@property (nonatomic, retain) NSNumber * title_id;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * body;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) Thing *recipe_belongsto_thing;

@end
