#import "AGTNotebook.h"

@interface AGTNotebook ()

// Private interface goes here.

@end

@implementation AGTNotebook

#pragma mark - Class Methods
+(NSArray *) observableKeys{
    return @[AGTNotebookAttributes.name, AGTNotebookRelationships.notes];
}

+(instancetype) notebookWithName:(NSString *) name
                         context:(NSManagedObjectContext *) context{
    
    
    AGTNotebook *nb = [self insertInManagedObjectContext:context];
    nb.name = name;
    nb.creationDate = [NSDate date];
    nb.modificationDate = [NSDate date];
    
    return nb;
}


#pragma mark - KVO
-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    
    self.modificationDate = [NSDate date];
}










@end
