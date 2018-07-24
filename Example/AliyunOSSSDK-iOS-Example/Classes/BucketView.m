//
//  BucketView.m
//  AliyunOSSSDK-iOS-Example
//
//  Created by huaixu on 2018/7/9.
//  Copyright © 2018年 aliyun. All rights reserved.
//

#import "BucketView.h"
#import "BucketViewModel.h"


@interface BucketView()

@property (nonatomic, strong) BucketViewModel *viewModel;

@end

@implementation BucketView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _viewModel = [BucketViewModel new];
}

- (IBAction)CreateBucketAction:(id)sender {
    [_viewModel createBucket];
}

- (IBAction)ListBucketAction:(id)sender {
    [_viewModel listBucket];
}

- (IBAction)GetBucketInfoAction:(id)sender {
    [_viewModel getBucketInfo];
}

- (IBAction)DeleteBucketAction:(id)sender {
    [_viewModel deleteBucket];
}

- (IBAction)GetBucketACLAction:(id)sender {
    [_viewModel getBucketACL];
}


@end
