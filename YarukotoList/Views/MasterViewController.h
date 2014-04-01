//
//  MasterViewController.h
//  YarukotoList
//
//  Created by 加賀谷 祐平 on 2014/03/07.
//  Copyright (c) 2014年 nanapi Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@property (strong, nonatomic) NSFetchedResultsController *thingsFetchedResultsController;
@property (strong, nonatomic) NSFetchedResultsController *recipesFetchedResultsController;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) IBOutlet UITableView *tableView;


- (IBAction)addActionForSegue:(UIStoryboardSegue *)segue;
- (IBAction)cancelActionForSegue:(UIStoryboardSegue *)segue;

@end
