//
//  AGTNotesViewController.m
//  Everpobre
//
//  Created by Joan on 09/04/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "AGTNotesViewController.h"
#import "AGTNote.h"
#import "AGTPhoto.h"
#import "AGTNotebook.h"

@interface AGTNotesViewController ()
@property (nonatomic, strong) AGTNotebook *notebook;
@end

@implementation AGTNotesViewController

- (id)initWithFetchedResultsController:(NSFetchedResultsController *)aFetchedResultsController
                                 style:(UITableViewStyle)aStyle
                              notebook:(AGTNotebook*)notebook{
    if (self = [super initWithFetchedResultsController:aFetchedResultsController style:aStyle])
    {
        _notebook = notebook;
        self.title = self.notebook.name;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNewNoteButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AGTNote *n = [self.fetchedResultsController objectAtIndexPath:indexPath];
    static NSString *cellID = @"noteCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    cell.textLabel.text = n.name;
    cell.detailTextLabel.text = n.text;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        AGTNote *n = [self.fetchedResultsController objectAtIndexPath:indexPath];
        [self.fetchedResultsController.managedObjectContext deleteObject:n];
    }
}

#pragma mark - Utils
- (void)addNewNoteButton
{
    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                         target:self
                                                                         action:@selector(addNewNote:)];
    self.navigationItem.rightBarButtonItem = add;
}

#pragma mark - Actions
- (void)addNewNote:(id)sender
{
    [AGTNote noteWithName:@"Nueva nota" notebook:self.notebook context:self.fetchedResultsController.managedObjectContext];
}




@end
