//
//  ProductData.m
//  BirchboxApp
//
//  Created by Jackie Meggesto on 2/22/16.
//  Copyright © 2016 Jackie Meggesto. All rights reserved.
//


#import "ProductData.h"

@implementation ProductData

-(id)initWithProductData:(NSDictionary*)data
{
    
    if(self = [super init]) {
        
        self.name = data[@"name"];
        self.productDescription = data[@"description"];
        self.howToUse = data[@"how_to_use"];
        self.ingredients = data[@"ingredients"];
        self.reviewCount = [NSString stringWithFormat:@"%ld", (long)data[@"review_count"]];
        self.price = [NSString stringWithFormat:@"$%@", data[@"price"][@"amount"]];
        self.brand = data[@"brand"];
        self.pageButtonType = data[@"page_button_type"];
        self.imageURL = [data[@"carousel_image"] firstObject][@"url"];
        

        return self;
    } else {
        return nil;
        
    }
}

@end
