//
//  Coredata.h
//  Anil_Assignment
//
//  Created by Anilkumar on 21/11/16.
//  Copyright © 2016 Anilkumar. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Coredata : NSManagedObject
@property (nonatomic, strong) NSData *img;
@property (nonatomic, strong) NSString *title;
@end
