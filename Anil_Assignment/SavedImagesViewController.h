//
//  SavedImagesViewController.h
//  Anil_Assignment
//
//  Created by Anilkumar on 21/11/16.
//  Copyright © 2016 Anilkumar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SavedImagesViewController : UIViewController<CAAnimationDelegate>
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *imagesArray;

@end
