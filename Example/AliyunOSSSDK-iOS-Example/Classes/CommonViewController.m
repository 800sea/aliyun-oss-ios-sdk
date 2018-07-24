//
//  CommonViewController.m
//  AliyunOSSSDK-iOS-Example
//
//  Created by huaixu on 2018/7/9.
//  Copyright © 2018年 aliyun. All rights reserved.
//

#import "CommonViewController.h"
#import "BucketView.h"
#import "ImageOperationView.h"
#import "ObjectView.h"

@interface CommonViewController ()
@property (weak, nonatomic) IBOutlet BucketView *bucketView;
@property (weak, nonatomic) IBOutlet ObjectView *objectView;
@property (weak, nonatomic) IBOutlet ImageOperationView *imageView;

@end

@implementation CommonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([self.title isEqualToString:@"Bucket操作"]) {
        [_objectView removeFromSuperview];
        [_imageView removeFromSuperview];
    } else if ([self.title isEqualToString:@"Object操作"]) {
        [_bucketView removeFromSuperview];
        [_imageView removeFromSuperview];
    } else if ([self.title isEqualToString:@"图片处理"]) {
        [_objectView removeFromSuperview];
        [_bucketView removeFromSuperview];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
