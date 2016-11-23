//
//  SavedImagesViewController.m
//  Anil_Assignment
//
//  Created by Anilkumar on 21/11/16.
//  Copyright © 2016 Anilkumar. All rights reserved.
//

#import "SavedImagesViewController.h"
#import "Utility Class.h"
#import "Coredata.h"
@interface SavedImagesViewController ()

@end

@implementation SavedImagesViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.title=NSLocalizedString(@"Saved Images", nil);

    self.imagesArray=[[UtilityClass sharedInstance]getAllImages];

//    NSArray *copy = [self.imagesArray copy];
//    //remove duplicate values from array
//    NSInteger index = [copy count] - 1;
//    
//    for (id object in [copy reverseObjectEnumerator])
//    {
//        if ([self.imagesArray indexOfObject:object inRange:NSMakeRange(0, index)] != NSNotFound)
//        {
//            [self.imagesArray removeObjectAtIndex:index];
//        }
//        index--;
//    }
    NSLog(@"self.fetchDataArray %@", self.imagesArray);
  //  NSLog(@"self.fetcharray %@",self.fetchDataArray);
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self animateView];
}
//custom animation
-(void)animateView{
    //Code to animate 
   
    CATransition *transition = nil;
    transition = [CATransition animation];
    transition.duration = 1.5;//kAnimationDuration
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype =kCATransitionFromBottom ;
    transition.delegate = self;
    [self.view.layer addAnimation:transition forKey:nil];
}
#pragma UICollectionView Delegate & Data Source methods
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //  NSMutableArray *sectionArray = [self.dataArray objectAtIndex:section];
    return [self.imagesArray count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cellIdentifier";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    //for imageview
    Coredata *dataObj=[self.imagesArray objectAtIndex:indexPath.item];
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
   // NSData * dataBytes = [[self.imagesArray objectAtIndex:indexPath.item] data];
    
    recipeImageView.image = [UIImage imageWithData:dataObj.img];
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:200];
    titleLabel.text=dataObj.title;


    /*        dispatch_async(dispatch_get_main_queue(), ^{
     recipeImageView.image = image;
     [activityView stopAnimating];
     [activityView setHidesWhenStopped:YES];
     });
*/
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
