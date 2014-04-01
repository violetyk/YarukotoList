//
//  Thing.h
//  YarukotoList
//
//  Created by 加賀谷 祐平 on 2014/03/07.
//  Copyright (c) 2014年 nanapi Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Thing : NSManagedObject

@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSNumber * done_flg;
@property (nonatomic, retain) NSNumber * rank;
@property (nonatomic, retain) NSString * nouns;
@property (nonatomic, retain) NSString * verbs;
@property (nonatomic, retain) NSDate * created;
@property (nonatomic, retain) NSDate * modified;
@property (nonatomic, retain) NSSet *thing_hasmany_recipe;
@end

@interface Thing (CoreDataGeneratedAccessors)

- (void)addThing_hasmany_recipeObject:(NSManagedObject *)value;
- (void)removeThing_hasmany_recipeObject:(NSManagedObject *)value;
- (void)addThing_hasmany_recipe:(NSSet *)values;
- (void)removeThing_hasmany_recipe:(NSSet *)values;

@end
