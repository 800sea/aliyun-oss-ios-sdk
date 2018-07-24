//
//  ObjectViewModel.m
//  AliyunOSSSDK-iOS-Example
//
//  Created by huaixu on 2018/7/9.
//  Copyright © 2018年 aliyun. All rights reserved.
//

#import "ObjectViewModel.h"

NSString * const testObjectKey = @"oss-sample-testObjectKey";
NSString * const appendableObjectKey = @"oss-sample-appendableObjectKey";
NSString * const authorizeUploadObject = @"oss-sample-authorizeUploadObject";

@interface ObjectViewModel()

@property (nonatomic, strong, readonly) OSSClient *ossClient;

@end

@implementation ObjectViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        OSSAuthCredentialProvider *provider = [[OSSAuthCredentialProvider alloc] initWithAuthServerUrl:OSS_STSTOKEN_URL];
        _ossClient = [[OSSClient alloc] initWithEndpoint:OSS_ENDPOINT credentialProvider:provider];
    }
    
    return self;
}

- (void)putObject {
    for (int i = 0; i < 30; i++) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            OSSAuthCredentialProvider *provider = [[OSSAuthCredentialProvider alloc] initWithAuthServerUrl:OSS_STSTOKEN_URL];
            OSSClient *putObjectClient = [[OSSClient alloc] initWithEndpoint:OSS_ENDPOINT credentialProvider:provider];
            
            OSSPutObjectRequest *putObjectRequest = [OSSPutObjectRequest new];
            putObjectRequest.bucketName = OSS_BUCKET_SAMPLE;
            putObjectRequest.objectKey = testObjectKey;
            putObjectRequest.uploadingFileURL = [[NSBundle mainBundle] URLForResource:@"wangwang" withExtension:@"zip"];
            
            OSSTask *task = [putObjectClient putObject:putObjectRequest];
            [[task continueWithBlock:^id _Nullable(OSSTask * _Nonnull t) {
                if (t.error) {
                    NSLog(@"failed to putObject,error:%@",t.error);
                } else {
                    NSLog(@"succeed to putObject,result:%@",t.result);
                }
                return nil;
            }] waitUntilFinished];
        });
    }
    
//    OSSPutObjectRequest *putObjectRequest = [OSSPutObjectRequest new];
//    putObjectRequest.bucketName = OSS_BUCKET_SAMPLE;
//    putObjectRequest.objectKey = testObjectKey;
//    putObjectRequest.uploadingFileURL = [[NSBundle mainBundle] URLForResource:@"hasky" withExtension:@"jpeg"];
//
//    OSSTask *task = [self.ossClient putObject:putObjectRequest];
//    [task continueWithBlock:^id _Nullable(OSSTask * _Nonnull t) {
//        if (t.error) {
//            NSLog(@"failed to putObject,error:%@",t.error);
//        } else {
//            NSLog(@"succeed to putObject,result:%@",t.result);
//        }
//        return nil;
//    }];
}

- (void)putObjectACL {
    OSSPutObjectACLRequest *putObjectACLRequest = [OSSPutObjectACLRequest new];
    putObjectACLRequest.bucketName = OSS_BUCKET_SAMPLE;
    putObjectACLRequest.objectKey = testObjectKey;
    putObjectACLRequest.acl = @"private";
    
    OSSTask *task = [self.ossClient putObjectACL:putObjectACLRequest];
    [task continueWithBlock:^id _Nullable(OSSTask * _Nonnull t) {
        if (t.error) {
            NSLog(@"failed to putObjectACL,error:%@",t.error);
        } else {
            NSLog(@"succeed to putObjectACL,result:%@",t.result);
        }
        return nil;
    }];
}

- (void)headObject {
    OSSHeadObjectRequest *headObjectRequest = [OSSHeadObjectRequest new];
    headObjectRequest.bucketName = OSS_BUCKET_SAMPLE;
    headObjectRequest.objectKey = testObjectKey;
    
    OSSTask *task = [self.ossClient headObject:headObjectRequest];
    [task continueWithBlock:^id _Nullable(OSSTask * _Nonnull t) {
        if (t.error) {
            NSLog(@"failed to headObject,error:%@",t.error);
        } else {
            NSLog(@"succeed to headObject,result:%@",t.result);
        }
        return nil;
    }];
}

