//
//  EOSerializer.h
//  client_eggorder_5
//
//  Created by Ryan Wang on 14-3-27.
//  Copyright (c) 2014年 tappal. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EOSerializer <NSObject>

@required
- (instancetype)serialize:(NSDictionary *)info options:(NSUInteger)options;

@optional
+ (instancetype)instanceWithData:(NSDictionary *)info options:(NSUInteger)options;
+ (NSMutableArray *)serializesArray:(NSArray *)array options:(NSUInteger)options;

@end
