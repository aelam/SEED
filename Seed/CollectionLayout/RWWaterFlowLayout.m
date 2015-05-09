//
//  RWWaterFlowLayout.m
//  Sagittarius
//
//  Created by Ryan Wang on 15/5/9.
//  Copyright (c) 2015年 Ryan Wang. All rights reserved.
//

#import "RWWaterFlowLayout.h"
@interface UICollectionViewFlowLayout ()

- (void)_fetchItemsInfoForRect:(CGRect)rect;
- (void)_getSizingInfos:(id)d;
@end


@interface RWWaterFlowLayout ()

@end

@implementation RWWaterFlowLayout {
    NSMutableDictionary *_itemSizes;
    NSUInteger          _sectionCount;
    CGSize              _collectionViewContentSize;
    
    NSMutableArray      *_visibleIndexPaths;
    
    CGSize              _itemSize;
    NSMutableDictionary *_columnHeights;
    
}

- (instancetype)init {
    if (self = [super init]) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    _maxColumnCount = 3;
    _itemSize = CGSizeMake(160, 160);
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    _itemSizes = [NSMutableDictionary dictionary];
    _visibleIndexPaths = [NSMutableArray array];
    _columnHeights = [NSMutableDictionary dictionary];
}

- (void)setMaxColumnCount:(NSUInteger)maxColumnCount {
    if(_maxColumnCount != maxColumnCount) {
        _maxColumnCount = maxColumnCount;
    }
}

-(void)prepareLayout
{
    [super prepareLayout];
    
    id <UICollectionViewDelegateFlowLayout> flowoutDelegate = (id <UICollectionViewDelegateFlowLayout>)self.collectionView.delegate;

    
    CGFloat numberOfSections = [self.collectionView numberOfSections];
    CGFloat numberOfItems = 0;
    
    CGFloat minimumInteritemSpacing = self.minimumInteritemSpacing;
    CGFloat minimumLineSpacing = self.minimumLineSpacing;
    
    CGFloat viewWidth = self.collectionView.contentSize.width;
    
    CGFloat currentX = 0;
    CGFloat currentY = 0;
    CGFloat minY = 0; //

    CGPoint minXYPosition = CGPointZero;
    CGPoint maxXYPosition = CGPointZero;

    for(int i = 0 ; i < numberOfSections; i++ ) {
        numberOfItems = [self.collectionView numberOfItemsInSection:i];
        
        for(int j = 0; j < numberOfItems; j++ ) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:j inSection:i];
            // item
            CGSize itemSize = [flowoutDelegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
            CGRect itemRect = CGRectMake(minXYPosition.x, minXYPosition.y, itemSize.width, itemSize.height);
            [_itemSizes setObject:[NSValue valueWithCGRect:itemRect] forKey:indexPath];

            minXYPosition.x = minXYPosition.x + minimumInteritemSpacing;
            if (minXYPosition.x + itemSize.width >= viewWidth) {
                NSLog(@"换行 %d", j);
                
//                maxXYPosition
            }
            
            
            currentX = currentX + itemSize.width + minimumInteritemSpacing;
            if (currentX >= viewWidth) {
                // 换行
                currentX = 0;
                minY = currentY;
                
            } else {
                // 不换行
                NSLog(@"不换行 %d", j);
                currentY = MAX(currentY, minY + itemSize.height + minimumLineSpacing);
            }
            NSLog(@"pointX : %f Y: %f", currentX, currentY);
            
        }
    }
    
    _collectionViewContentSize = CGSizeMake(currentX, currentY);
    
}


//
//- (void)_fetchItemsInfoForRect:(CGRect)rect {
////    if ([super respondsToSelector:_cmd]) {
////    }
//    [super _fetchItemsInfoForRect:rect];
////    [self.collectionView ]
////    NSLog(@"rect : %@", NSStringFromCGRect(rect));
////    NSLog(@"self.collectionView.bounds = %@", NSStringFromCGRect(self.collectionView.bounds));
//}

//- (void)_getSizingInfos:(id)d {
////    [super _getSizingInfos:d];
//}
//

- (void)fetchItemsInfoForRect:(CGRect)rect {
    [_visibleIndexPaths removeAllObjects];
    for(NSIndexPath *indexPath in [_itemSizes allKeys]) {
        NSValue *rectValue = _itemSizes[indexPath];
        CGRect itemRect = [rectValue CGRectValue];
        if (CGRectIntersectsRect(itemRect, rect)) {
            [_visibleIndexPaths addObject:indexPath];
        }
    }
}

-(CGSize)collectionViewContentSize
{

    return _collectionViewContentSize;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}


-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *attributes = [NSMutableArray array];
    
    [self fetchItemsInfoForRect:rect];
    
    for(NSIndexPath *indexPath in _visibleIndexPaths) {
        UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        CGRect rect =  [[_itemSizes objectForKey:indexPath] CGRectValue];
        attr.frame = rect;
        attr.size = rect.size;
//        NSLog(@" rect : %@", NSStringFromCGRect(rect));
        [attributes addObject:attr];
    }
    
    return attributes;
}

- (UICollectionViewLayoutAttributes *)initialLayoutAttributesForInsertedItemAtIndexPath:(NSIndexPath*)itemIndexPath
{
    
    UICollectionViewLayoutAttributes* attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    attributes.alpha = 0.0;
//    attributes.center = CGPointMake(_center.x, _center.y);
    
    return attributes;
}

- (UICollectionViewLayoutAttributes *)finalLayoutAttributesForDeletedItemAtIndexPath:(NSIndexPath*)itemIndexPath
{
    
    UICollectionViewLayoutAttributes* attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    attributes.alpha = 0.0;
    
//    attributes.center = CGPointMake(_center.x, _center.y);
    
    attributes.transform3D = CATransform3DMakeScale(0.1, 0.1, 1.0);
    
    return attributes;
}

@end
