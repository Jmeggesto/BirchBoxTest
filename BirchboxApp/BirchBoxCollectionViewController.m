//
//  BirchBoxCollectionViewController.m
//  BirchboxApp
//
//  Created by Jackie Meggesto on 2/22/16.
//  Copyright © 2016 Jackie Meggesto. All rights reserved.
//

#import "BirchBoxCollectionViewCell.h"
#import "APIManager.h"
#import "BirchBoxCollectionViewController.h"
#import "ProductData.h"

@interface BirchBoxCollectionViewController ()

@property (nonatomic) NSMutableArray<ProductData*>* productData;

@end

@implementation BirchBoxCollectionViewController

static NSString * const reuseIdentifier = @"BirchBoxCell";

- (void)viewDidLoad
{
    
//    UIView* navigationItemView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, self.view.frame.origin.x, 80)];
//    [navigationItemView setBackgroundColor:[UIColor colorWithRed:124.0
//                                                           green:151.0
//                                                            blue:176.0 alpha:1.0]];
//    
//    UILabel *birchBoxLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 50, 20)];
//    [birchBoxLabel setTextColor:[UIColor whiteColor]];
//    [birchBoxLabel setBackgroundColor:[UIColor clearColor]];
//    [birchBoxLabel setFont:[UIFont fontWithName: @"Avenir Black" size: 40.0f]];
//    [birchBoxLabel setCenter:navigationItemView.center];
//    [navigationItemView addSubview:birchBoxLabel];
//    
//    [self.navigationItem setTitle:@"BirchBox"];
//    [self.navigationItem setTitleView:navigationItemView];
    
    [self setUpProductData];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
//    [self.collectionView registerClass:[BirchBoxCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    
}

-(void)setUpProductData
{
    
    //trying to make sure that the data gets setup when the view loads, so the customer doesn't have to deal with some data but not all being there by the time the view loads
    
    self.productData = [[NSMutableArray alloc]init];
    
    NSArray* productIDArray = @[@"11307",
                                @"20953",
                                @"20060"];
    for(NSString* productID in productIDArray) {
        
        [APIManager getProductID:productID
             withCompletionBlock:^(NSDictionary *data) {
                 
                 ProductData* productData = [[ProductData alloc]initWithProductData:data];
                 NSLog(@"%@", productData);
                 
                 [self.productData addObject:productData];
                 
             }];
    }
    
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
#warning Incomplete implementation, return the number of items
    return [self.productData count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BirchBoxCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSLog(@"hey");
    cell.label.text = @"hey";
    
    return cell;
}

@end
