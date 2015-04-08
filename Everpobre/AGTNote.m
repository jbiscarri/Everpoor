#import "AGTNote.h"
#import "AGTPhoto.h"

@interface AGTNote ()

// Private interface goes here.

@end

@implementation AGTNote

#pragma mark -  Class Methods
+(NSArray *) observableKeys{
    return @[AGTNoteAttributes.name, AGTNoteAttributes.text, AGTNoteRelationships.notebook, @"photo.photoData"];
}

+(instancetype) noteWithName:(NSString *) name
                    notebook:(AGTNotebook*) notebook
                     context:(NSManagedObjectContext *) context{
    
    AGTNote *n = [self insertInManagedObjectContext:context];
    
    n.creationDate = [NSDate date];
    n.name = name;
    n.notebook = notebook;
    n.photo = [AGTPhoto insertInManagedObjectContext:context];
    n.modificationDate = [NSDate date];
    
    return n;
}

#pragma mark - KVO
-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    
    self.modificationDate = [NSDate date];
    
}








@end
