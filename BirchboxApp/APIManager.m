//
//  APIManager.m
//  BirchboxApp
//
//  Created by Jackie Meggesto on 2/22/16.
//  Copyright © 2016 Jackie Meggesto. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "APIManager.h"

@implementation APIManager



+(void)getProductID:(NSString*)productID
withCompletionBlock:(void(^)(NSDictionary *data))completion
{
    
    NSString* url = [NSString stringWithFormat:@"https://api.birchbox.com/products/%@", productID];
    
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    
    [manager GET:url
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
             completion(responseObject);
             
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Warning" message:@"There was an error in fetching this data" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
            [alert dismissViewControllerAnimated:YES completion:nil];
        }];

        [alert addAction:okAction];
        
        [alert presentViewController:alert animated:YES completion:nil];
        
    }];
  
    
    
}

@end
