#import "_AGTNote.h"

@interface AGTNote : _AGTNote {}


+(instancetype) noteWithName:(NSString *) name
                    notebook:(AGTNotebook*) notebook
                     context:(NSManagedObjectContext *) context;

@end
