//
//  Helper.m
//  client_eggorder_5
//
//  Created by Ryan Wang on 14/9/2.
//  Copyright (c) 2014年 tappal. All rights reserved.
//

#import "NIMutableTableViewModel+Helper.h"
#import <Nimbus/NIMutableTableViewModel.h>
#import <Nimbus/NITableViewModel+Private.h>

@implementation NIMutableTableViewModel (Helper)

- (void)removeAllSections {
    for(int i = (int)[self sections].count-1; i >= 0 ; i--) {
        [self removeSectionAtIndex:i];
    }
}

- (NSArray *)removeObject:(id<NICellObject>)object {
    NSIndexPath *indexPath = [self indexPathForObject:object];
    if (indexPath == nil) {
        return nil;
    }
    return [self removeObjectAtIndexPath:indexPath];
}


@end
