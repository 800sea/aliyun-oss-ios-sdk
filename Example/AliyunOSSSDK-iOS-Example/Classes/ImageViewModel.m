//
//  ImageViewModel.m
//  AliyunOSSSDK-iOS-Example
//
//  Created by huaixu on 2018/7/9.
//  Copyright © 2018年 aliyun. All rights reserved.
//

#import "ImageViewModel.h"


@interface ImageViewModel()

@property (nonatomic, strong) OSSClient *client;

@end

@implementation ImageViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        OSSAuthCredentialProvider *provider = [[OSSAuthCredentialProvider alloc] initWithAuthServerUrl:OSS_STSTOKEN_URL];
        _client = [[OSSClient alloc] initWithEndpoint:OSS_IMAGE_ENDPOINT credentialProvider:provider];
    }
    return self;
}

- (OSSTask *)originImage {
    OSSGetObjectRequest *request = [OSSGetObjectRequest new];
    request.objectKey = OSS_IMAGEOPERATION_KEY;
    request.bucketName = OSS_IMAGEOPERATION_BUCKET;
    
    return [_client getObject:request];
}

- (OSSTask *)circleImage {
    OSSGetObjectRequest *request = [OSSGetObjectRequest new];
    request.objectKey = OSS_IMAGEOPERATION_KEY;
    request.bucketName = OSS_IMAGEOPERATION_BUCKET;
    request.xOssProcess = @"image/circle,r_100";
    
    return [_client getObject:request];
}

- (OSSTask *)cropImage {
    OSSGetObjectRequest *request = [OSSGetObjectRequest new];
    request.objectKey = OSS_IMAGEOPERATION_KEY;
    request.bucketName = OSS_IMAGEOPERATION_BUCKET;
    request.xOssProcess = @"image/crop,x_100,y_50";
    
    return [_client getObject:request];
}

- (OSSTask *)indexcropImage {
    OSSGetObjectRequest *request = [OSSGetObjectRequest new];
    request.objectKey = OSS_IMAGEOPERATION_KEY;
    request.bucketName = OSS_IMAGEOPERATION_BUCKET;
    request.xOssProcess = @"image/indexcrop,x_100,i_0";
    
    return [_client getObject:request];
}

- (OSSTask *)rounded_cornersImage {
    OSSGetObjectRequest *request = [OSSGetObjectRequest new];
    request.objectKey = OSS_IMAGEOPERATION_KEY;
    request.bucketName = OSS_IMAGEOPERATION_BUCKET;
    request.xOssProcess = @"image/rounded-corners,r_30";
    
    return [_client getObject:request];
}

- (OSSTask *)rotateImage {
    OSSGetObjectRequest *request = [OSSGetObjectRequest new];
    request.objectKey = OSS_IMAGEOPERATION_KEY;
    request.bucketName = OSS_IMAGEOPERATION_BUCKET;
    request.xOssProcess = @"image/rotate,90";
    
    return [_client getObject:request];
}

- (OSSTask *)blurImage {
    OSSGetObjectRequest *request = [OSSGetObjectRequest new];
    request.objectKey = OSS_IMAGEOPERATION_KEY;
    request.bucketName = OSS_IMAGEOPERATION_BUCKET;
    request.xOssProcess = @"image/blur,r_3,s_2";
    
    return [_client getObject:request];
}

- (OSSTask *)brightImage {
    OSSGetObjectRequest *request = [OSSGetObjectRequest new];
    request.objectKey = OSS_IMAGEOPERATION_KEY;
    request.bucketName = OSS_IMAGEOPERATION_BUCKET;
    request.xOssProcess = @"image/bright,50";
    
    return [_client getObject:request];
}

- (OSSTask *)contrastImage {
    OSSGetObjectRequest *request = [OSSGetObjectRequest new];
    request.objectKey = OSS_IMAGEOPERATION_KEY;
    request.bucketName = OSS_IMAGEOPERATION_BUCKET;
    request.xOssProcess = @"image/contrast,-50";
    
    return [_client getObject:request];
}

- (OSSTask *)sharpenImage {
    OSSGetObjectRequest *request = [OSSGetObjectRequest new];
    request.objectKey = OSS_IMAGEOPERATION_KEY;
    request.bucketName = OSS_IMAGEOPERATION_BUCKET;
    request.xOssProcess = @"image/sharpen,100";
    
    return [_client getObject:request];
}

- (OSSTask *)formateImage {
    OSSGetObjectRequest *request = [OSSGetObjectRequest new];
    request.objectKey = @"panda.png";
    request.bucketName = OSS_IMAGEOPERATION_BUCKET;
    request.xOssProcess = @"image/format,jpg";
    
    return [_client getObject:request];
}

- (OSSTask *)watermarkImage {
    OSSGetObjectRequest *request = [OSSGetObjectRequest new];
    request.objectKey = OSS_IMAGEOPERATION_KEY;
    request.bucketName = OSS_IMAGEOPERATION_BUCKET;
    request.xOssProcess = @"image/watermark,type_d3F5LXplbmhlaQ,size_30,text_SGVsbG8g5Zu-54mH5pyN5YqhIQ";
    
    return [_client getObject:request];
}

@end
