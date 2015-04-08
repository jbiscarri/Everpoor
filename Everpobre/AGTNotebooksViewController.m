//
//  AGTNotebooksViewController.m
//  Everpobre
//
//  Created by Joan on 08/04/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "AGTNotebooksViewController.h"
#import "AGTNotebook.h"

@interface AGTNotebooksViewController ()

@end

@implementation AGTNotebooksViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Everpobre";
    [self addNewNotebookButton];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AGTNotebook *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    static NSString *cellID = @"notebookCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    cell.textLabel.text = nb.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)nb.notes.count];
    return cell;
}


#pragma mark - Utils
- (void)addNewNotebookButton
{
    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                         target:self
                                                                         action:@selector(addNewNoteBook:)];
    self.navigationItem.rightBarButtonItem = add;
}

#pragma mark - Actions
- (void)addNewNoteBook:(id)sender
{
    [AGTNotebook notebookWithName:@"Nueva libreta" context:self.fetchedResultsController.managedObjectContext];
}

#pragma mark - UITableViewDelegate

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        AGTNotebook *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
        [self.fetchedResultsController.managedObjectContext deleteObject:nb];
    }
}



@end
