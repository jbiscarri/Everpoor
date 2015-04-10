//
//  AGTNoteViewController.h
//  Everpobre
//
//  Created by Joan on 09/04/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

@import UIKit;
@class AGTNote;

@interface AGTNoteViewController : UIViewController<UITextFieldDelegate, UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *creationDate;
@property (weak, nonatomic) IBOutlet UILabel *modificationDate;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextView *text;
@property (strong, nonatomic) AGTNote *model;
@property (weak, nonatomic) IBOutlet UIButton *viewPhotoButton;

@property (assign, nonatomic) CGFloat textViewFrame;


- (id)initWithModel:(AGTNote*)note;
- (IBAction)displayPhoto:(id)sender;
- (IBAction)hideKeyboard:(id)sender;

@end
