//
//  RWCollectionModelViewController.h
//  Sagittarius
//
//  Created by Ryan Wang on 15/5/8.
//  Copyright (c) 2015年 Ryan Wang. All rights reserved.
//

#import "RWViewController.h"
#import "NIMutableCollectionViewModel+EOHelper.h"

@interface RWCollectionModelViewController : RWViewController <UICollectionViewDelegate,NICollectionViewModelDelegate>

@property (nonatomic, strong) NIMutableCollectionViewModel *collectionModel;
@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;

- (void)loadModel;

@end
