//
//  WBBPostController.h
//  RedditObjectiveC
//
//  Created by Bryce Bradshaw on 5/6/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBBPost.h"

NS_ASSUME_NONNULL_BEGIN

@interface WBBPostController : NSObject

+ (instancetype)sharedInstance;

- (void)searchForPostWithSearchTerm:(NSString *)searchTerm completion:(void (^) (NSArray<WBBPost *> *posts, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
