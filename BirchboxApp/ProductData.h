//
//  ProductData.h
//  BirchboxApp
//
//  Created by Jackie Meggesto on 2/22/16.
//  Copyright © 2016 Jackie Meggesto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductData : NSObject

@property (nonatomic) NSString* name;
@property (nonatomic) NSString* reviewCount;
@property (nonatomic) NSString* price;
@property (nonatomic) NSString* productDescription;
@property (nonatomic) NSString* howToUse;
@property (nonatomic) NSString* ingredients;
@property (nonatomic) NSString* brand;
@property (nonatomic) NSString* pageButtonType;
@property (nonatomic) NSString* imageURL;



-(id)initWithProductData:(NSDictionary*)data;

@end
