//
//  BucketViewModel.h
//  AliyunOSSSDK-iOS-Example
//
//  Created by huaixu on 2018/7/9.
//  Copyright © 2018年 aliyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BucketViewModel : NSObject

- (void)createBucket;

- (void)listBucket;

- (void)getBucketInfo;

- (void)deleteBucket;

- (void)getBucketACL;

@end
