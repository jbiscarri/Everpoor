//
//  AGTNoteViewController.m
//  Everpobre
//
//  Created by Joan on 09/04/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "AGTNoteViewController.h"
#import "PhotoViewController.h"
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
    self.textViewFrame = self.text.frame.size.height;
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
    PhotoViewController *pVC = [[PhotoViewController alloc] initWithModel:self.model.photo];
    [self.navigationController pushViewController:pVC animated:YES];
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
    double duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    NSValue *wrappedFrame = [notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect kbdFrame = [wrappedFrame CGRectValue];
    CGRect currentFrame = self.text.frame;
    CGRect newRect = CGRectMake(currentFrame.origin.x, currentFrame.origin.y, currentFrame.size.width, currentFrame.size.height - kbdFrame.size.height + self.viewPhotoButton.frame.size.height - 10);
    [UIView animateWithDuration:duration animations:^{
        self.text.frame = newRect;
    }];
}

- (void)notifyThatKeyboardWillDisappear:(NSNotification*)notification
{
    double duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        self.text.frame = CGRectMake(8, 148, self.text.frame.size.width, self.textViewFrame);
    }];

}



@end
