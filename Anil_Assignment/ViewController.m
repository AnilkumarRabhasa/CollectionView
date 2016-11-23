//
//  ViewController.m
//  Anil_Assignment
//
//  Created by Anilkumar on 21/11/16.
//  Copyright © 2016 Anilkumar. All rights reserved.
//

#import "ViewController.h"
#import "Utility Class.h"
#import "SavedImagesViewController.h"
#import "TableViewCell.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title=NSLocalizedString(@"Home", nil);
    [self.tableview registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil]
  forCellReuseIdentifier:@"TableViewCell"];

    self.imagesArray=[[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"aircel"],[UIImage imageNamed:@"airtel"],[UIImage imageNamed:@"bsnl"],[UIImage imageNamed:@"docomo"],[UIImage imageNamed:@"idea"],[UIImage imageNamed:@"loop"],[UIImage imageNamed:@"mtnl"],[UIImage imageNamed:@"mts"],[UIImage imageNamed:@"reliance"],[UIImage imageNamed:@"tatawalky"],[UIImage imageNamed:@"uninor"],[UIImage imageNamed:@"videocon"],[UIImage imageNamed:@"vodafone"], nil];

    self.titleArray=[[NSMutableArray alloc] initWithObjects:@"aircel",@"airtel",@"bsnl",@"docomo",@"idea",@"loop",@"mtnl",@"mts",@"reliance",@"tatawalky",@"uninor",@"videocon",@"vodafone", nil];

    //right bar button
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Saved Images"
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(savedImagesView)];
    self.navigationItem.rightBarButtonItem = flipButton;
}

//navigate to saved images screen
-(void)savedImagesView
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    SavedImagesViewController *expandVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"SavedImagesViewController"];
    [self.navigationController pushViewController:expandVC animated:NO];
    
}
#pragma mark UItableview datasource and delegate methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellIdentifier=@"cell Identifier";
    TableViewCell *tblCell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (tblCell==nil) {
        tblCell=[[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return tblCell;

}
#pragma mark UICollectionView Delegate & Data Source methods
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//      NSMutableArray *sectionArray = [self.dataArray objectAtIndex:section];
        return [self.imagesArray count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Identifier1";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];   //for imageview
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    
    UIImage *image;
//    if ([_imagesArray count] > 0){
//        int randomIndex = arc4random()%[_imagesArray count];
//        image = [_imagesArray objectAtIndex:randomIndex];
//    }
            image = [_imagesArray objectAtIndex:indexPath.item];

    recipeImageView.image=image;
    //for title label
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:200];
    titleLabel.text=[self.titleArray objectAtIndex:indexPath.item];

    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:NSLocalizedString(@"Alert",nil)
                                          message:NSLocalizedString(@"Do you want to save selected image?",nil)
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"Cancel action");
                                   }];
    
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"OK action");
                                       //save image reference
                                       UIImage *image=[self.imagesArray objectAtIndex:indexPath.item];
                                       NSData *imageData = UIImagePNGRepresentation(image);

                                       [[UtilityClass sharedInstance] insertUserInfo:imageData :[self.titleArray objectAtIndex:indexPath.item]];
                                   }];
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
