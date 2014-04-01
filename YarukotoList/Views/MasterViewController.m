//
//  MasterViewController.m
//  YarukotoList
//
//  Created by 加賀谷 祐平 on 2014/03/07.
//  Copyright (c) 2014年 nanapi Inc. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "AddViewController.h"

#import "Thing.h"
#import "Recipe.h"

#import "YarukotoTableViewCell.h"

@interface MasterViewController ()
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
@property int rotateCount;
@property BOOL isYarukotoView;
@end

@implementation MasterViewController



- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 初期化
    self.rotateCount = 0;
    self.isYarukotoView = true;
    self.fetchedResultsController = self.thingsFetchedResultsController;
    
	// Do any additional setup after loading the view, typically from a nib.
    /*
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)insertNewObject:(id)sender
{
 /*
    NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
    NSEntityDescription *entity = [[self.fetchedResultsController fetchRequest] entity];
    NSManagedObject *managedObject = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
    
    // If appropriate, configure the new managed object.
    // Normally you should use accessor methods, but using KVC here avoids the need to add a custom class to the template.
    [managedObject setValue:[NSDate date] forKey:@"timeStamp"];
    
    // Save the context.
    NSError *error = nil;
    if (![context save:&error]) {
         // Replace this implementation with code to handle the error appropriately.
         // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
 */
}

    /*
    // 一番上を編集状態にする
    // tableCellを取得する。
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:0];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    // テキストフィールド
    // contentViewにaddする場合には、rectのxとyもちゃんと指定する必要があります。
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 8, 280, 28)];
    textField.placeholder = @"input your blog title";
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.delegate = self;
    [cell.contentView addSubview:textField];
    [self configureCell:cell atIndexPath:0];
    */





#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"- tableView %@", indexPath);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;


    /* セルの高さを可変にしたかった
    NSString *cellId = @"YarukotoTableViewCell";
    YarukotoTableViewCell *yarukoto_cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    yarukoto_cell = [[YarukotoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    [self configureCell:yarukoto_cell atIndexPath:indexPath];
    return yarukoto_cell;
     */
}

// セルの高さを可変にする
/*
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    YarukotoTableViewCell *yarukoto_cell = (YarukotoTableViewCell*)[self tableView:self.tableView cellForRowAtIndexPath:indexPath];
    return yarukoto_cell.height;
}
*/

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
        [context deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
        
        NSError *error = nil;
        if (![context save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }   
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The table view should not be re-orderable.
    return YES;
}


// UIViewControllerがサポートする向きを返却する。
- (NSUInteger)supportedInterfaceOrientations
{
//    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
    
    // すべての画面の向きをサポート
    return UIInterfaceOrientationMaskAll;
    // ホームボタンが上以外の向きをサポート
    // return UIInterfaceOrientationMaskAllButUpsideDown;
    // ホームボタンが左右をサポート
    // return UIInterfaceOrientationMaskLandscape;
    // ホームボタンが左のみサポート
    // return UIInterfaceOrientationMaskLandscapeLeft;
    // ホームボタンが右のみサポート
    // return UIInterfaceOrientationMaskLandscapeRight;
    // ホームボダンが下のみサポート
    // return UIInterfaceOrientationMaskPortrait;
    // ホームボダンが上のみサポート
    // return UIInterfaceOrientationMaskPortraitUpsideDown;
    // 複数サポートする場合(ホームボタンが下、左をサポート)
    // return UIInterfaceOrientationMaskPortrait |
    //            UIInterfaceOrientationMaskLandscapeLeft;
}

// 画面の回転をサポートする場合はYES、しない場合はNOを返却する。
// 画面の回転を一時的に止めたい場合はここの値をNOにするように実装する。
- (BOOL)shouldAutorotate
{
    return YES;
}

// 画面の初期表示の向きを返却する。
// サポートされている向きを設定しなければならない。
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    // ホームボダンが下
    return UIInterfaceOrientationPortrait;
    // ホームボダンが左
    // return UIInterfaceOrientationLandscapeLeft;
    // ホームボダンが右
    // return UIInterfaceOrientationLandscapeRight;
    // ホームボダンが上
    // return UIInterfaceOrientationPortraitUpsideDown;
}

