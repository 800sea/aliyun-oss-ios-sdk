//
//  BucketViewModel.m
//  AliyunOSSSDK-iOS-Example
//
//  Created by huaixu on 2018/7/9.
//  Copyright © 2018年 aliyun. All rights reserved.
//

#import "BucketViewModel.h"
#import "OSSTransferUtil.h"

@interface BucketViewModel()

@end

@implementation BucketViewModel

- (void)createBucket {
    OSSCreateBucketRequest *createBucketRequest = [OSSCreateBucketRequest new];
    createBucketRequest.bucketName = OSS_BUCKET_SAMPLE;
    
    OSSTask *task = [[OSSTransferUtil sharedInstance].ossClient createBucket:createBucketRequest];
    [task continueWithBlock:^id _Nullable(OSSTask * _Nonnull t) {
        if (t.error) {
            NSLog(@"failed to createBucket,error:%@",t.error);
        } else {
            NSLog(@"succeed to createBucket,result:%@",t.result);
        }
        return nil;
    }];
}

- (void)listBucket {
    OSSGetServiceRequest *listBucketRequest = [OSSGetServiceRequest new];
    
    OSSTask *task = [[OSSTransferUtil sharedInstance].ossClient getService:listBucketRequest];
    [task continueWithBlock:^id _Nullable(OSSTask * _Nonnull t) {
        if (t.error) {
            NSLog(@"failed to listBucket,error:%@",t.error);
        } else {
            NSLog(@"succeed to listBucket,result:%@",t.result);
        }
        return nil;
    }];
}

- (void)getBucketInfo {
    [OSSLog enableLog];
    OSSGetBucketInfoRequest *getBucketInfoRequest = [OSSGetBucketInfoRequest new];
    getBucketInfoRequest.bucketName = OSS_BUCKET_SAMPLE;
    
    OSSTask *task = [[OSSTransferUtil sharedInstance].ossClient getBucketInfo:getBucketInfoRequest];
    [task continueWithBlock:^id _Nullable(OSSTask * _Nonnull t) {
        if (t.error) {
            NSLog(@"failed to getBucketInfo,error:%@",t.error);
        } else {
            NSLog(@"succeed to getBucketInfo,result:%@",t.result);
        }
        return nil;
    }];
}

- (void)deleteBucket {
    OSSDeleteBucketRequest *deleteBucketRequest = [OSSDeleteBucketRequest new];
    deleteBucketRequest.bucketName = OSS_BUCKET_SAMPLE;
    
    OSSTask *task = [[OSSTransferUtil sharedInstance].ossClient deleteBucket:deleteBucketRequest];
    [task continueWithBlock:^id _Nullable(OSSTask * _Nonnull t) {
        if (t.error) {
            NSLog(@"failed to deleteBucket,error:%@",t.error);
        } else {
            NSLog(@"succeed to deleteBucket,result:%@",t.result);
        }
        return nil;
    }];
}

- (void)getBucketACL {
    OSSGetBucketACLRequest *getBucketACLRequest = [OSSGetBucketACLRequest new];
    getBucketACLRequest.bucketName = OSS_BUCKET_SAMPLE;
    
    OSSTask *task = [[OSSTransferUtil sharedInstance].ossClient getBucketACL:getBucketACLRequest];
    [task continueWithBlock:^id _Nullable(OSSTask * _Nonnull t) {
        if (t.error) {
            NSLog(@"failed to getBucketACL,error:%@",t.error);
        } else {
            NSLog(@"succeed to getBucketACL,result:%@",t.result);
        }
        return nil;
    }];
}

@end
