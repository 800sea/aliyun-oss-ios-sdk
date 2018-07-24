//
//  ImageViewModel.h
//  AliyunOSSSDK-iOS-Example
//
//  Created by huaixu on 2018/7/9.
//  Copyright © 2018年 aliyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AliyunOSSiOS/AliyunOSSiOS.h>
#import "OSSTestMacros.h"

@interface ImageViewModel : NSObject

- (OSSTask *)originImage;

- (OSSTask *)circleImage;

- (OSSTask *)cropImage;

- (OSSTask *)indexcropImage;

- (OSSTask *)rounded_cornersImage;

- (OSSTask *)rotateImage;

- (OSSTask *)blurImage;

- (OSSTask *)brightImage;

- (OSSTask *)contrastImage;

- (OSSTask *)sharpenImage;

- (OSSTask *)formateImage;

- (OSSTask *)watermarkImage;

@end
