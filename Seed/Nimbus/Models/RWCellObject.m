//
//  RWCellObject.m
//  Sagittarius
//
//  Created by Ryan Wang on 15/5/8.
//  Copyright (c) 2015年 Ryan Wang. All rights reserved.
//

#import "RWCellObject.h"
#import "RWTableModelCell.h"

@implementation RWCellObject

- (Class)cellClass {
    return [RWTableModelCell class];
}

+ (instancetype)instanceWithData:(NSDictionary *)info options:(NSUInteger)options{
    if (![info isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    id<EOSerializer> serializableObject = [[self alloc] init];
    [serializableObject serialize:info options:options];
    return serializableObject;
}


- (instancetype)serialize:(NSDictionary *)info options:(NSUInteger)options {
    return self;
}

+ (NSMutableArray *)serializesArray:(NSArray *)array options:(NSUInteger)options {
    if(![array isKindOfClass:[NSArray class]])
        return nil;
    NSMutableArray *objects = [NSMutableArray array];
    for(NSDictionary *info in array) {
        id<EOSerializer> serializableObject = [[self alloc] init];
        [serializableObject serialize:info options:options];
        [objects addObject:serializableObject];
    }
    return objects;
}

@end
