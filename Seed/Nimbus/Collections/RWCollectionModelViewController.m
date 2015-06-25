//
//  RWCollectionModelViewController.m
//  Sagittarius
//
//  Created by Ryan Wang on 15/5/8.
//  Copyright (c) 2015年 Ryan Wang. All rights reserved.
//

#import "RWCollectionModelViewController.h"

@interface RWCollectionModelViewController () 

@end

@implementation RWCollectionModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UICollectionViewCell *)collectionViewModel:(NICollectionViewModel *)collectionViewModel
                        cellForCollectionView:(UICollectionView *)collectionView
                                  atIndexPath:(NSIndexPath *)indexPath
                                   withObject:(id)object {
    UICollectionViewCell *cell = [NICollectionViewCellFactory collectionViewModel:self.collectionModel cellForCollectionView:collectionView atIndexPath:indexPath withObject:object];
    
    return cell;
}

- (void)loadModel {
    self.collectionModel = [[NIMutableCollectionViewModel alloc] initWithDelegate:(id)[NICollectionViewCellFactory class]];
    self.collectionView.dataSource = self.collectionModel;
    self.collectionView.delegate = self;
}

- (void)dealloc {
    self.collectionView.delegate = nil;
    self.collectionView.dataSource = nil;
    self.collectionView = nil;
    self.collectionModel.delegate = nil;
    self.collectionModel = nil;
}

@end