// 画面の向きを変える前の処理を記述するメソッド。
- (void)willRotateToInterfaceOrientation:
(UIInterfaceOrientation)toInterfaceOrientation
                                duration:(NSTimeInterval)duration
{
//    [self debugRotate:@"画面の向きを変える前"];
}


// サブビューを再レイアウトされる前の処理を記述するメソッド。
- (void)viewWillLayoutSubviews
{
//    [self debugRotate:@"サブビューを再レイアウトする前"];
    
}

// 回転アニメーション前の処理を記述するメソッド。
- (void)willAnimateRotationToInterfaceOrientation:
(UIInterfaceOrientation)toInterfaceOrientation
                                         duration:(NSTimeInterval)duration
{
//    [self debugRotate:@"回転アニメーション前"];
    
    BOOL current = [self getCurrentMode];
    BOOL next = current;
    
    /*
     回転アニメーション前には次のホームボタンの位置が取得できているので、
     そのときにホームボタンの位置によって処理を変える
    */
    switch ([UIApplication sharedApplication].statusBarOrientation) {
        case UIInterfaceOrientationPortrait: // ホームボタンが下
            if (self.rotateCount != 0) {
                // 現在のビューの反転を表示する指示
                next = ![self getCurrentMode];
                // 回転数をリセット
                self.rotateCount = 0;
            }
            break;
        case UIInterfaceOrientationLandscapeLeft: // ホームボタンが左
        case UIInterfaceOrientationLandscapeRight: // ホームボタンが右
            self.rotateCount++;
            break;
            
        default:
            break;
    }

    if (next != current) {
        [self switchList];
    }
}

// 回転後の処理
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
//    [self debugRotate:@"回転後の処理"];
}

// 回転位置のデバッグ
- (void)debugRotate:(NSString*)logMessage
{
    
    switch ([UIApplication sharedApplication].statusBarOrientation) {
            //    switch ([[UIDevice currentDevice] orientation]) {
        case UIInterfaceOrientationPortrait:
            NSLog(@"[%@] ホームボタン=下",logMessage);
            break;
        case UIInterfaceOrientationLandscapeLeft:
            NSLog(@"[%@] ホームボタン=左", logMessage);
            break;
        case UIInterfaceOrientationLandscapeRight:
            NSLog(@"[%@] ホームボタン=右", logMessage);
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
            NSLog(@"[%@] ホームボタン=上", logMessage);
            break;
            
        default:
            break;
    }
}


- (BOOL)getCurrentMode
{
    return self.isYarukotoView;
}

- (BOOL)switchMode
{
    self.isYarukotoView = !self.isYarukotoView;
    return self.isYarukotoView;
}

- (NSString*)getItemNameForCell
{
    return self.isYarukotoView? @"content" : @"title";
}

- (void)switchList
{
    // モードの変更
    [self switchMode];
    
    /*
     ビューのタイトル変更
     fetchedResultsControllerのつけかえ
     */
    if (self.isYarukotoView) {
        self.navigationItem.title = @"やることリスト";
        self.fetchedResultsController = self.thingsFetchedResultsController;
    } else {
        self.navigationItem.title = @"できることリスト";
        self.fetchedResultsController = self.recipesFetchedResultsController;
    }
    [self.tableView reloadData];
}




#pragma mark - Fetched results controller

