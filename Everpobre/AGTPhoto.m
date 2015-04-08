#import "AGTPhoto.h"

@interface AGTPhoto ()

// Private interface goes here.

@end

@implementation AGTPhoto

-(void) setImage:(UIImage *)image{
    
    // Convertir la UIImage en un NSData
    self.photoData = UIImageJPEGRepresentation(image, 0.9);
}

-(UIImage *) image{
    
    // Convertir la NSData en UIImage
    return [UIImage imageWithData:self.photoData];
}

@end
