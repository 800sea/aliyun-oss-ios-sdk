//
//  OSSTransferUtil.m
//  AliyunOSSSDK-iOS-Example
//
//  Created by huaixu on 2018/7/10.
//  Copyright © 2018年 aliyun. All rights reserved.
//

#import "OSSTransferUtil.h"

@implementation OSSTransferUtil

+ (instancetype)sharedInstance {
    static OSSTransferUtil *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        OSSAuthCredentialProvider *provider = [[OSSAuthCredentialProvider alloc] initWithAuthServerUrl:OSS_STSTOKEN_URL];
        OSSClient *client = [[OSSClient alloc] initWithEndpoint:OSS_ENDPOINT credentialProvider:provider];
        
        _sharedInstance = [[OSSTransferUtil alloc] initWithOSSClient:client];
    });
    
    return _sharedInstance;
}

- (instancetype)initWithOSSClient:(OSSClient *)client {
    self = [super init];
    if (self) {
        _ossClient = client;
    }
    return self;
}

@end
