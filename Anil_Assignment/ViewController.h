//
//  ViewController.h
//  Anil_Assignment
//
//  Created by Anilkumar on 21/11/16.
//  Copyright © 2016 Anilkumar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) NSData *jsonData;
@property (nonatomic, weak) IBOutlet UITableView *tableview;
//@property (nonatomic, strong) NSMutableArray *titleArray, *imagesArray,*productIdArray;
@property (nonatomic, strong) NSMutableArray *imagesArray,*titleArray;


@end

