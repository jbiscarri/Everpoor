//
//  PhotoViewController.h
//  Everpobre
//
//  Created by Joan on 10/04/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGTPhoto.h"


@interface PhotoViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (nonatomic, strong) AGTPhoto *model;

- (IBAction)takePicture:(id)sender;
- (IBAction)applyFilter:(id)sender;
- (IBAction)deletePhoto:(id)sender;

- (id)initWithModel:(AGTPhoto*)model;

@end
