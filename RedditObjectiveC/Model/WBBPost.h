//
//  WBBPost.h
//  RedditObjectiveC
//
//  Created by Bryce Bradshaw on 5/6/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WBBPost : NSObject

@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly) NSInteger ups;
@property (nonatomic, readonly) NSInteger commentCount;

- (instancetype)initWithTitle:(NSString *)title ups:(NSInteger)ups commentCount:(NSInteger)commentCount;

@end

NS_ASSUME_NONNULL_END
