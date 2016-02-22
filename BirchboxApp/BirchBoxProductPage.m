//
//  BirchBoxProductPage.m
//  BirchboxApp
//
//  Created by Jackie Meggesto on 2/22/16.
//  Copyright © 2016 Jackie Meggesto. All rights reserved.
//

#import <UIImageView+AFNetworking.h>
#import <AFNetworking/AFNetworking.h>
#import "BirchBoxProductPage.h"
#import "APIManager.h"
#import "ProductData.h"

@interface BirchBoxProductPage ()

@property (nonatomic) NSMutableArray<ProductData*>* productData;

@property (weak, nonatomic) IBOutlet UIImageView *ProductImage;
@property (weak, nonatomic) IBOutlet UILabel *productTitle;
@property (weak, nonatomic) IBOutlet UILabel *reviewCount;
@property (weak, nonatomic) IBOutlet UILabel *productPrice;
@property (weak, nonatomic) IBOutlet UIButton *button;

@property (nonatomic) UISwipeGestureRecognizer* leftSwipe;
@property (nonatomic) UISwipeGestureRecognizer* rightSwipe;


@property (nonatomic) BOOL isFirstInStack;

@end

@implementation BirchBoxProductPage

- (void)viewDidLoad
{
    NSLog(@"%d", self.isFirstInStack);
    [super viewDidLoad];
    [self setUpProductData];
    self.isFirstInStack = YES;
    [self setUpGestures];
   
}
-(void)setUpGestures
{
    
    self.leftSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipe:)];
    self.leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:self.leftSwipe];
    
    self.rightSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipe:)];
    self.rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:self.rightSwipe];
    
}
-(void)handleSwipe:(UISwipeGestureRecognizer*)gesture{
    
    switch (gesture.direction) {
        case UISwipeGestureRecognizerDirectionLeft:
            if(!self.isFirstInStack) {
                
                [self.navigationController popViewControllerAnimated:YES];
            }
            break;
        case UISwipeGestureRecognizerDirectionRight:
            if(self.productData.count >0){
                
                BirchBoxProductPage* productPage = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductPage"];
                productPage.isFirstInStack = NO;
                [self.navigationController pushViewController:productPage animated:YES];
                
            }
            break;
        default:
            NSLog(@"something's wrong");
            break;
    }
    
    
}


-(void)setUpProductData
{
    if(self.isFirstInStack){}
    self.productData = [[NSMutableArray alloc]init];
    
    NSMutableArray* productIDArray = [[NSMutableArray alloc]initWithObjects:@"11307",
                                                                             @"20953",
                                                                             @"20060", nil];
    
    
    
    for(NSString* productID in productIDArray){
        
        [APIManager getProductID:productID withCompletionBlock:^(NSDictionary *data) {
           
            ProductData* productData = [[ProductData alloc]initWithProductData:data];
            self.productTitle.text = productData.name;
            self.reviewCount.text = [NSString stringWithFormat:@"%ld", (long)productData.reviewCount];
            self.productPrice.text = productData.price;
            
            NSURL *url = [NSURL URLWithString:productData.imageURL];
            NSURLRequest* urlRequest = [NSURLRequest requestWithURL:url];
            
            [self.ProductImage setImageWithURLRequest:urlRequest placeholderImage:nil success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
                
                self.ProductImage.image = image;
                
            } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
                
                NSLog(@"error");
            }];
            
    
            [self.productData addObject:productData];
            
        }];
        
        
    }
    

}
@end
