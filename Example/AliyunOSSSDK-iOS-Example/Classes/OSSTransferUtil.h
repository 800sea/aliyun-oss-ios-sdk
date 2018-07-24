//
//  OSSTransferUtil.h
//  AliyunOSSSDK-iOS-Example
//
//  Created by huaixu on 2018/7/10.
//  Copyright © 2018年 aliyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AliyunOSSiOS/AliyunOSSiOS.h>
#import "OSSTestMacros.h"

@interface OSSTransferUtil : NSObject

@property (nonatomic, strong, readonly) OSSClient *ossClient;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)sharedInstance;

@end
