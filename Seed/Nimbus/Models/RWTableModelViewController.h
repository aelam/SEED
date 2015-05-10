//
//  RWTableModelViewController.h
//  Sagittarius
//
//  Created by Ryan Wang on 15/5/8.
//  Copyright (c) 2015年 Ryan Wang. All rights reserved.
//

#import "RWViewController.h"
#import "NIMutableTableViewModel+Helper.h"

@interface RWTableModelViewController : RWViewController <UITableViewDelegate, NIMutableTableViewModelDelegate>

@property (nonatomic, strong) NIMutableTableViewModel *tableModel;
@property (nonatomic, strong) IBOutlet UITableView *tableView;

- (void)loadModel;

@end
