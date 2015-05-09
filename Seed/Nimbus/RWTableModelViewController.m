//
//  RWTableModelViewController.m
//  Sagittarius
//
//  Created by Ryan Wang on 15/5/8.
//  Copyright (c) 2015年 Ryan Wang. All rights reserved.
//

#import "RWTableModelViewController.h"

@interface RWTableModelViewController ()


@end

@implementation RWTableModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadModel {
    self.tableModel = [[NIMutableTableViewModel alloc] initWithDelegate:(id)[NICellFactory class]];
    self.tableModel.delegate = self;
    self.tableView.dataSource = self.tableModel;
    self.tableView.delegate = self;
}


- (UITableViewCell *)tableViewModel:(NITableViewModel *)tableViewModel cellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath withObject:(id)object {
    UITableViewCell *cell = [NICellFactory tableViewModel:tableViewModel cellForTableView:tableView atIndexPath:indexPath withObject:object];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [NICellFactory tableView:tableView heightForRowAtIndexPath:indexPath model:self.tableModel];
}

@end