- (void)deleteObject {
    OSSDeleteObjectRequest *deleteObjectRequest = [OSSDeleteObjectRequest new];
    deleteObjectRequest.bucketName = OSS_BUCKET_SAMPLE;
    deleteObjectRequest.objectKey = testObjectKey;
    
    OSSTask *task = [self.ossClient deleteObject:deleteObjectRequest];
    [task continueWithBlock:^id _Nullable(OSSTask * _Nonnull t) {
        if (t.error) {
            NSLog(@"failed to deleteObject,error:%@",t.error);
        } else {
            NSLog(@"succeed to deleteObject,result:%@",t.result);
        }
        return nil;
    }];
}

- (void)multipartUploadObject {
    OSSMultipartUploadRequest *multipartUploadRequest = [OSSMultipartUploadRequest new];
    multipartUploadRequest.bucketName = OSS_BUCKET_SAMPLE;
    multipartUploadRequest.objectKey = testObjectKey;
    multipartUploadRequest.uploadingFileURL = [[NSBundle mainBundle] URLForResource:@"wangwang" withExtension:@"zip"];
    multipartUploadRequest.partSize = 256 * 1024;
    
    OSSTask *task = [self.ossClient multipartUpload:multipartUploadRequest];
    [task continueWithBlock:^id _Nullable(OSSTask * _Nonnull t) {
        if (t.error) {
            NSLog(@"failed to multipartUploadObject,error:%@",t.error);
        } else {
            NSLog(@"succeed to multipartUploadObject,result:%@",t.result);
        }
        return nil;
    }];
}

- (void)appendableUploadObject {
    __block NSString *crc64String = nil;
    OSSAppendObjectRequest *appendObjectRequest = [OSSAppendObjectRequest new];
    appendObjectRequest.bucketName = OSS_BUCKET_SAMPLE;
    appendObjectRequest.objectKey = appendableObjectKey;
    appendObjectRequest.uploadingFileURL = [[NSBundle mainBundle] URLForResource:@"hasky" withExtension:@"jpeg"];
    
    OSSTask *task = [self.ossClient appendObject:appendObjectRequest];
    [[task continueWithBlock:^id _Nullable(OSSTask * _Nonnull t) {
        if (t.error) {
            NSLog(@"failed to appendableUploadObject,error:%@",t.error);
        } else {
            OSSAppendObjectResult *result = (OSSAppendObjectResult *)t.result;
            crc64String = [result remoteCRC64ecma];
            NSLog(@"succeed to appendableUploadObject,result:%@",t.result);
        }
        return nil;
    }] waitUntilFinished];
    
    OSSAppendObjectRequest *appendObjectRequest1 = [OSSAppendObjectRequest new];
    appendObjectRequest1.bucketName = OSS_BUCKET_SAMPLE;
    appendObjectRequest1.objectKey = appendableObjectKey;
    appendObjectRequest1.appendPosition = 81997;
    appendObjectRequest1.uploadingFileURL = [[NSBundle mainBundle] URLForResource:@"hasky" withExtension:@"jpeg"];
    OSSTask *task1 = [self.ossClient appendObject:appendObjectRequest1 withCrc64ecma:crc64String];
    [[task1 continueWithBlock:^id _Nullable(OSSTask * _Nonnull t) {
        if (t.error) {
            NSLog(@"failed to appendableUploadObject,error:%@",t.error);
        } else {
            NSLog(@"succeed to appendableUploadObject,result:%@",t.result);
        }
        return nil;
    }] waitUntilFinished];
}

- (void)authorizeUploadObject {
    // TODO
    NSLog(@"authorizeUploadObject");
    OSSTask *task = [self.ossClient presignConstrainURLWithBucketName:OSS_BUCKET_SAMPLE withObjectKey:appendableObjectKey withExpirationInterval:3600];
    [task waitUntilFinished];
    
    NSLog(@"task.result: %@", task.result);
    NSURL *authorizeUploadURL = [NSURL URLWithString:task.result];
    NSURL *authorizeUploadFileURL = [[NSBundle mainBundle] URLForResource:@"hasky" withExtension:@"jpeg"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:authorizeUploadURL];
    request.HTTPMethod = @"PUT";
    
    NSURLSessionUploadTask *uploadTask = [[NSURLSession sharedSession] uploadTaskWithRequest:request fromFile:authorizeUploadFileURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"failed to authorizeUploadObject,error: %@", error);
        } else {
            NSLog(@"succeed to authorizeUploadObject,response: %@", response);
        }
    }];
    [uploadTask resume];
}

@end
