//
//  Utility Class.m
//  Anil_Assignment
//
//  Created by Anilkumar on 21/11/16.
//  Copyright © 2016 Anilkumar. All rights reserved.
//

#import "Utility Class.h"
#import "AppDelegate.h"
#import "Coredata.h"
@implementation UtilityClass
{
   // NSManagedObjectContext *managedObjectcontext;

}
#define kAppDelegateAccessor ((AppDelegate *)[[UIApplication sharedApplication] delegate])

+(UtilityClass*)sharedInstance
{
    static UtilityClass *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    return _sharedInstance;
}
//insert data
-(void)insertUserInfo:(NSData*)imageRefId :(NSString*)title
{
    //  managedObjectcontext = kAppDelegateAccessor.managedObjectContext;
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *managedObjectContext = [appDelegate managedObjectContext];
    Coredata *coreDataClass = (Coredata *)[NSEntityDescription insertNewObjectForEntityForName:@"CollectionViewData" inManagedObjectContext:managedObjectContext];
   // NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:@"CollectionViewData" inManagedObjectContext:managedObjectContext];

    coreDataClass.img = imageRefId;
    coreDataClass.title=title;
    NSError *error = nil;
   // [object setValue:imageRefId forKey:@"img"];
    //[object setValue:title forKey:@"title"];
    if ([managedObjectContext save:&error]){
        NSLog(@"Data inserted successfully.");
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Selected image successfully saved." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        NSLog(@"Data insertion failed with error: %@",[error localizedDescription]);
    }
}
//fetch data

-(NSArray *)getAllImages{
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *managedObjectContext = nil;
    managedObjectContext = [appDelegate managedObjectContext];
    
    NSEntityDescription * existingUser= [NSEntityDescription entityForName:@"CollectionViewData" inManagedObjectContext:managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:existingUser];
    
    NSError *error;
    NSArray *objects = [managedObjectContext executeFetchRequest:request error:&error];
    
    return objects;
    
}

@end
