//
//  WBBPostController.m
//  RedditObjectiveC
//
//  Created by Bryce Bradshaw on 5/6/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

#import "WBBPostController.h"
#import "WBBPost.h"

@implementation WBBPostController

// MARK: - Shared Instance
+ (instancetype)sharedInstance {
    static WBBPostController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        sharedInstance = [[WBBPostController alloc] init];
    });
    return sharedInstance;
}

// MARK: - BaseUrl
- (NSURL *)baseURL
{
    return [NSURL URLWithString:@"https://www.reddit.com/r"];
}


- (void)searchForPostWithSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray<WBBPost *> *, NSError *))completion
{
    // 1. Prepare URL
    NSURL *searchURL = [self baseURL];
    searchURL = [searchURL URLByAppendingPathComponent:searchTerm];
    searchURL = [searchURL URLByAppendingPathExtension:@"json"];
    
    // 2. Contact server / Start Task
    [[NSURLSession.sharedSession dataTaskWithRequest:searchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // 3. Error Handling
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            return completion(nil, error);
        }
        
        // 4. Check for Data
        if (!data)
        {
            NSLog(@"Error: No data returned.");
            return completion(nil, error);
        }
        
        // 5. decode Json Data
        NSDictionary *jsonTopLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        NSDictionary *postDataDictionary = jsonTopLevelDictionary[@"data"];
        NSArray *childrenArray = postDataDictionary[@"children"];
        
        // place holder array
        NSMutableArray *postsArray = [NSMutableArray array];
        
        for (NSDictionary *dataDictionary in childrenArray)
        {
            WBBPost *post = [[WBBPost alloc] initWithDictionary:dataDictionary];
            [postsArray addObject: post];
        }
        completion(postsArray, nil);
    }]resume];
}
@end
