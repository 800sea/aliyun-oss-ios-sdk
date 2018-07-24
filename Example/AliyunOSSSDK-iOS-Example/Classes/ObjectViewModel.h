//
//  ObjectViewModel.h
//  AliyunOSSSDK-iOS-Example
//
//  Created by huaixu on 2018/7/9.
//  Copyright © 2018年 aliyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AliyunOSSiOS/AliyunOSSiOS.h>
#import "OSSTestMacros.h"

@interface ObjectViewModel : NSObject

- (void)putObject;

- (void)putObjectACL;

- (void)headObject;

- (void)deleteObject;

- (void)multipartUploadObject;

- (void)appendableUploadObject;

- (void)authorizeUploadObject;

@end
