//
//  OSSTableViewController.m
//  AliyunOSSSDK-iOS-Example
//
//  Created by huaixu on 2018/7/9.
//  Copyright © 2018年 aliyun. All rights reserved.
//

#import "OSSTableViewController.h"
#import "OSSTableViewCell.h"

@interface OSSTableViewController ()

@end

NSString * const tableViewCellReuseIdentifier = @"OSSTableViewCell";

@implementation OSSTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.tableView registerClass:[OSSTableViewCell class] forCellReuseIdentifier:tableViewCellReuseIdentifier];
    self.tableView.tableFooterView = [UIView new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OSSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellReuseIdentifier forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Bucket操作";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"Object操作";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"图片处理";
    }

//    cell.backgroundColor = [self randomColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO];
    
    if (indexPath.row == 0) {
        NSLog(@"跳转到Bucket操作页面");
    } else if (indexPath.row == 1) {
        NSLog(@"跳转到Object操作页面");
    } else if (indexPath.row == 2) {
        NSLog(@"跳转到image操作页面");
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    OSSTableViewCell *cell = (OSSTableViewCell *)sender;
    segue.destinationViewController.title = cell.textLabel.text;
}

- (UIColor *)randomColor {
    CGFloat r = arc4random() % 255 / 255.0;
    CGFloat g = arc4random() % 255 / 255.0;
    CGFloat b = arc4random() % 255 / 255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}

@end
