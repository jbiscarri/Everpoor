//
//  PhotoViewController.m
//  Everpobre
//
//  Created by Joan on 10/04/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (id) initWithModel:(AGTPhoto*)model{
    if (self = [super initWithNibName:nil bundle:nil])
    {
        _model = model;
    }
    return self;
}
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.photoView.image = self.model.image;
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.model.image = self.photoView.image;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)takePicture:(id)sender {
    UIImagePickerController  *picker = [UIImagePickerController new];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    picker.delegate = self;
    
    [self presentViewController:picker
                       animated:YES
                     completion:^{ }];

}

- (IBAction)applyFilter:(id)sender {
}

- (IBAction)deletePhoto:(id)sender {
}

#pragma mark -  UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage * img = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.model.image = img;
    [self dismissViewControllerAnimated:YES
                             completion:^{ }];
}

@end