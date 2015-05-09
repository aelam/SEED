//
//  NIMutableCollectionViewModel+EOHelper.m
//  Eggorder
//
//  Created by ryan on 10/23/14.
//  Copyright (c) 2014 TapPal. All rights reserved.
//

#import "NIMutableCollectionViewModel+EOHelper.h"

@implementation NIMutableCollectionViewModel (EOHelper)

- (void)removeAllSections {
    for(int i = (int)[self sections].count-1; i >= 0 ; i--) {
        [self removeSectionAtIndex:i];
    }
}

@end
