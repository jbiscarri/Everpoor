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
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
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
    
    picker.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:picker
                       animated:YES
                     completion:^{ }];

}

- (IBAction)applyFilter:(id)sender {
    CIContext *ctxt = [CIContext contextWithOptions:nil];
    CIImage *inputImg = [CIImage imageWithCGImage:self.model.image.CGImage];
    CIFilter *vintage = [CIFilter filterWithName:@"CIFalseColor"];
    [vintage setValue:inputImg forKey:@"inputImage"];
    CIImage *outputImg = vintage.outputImage;
    
    CGImageRef out = nil;
    out = [ctxt createCGImage:outputImg fromRect:outputImg.extent];
           
    self.model.image = [UIImage imageWithCGImage:out];
    CGImageRelease(out);
    self.photoView.image = self.model.image;

    
}

- (IBAction)deletePhoto:(id)sender {
    self.model.image = nil;
    CGRect oldRect = self.photoView.bounds;
    [UIView animateWithDuration:.5
                     animations:^{
                         self.photoView.alpha = 0;
                         self.photoView.bounds = CGRectZero;
                         self.photoView.transform = CGAffineTransformMakeRotation(M_PI);
                     } completion:^(BOOL finished) {
                            self.photoView.image = nil;
                         self.photoView.alpha = 1;
                         self.photoView.bounds = oldRect;
                         self.photoView.transform = CGAffineTransformIdentity;
                     }];

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