//
//  BirchBoxCollectionViewController.m
//  BirchboxApp
//
//  Created by Jackie Meggesto on 2/22/16.
//  Copyright © 2016 Jackie Meggesto. All rights reserved.
//

#import "APIManager.h"
#import "BirchBoxCollectionViewController.h"
#import "ProductData.h"

@interface BirchBoxCollectionViewController ()

@property (nonatomic) NSMutableArray<ProductData*>* productData;

@end

@implementation BirchBoxCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad
{
    [self setUpProductData];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    NSLog(@"%@", self.productData);
    
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
    return self.productData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
}

@end
