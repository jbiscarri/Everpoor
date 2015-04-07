// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JBPhoto.h instead.

#import <CoreData/CoreData.h>

extern const struct JBPhotoAttributes {
	__unsafe_unretained NSString *photoData;
} JBPhotoAttributes;

extern const struct JBPhotoRelationships {
	__unsafe_unretained NSString *notes;
} JBPhotoRelationships;

@class JBNote;

@interface JBPhotoID : NSManagedObjectID {}
@end

@interface _JBPhoto : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) JBPhotoID* objectID;

@property (nonatomic, strong) NSData* photoData;

//- (BOOL)validatePhotoData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *notes;

- (NSMutableSet*)notesSet;

@end

@interface _JBPhoto (NotesCoreDataGeneratedAccessors)
- (void)addNotes:(NSSet*)value_;
- (void)removeNotes:(NSSet*)value_;
- (void)addNotesObject:(JBNote*)value_;
- (void)removeNotesObject:(JBNote*)value_;

@end

@interface _JBPhoto (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePhotoData;
- (void)setPrimitivePhotoData:(NSData*)value;

- (NSMutableSet*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet*)value;

@end
