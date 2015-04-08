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

@end
