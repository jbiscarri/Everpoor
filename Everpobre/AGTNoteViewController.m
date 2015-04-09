//
//  AGTNoteViewController.m
//  Everpobre
//
//  Created by Joan on 09/04/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "AGTNoteViewController.h"
#import "AGTNote.h"

@interface AGTNoteViewController ()

@end

@implementation AGTNoteViewController

- (id)initWithModel:(AGTNote*)note{
    if (self = [super initWithNibName:nil bundle:nil])
    {
        _model = note;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateStyle = NSDateFormatterShortStyle;
    self.creationDate.text = [dateFormatter stringFromDate:self.model.creationDate];
    self.modificationDate.text = [dateFormatter stringFromDate:self.model.modificationDate];
    
    self.name.text = self.model.name;
    self.text.text = self.model.text;
    
    [self setupKeyboardNotifications];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.model.name = self.name.text;
    self.model.text = self.text.text;
    [self tearDownKeyboardNotifications];
}

#pragma mark - Actions

- (IBAction)displayPhoto:(id)sender {
}

- (IBAction)hideKeyboard:(id)sender {
    [self.view endEditing:YES];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{

}

#pragma mark - Notifications
- (void)setupKeyboardNotifications{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(notifyThatKeyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    [nc addObserver:self selector:@selector(notifyThatKeyboardWillDisappear:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)tearDownKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)notifyThatKeyboardWillAppear:(NSNotification*)notification
{

}

- (void)notifyThatKeyboardWillDisappear:(NSNotification*)notification
{
    
}



@end
