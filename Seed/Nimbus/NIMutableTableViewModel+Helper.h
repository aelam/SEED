//
//  Helper.h
//  client_eggorder_5
//
//  Created by Ryan Wang on 14/9/2.
//  Copyright (c) 2014年 tappal. All rights reserved.
//

#import "NIMutableTableViewModel.h"
#import <Nimbus/NICellCatalog.h>

@interface NIMutableTableViewModel (Helper)

- (void)removeAllSections;
- (NSArray *)removeObject:(id<NICellObject>)object;

@end