- (NSFetchedResultsController *)thingsFetchedResultsController
{
    
    if (_thingsFetchedResultsController != nil) {
        return _thingsFetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *thing = [NSEntityDescription entityForName:@"Thing" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:thing];
    
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"content" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"ThingsMaster"];
    aFetchedResultsController.delegate = self;
    self.thingsFetchedResultsController = aFetchedResultsController;
    
	NSError *error = nil;
	if (![self.thingsFetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    
    return _thingsFetchedResultsController;
}

- (NSFetchedResultsController *)recipesFetchedResultsController
{
    
    if (_recipesFetchedResultsController != nil) {
        return _recipesFetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *recipe = [NSEntityDescription entityForName:@"Recipe" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:recipe];
    
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"RecipesMaster"];
    aFetchedResultsController.delegate = self;
    self.recipesFetchedResultsController = aFetchedResultsController;
    
	NSError *error = nil;
	if (![self.recipesFetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    
    return _recipesFetchedResultsController;
}

/*
- (NSFetchedResultsController *)fetchedResultsController
{
    
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    NSLog(@"- fetchedResultsController");

    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:self.managedObjectContext];
//    [fetchRequest setEntity:entity];
//
//    NSEntityDescription *recipe = [NSEntityDescription entityForName:@"Recipe" inManagedObjectContext:self.managedObjectContext];
//    [fetchRequest setEntity:recipe];
//
//    NSEntityDescription *thing = [NSEntityDescription entityForName:@"Thing" inManagedObjectContext:self.managedObjectContext];
//    [fetchRequest setEntity:thing];
    NSEntityDescription *thing = [NSEntityDescription entityForName:@"Thing" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:thing];
    
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
//    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timeStamp" ascending:NO];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"content" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
	NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error]) {
	     // Replace this implementation with code to handle the error appropriately.
	     // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    
    return _fetchedResultsController;
}    
*/
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}


// Implementing the above methods to update the table view in response to individual changes may have performance implications if a large number of changes are made simultaneously. If this proves to be an issue, you can instead just implement controllerDidChangeContent: which notifies the delegate that all section and object changes have been processed. 
/*
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    // In the simplest, most efficient, case, reload the table view.
    [self.tableView reloadData];
}
*/
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
// - (void)configureCell:(YarukotoTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    
    NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = [[object valueForKey:[self getItemNameForCell]] description];
    
    if (self.isYarukotoView) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.accessoryView = nil;
    } else {
        cell.accessoryView = [[ UIImageView alloc ] initWithImage:[UIImage imageNamed:@"nanapi.png" ]];
    }
    
}


/*
 AddViewControllerからの巻き戻しセグエ。
 AddAction
 */
- (IBAction)addActionForSegue:(UIStoryboardSegue *)segue
{
    
    if ([[segue identifier] isEqualToString:@"AddAction"]) {
        // sourceViewControllerメソッドで、segueから直前のビューを取得する。
        AddViewController *addViewController = [segue sourceViewController];
        if (addViewController.thingInputField && addViewController.thingInputField.text.length) {
            
            /* CoreData
             
            NSManagedObjectContext
            データの検索、挿入更新削除や Undo Redo を行うクラス
            
            NSManagedObject
            モデルクラス。Core Dataで永続化するオブジェクトは必ずこのクラスのオブジェクトか
            このクラスのサブクラスのオブジェクトでなければいけない。
            
            NSFetchedResultsController
            NSManagedObject オブジェクトを監視するコントローラクラス。
            NSManagedObject オブジェクトが挿入、変更、削除された時に
            NSFetchedResultsControllerDelegate オブジェクトに通知する。
            
            NSEntityDescription
            エンティティの定義を管理するクラス。
            */
            // Thing保存
            NSString *thingText = addViewController.thingInputField.text;
            NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
            NSEntityDescription *entity = [[self.fetchedResultsController fetchRequest] entity];
            Thing *thing = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
            [thing setValue:thingText forKey:@"content"];
            [thing setValue:0 forKey:@"done_flg"];

            NSError *error = nil;
             if (![context save:&error]) {
                 NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
                 abort();
             }
            

            // Yahooキーフレーズ抽出APIをたたく
            NSString *encodedThingText = [thingText stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            NSString *url_string =[NSString stringWithFormat:@"%@?output=json&appid=%@&sentence=%@",
                                   @"http://jlp.yahooapis.jp/KeyphraseService/V1/extract",
                                   @"YourYahooDeveloperNetworkID",
                                   encodedThingText
                                   ];
            
//            NSLog(@"%@", url_string);
            
            NSURL *url = [NSURL URLWithString:url_string];
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
            [request setHTTPMethod:@"GET"];
            
            [NSURLConnection
             sendAsynchronousRequest:request
             queue:[NSOperationQueue mainQueue]
             completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                if (data) {
//                    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//                    NSLog(@"result: %@", result);
//                    for (id key in [result keyEnumerator]) {
//                        NSString *phrase = key;
//                        long score = [result valueForKey:key];
//                    }
                    
                    // 特徴的なキーフレーズがあった場合、半角スペース区切りで保存
                    if (result.count > 0) {
                        NSString *nouns = [[result allKeys] componentsJoinedByString:@" "];
                        // NSLog(@"result: %@", combinedStuff);                    }

                        NSError *error = nil;
                        if (![context save:&error]) {
                            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
                            abort();
                        }
                        
                        // 記事検索
                        NSString *encodedThingText = [nouns stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                        NSString *url_string =[NSString stringWithFormat:@"%@?format=json&key=%@&query=%@&sort=%@&limit=%d",
                                               @"http://api.nanapi.jp/v1/recipeSearchDetails/",
                                               @"YourNanapiDeveloperID",
                                               encodedThingText,
                                               @"pv",
                                               3
                                               ];
                        
//                        NSLog(@"%@", url_string);
                        NSURL *url = [NSURL URLWithString:url_string];
                        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
                        [request setHTTPMethod:@"GET"];

                        [NSURLConnection
                         sendAsynchronousRequest:request
                         queue:[NSOperationQueue mainQueue]
                         completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                             
                             NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                             /* JSONの結果は以下のようになっている
                              response {
                              status {}
                              recipes [
                              記事 {},
                              記事 {},
                              ...
                              ]
                              }
                              */
                             // 記事の配列を取り出す
                             NSArray *recipeArray = [[result objectForKey:@"response"] objectForKey:@"recipes"];
                             for (NSDictionary *r in recipeArray) {
                                 NSNumber *title_id    = [NSNumber numberWithInteger:[(NSString*)[r objectForKey:@"title_id"] integerValue]];
                                 NSString *title        = [r objectForKey:@"title"];
                                 //NSURL *url             = [NSURL URLWithString:[r objectForKey:@"url"]];
                                 NSURL *url             = [r objectForKey:@"url"];
                                 NSString *image        = [r objectForKey:@"image"];
                                 NSString *body         = [r objectForKey:@"body"];
                                 
                                 /*
                                 NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                                 [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
                                 NSDate *pubDate        = [formatter dateFromString:[r objectForKey:@"update"]];
                                 */

                                 
                                 // 子Modelを生成
                                 Recipe *recipe = [NSEntityDescription insertNewObjectForEntityForName:@"Recipe"
                                                                               inManagedObjectContext:context];
                                 [recipe setValue:title_id forKey:@"title_id"];
                                 [recipe setValue:title forKey:@"title"];
                                 [recipe setValue:body forKey:@"body"];
                                 [recipe setValue:image forKey:@"image"];
                                 [recipe setValue:url forKey:@"url"];
                                 
                                 
                                 // 子を親Modelに追加（自動生成メソッドを使う）
                                 [thing addThing_hasmany_recipeObject:recipe];
                                 
                                 // 保存
                                 error = nil;
                                 if (![context save:&error]) {
                                     NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
                                     abort();
                                 }

                             }
                             

                             // TableView をリロード
                             [self.tableView reloadData];
                         }];
                        
                    }
                    

                }
             }
            ];

            // TableVieWの再描画
            [[self tableView]reloadData];
        }
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

/*
 AddViewControllerからの巻き戻しセグエ。
 CancelAction
 */
- (IBAction)cancelActionForSegue:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"CancelAction"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

// セルを選択したときのsegueの分岐
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(self.isYarukotoView){
//        [self performSegueWithIdentifier:@"Edit" sender:self];
        
    }else{
        [self performSegueWithIdentifier:@"ShowAction" sender:self];
    }
    
}

// segue実行前の処理
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowAction"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        Recipe *recipe = [[self fetchedResultsController] objectAtIndexPath:indexPath];
        [[segue destinationViewController] setRecipe:recipe];
    }
}

@end
