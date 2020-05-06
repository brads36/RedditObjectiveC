//
//  WBBPost.m
//  RedditObjectiveC
//
//  Created by Bryce Bradshaw on 5/6/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

#import "WBBPost.h"

@implementation WBBPost

- (instancetype)initWithTitle:(NSString *)title ups:(NSInteger)ups commentCount:(NSInteger)commentCount
{
    self = [super init];
    if (self) {
        _title = title;
        _ups = ups;
        _commentCount = commentCount;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSDictionary *dataDictionary = dictionary[@"data"];
    
    NSString *title = dataDictionary[@"title"];
    NSInteger ups = [dataDictionary[@"ups"] intValue];
    NSInteger commentCount = [dataDictionary[@"num_comments"] intValue];
    
    return [self initWithTitle:title ups:ups commentCount:commentCount];
}

@end
