//
//  AGTNotesViewController.h
//  Everpobre
//
//  Created by Joan on 09/04/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "AGTCoreDataTableViewController.h"
@class AGTNotebook;

@interface AGTNotesViewController : AGTCoreDataTableViewController

- (id)initWithFetchedResultsController:(NSFetchedResultsController *)aFetchedResultsController style:(UITableViewStyle)aStyle notebook:(AGTNotebook*)notebook;

@end
