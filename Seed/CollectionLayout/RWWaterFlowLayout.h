//
//  RWWaterFlowLayout.h
//  Sagittarius
//
//  Created by Ryan Wang on 15/5/9.
//  Copyright (c) 2015年 Ryan Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RWWaterFlowLayout : UICollectionViewLayout

@property (nonatomic) CGFloat minimumLineSpacing;
@property (nonatomic) CGFloat minimumInteritemSpacing;
@property (nonatomic) NSUInteger maxColumnCount; //default is 3, max is 10
@property (nonatomic) CGSize headerReferenceSize;
@property (nonatomic) CGSize footerReferenceSize;
@property (nonatomic) UIEdgeInsets sectionInset;

@end
