//
//  ObjectView.m
//  AliyunOSSSDK-iOS-Example
//
//  Created by huaixu on 2018/7/9.
//  Copyright © 2018年 aliyun. All rights reserved.
//

#import "ObjectView.h"
#import "ObjectViewModel.h"

@interface ObjectView()

@property (nonatomic, strong) ObjectViewModel *viewModel;

@end

@implementation ObjectView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _viewModel = [[ObjectViewModel alloc] init];
}

- (IBAction)PutObjectAction:(id)sender {
    [self.viewModel putObject];
}

- (IBAction)PutObjectACLAction:(id)sender {
    [self.viewModel putObjectACL];
}

- (IBAction)HeadObjectAction:(id)sender {
    [self.viewModel headObject];
}

- (IBAction)DeleteObjectAction:(id)sender {
    [self.viewModel deleteObject];
}

- (IBAction)multipartUploadObjectAction:(id)sender {
    [self.viewModel multipartUploadObject];
}

- (IBAction)uploadAppendableObjectAction:(id)sender {
    [self.viewModel appendableUploadObject];
}

- (IBAction)AuthorizeUploadObjectAction:(id)sender {
    [self.viewModel authorizeUploadObject];
}



@end
