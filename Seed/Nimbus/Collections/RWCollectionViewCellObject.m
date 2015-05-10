//
//  RWCollectionViewCellObject.m
//  Sagittarius
//
//  Created by Ryan Wang on 15/5/8.
//  Copyright (c) 2015年 Ryan Wang. All rights reserved.
//

#import "RWCollectionViewCellObject.h"
#import "RWCollectionModelViewCell.h"

@implementation RWCollectionViewCellObject

- (Class)collectionViewCellClass {
    return [RWCollectionModelViewCell class];
}

- (UINib *)collectionViewCellNib {
    return nil;
}

@end
