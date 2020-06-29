//
//  RequestHandler.m
//  MVChallengeMobile
//
//  Created by shweta dodiya on 2020-06-18.
//  Copyright © 2020 shweta dodiya. All rights reserved.
//

#import "RequestHandler.h"

@implementation RequestHandler

-(void)getRequestWithString:(NSString *)urlString methodType:(NSString *)type
{
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];

    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: self delegateQueue: [NSOperationQueue mainQueue]];
   // urlString = @"https://api.unsplash.com/photos?page=1&client_id=QV8a4T6ENyuyoPRxYuNLxDSIbeMRgUndYS9Q7nnOi6E";
    NSURL * url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:type];

    NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithRequest:urlRequest];
    [dataTask resume];
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
didReceiveResponse:(NSURLResponse *)response
 completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler
{
    completionHandler(NSURLSessionResponseAllow);
}
 
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
    didReceiveData:(NSData *)data
{
    
    NSError *error = nil;
  
    NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data
    options:NSJSONReadingFragmentsAllowed
      error:&error];
    
    if (error) {
        NSLog(@"JSON Error: %@", error);
        json = [self JSONFromFile];
        [self.delegate fetchResponse:json];

        //[self.delegate fetchError:error.description];
        
    }else{
        [self.delegate fetchResponse:json];
    }

    
}
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task
didCompleteWithError:(NSError *)error
{
    if(error == nil)
    {
    }
    else
    {
        NSLog(@"Error %@",[error userInfo]);
        if(error.code == -1009){
            [self.delegate fetchError:INTERNETCONNECTION];

        }
    }
}
- (NSMutableArray *)JSONFromFile
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"JsonResponse" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}
@end
