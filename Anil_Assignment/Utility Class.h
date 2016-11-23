//
//  Utility Class.h
//  Anil_Assignment
//
//  Created by Anilkumar on 21/11/16.
//  Copyright © 2016 Anilkumar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"
#import <UIKit/UIKit.h>

@interface UtilityClass : NSObject

+(UtilityClass*)sharedInstance;
@property (nonatomic, strong) NSMutableArray *productDetailArray,*variantArray,*selectedKeysArray,*userSelectedDataArray;
@property (nonatomic, strong) NSMutableDictionary *selectedDataDictionary;
//insert data to coredata
-(void)insertUserInfo:(NSData*)imageRefId :(NSString*)title;
//fetch data
-(NSArray *)getAllImages;

@end
