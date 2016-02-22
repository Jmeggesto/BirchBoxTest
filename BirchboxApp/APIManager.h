//
//  APIManager.h
//  BirchboxApp
//
//  Created by Jackie Meggesto on 2/22/16.
//  Copyright © 2016 Jackie Meggesto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIManager : NSObject

+(void)getProductID:(NSString*)productID
       withCompletionBlock:(void(^)(NSDictionary *data))completion;

@end
