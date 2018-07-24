//
//  ImageOperationView.m
//  AliyunOSSSDK-iOS-Example
//
//  Created by huaixu on 2018/7/9.
//  Copyright © 2018年 aliyun. All rights reserved.
//

#import "ImageOperationView.h"
#import "ImageViewModel.h"

@interface ImageOperationView()

@property (nonatomic, strong) ImageViewModel *viewModel;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;


@end

@implementation ImageOperationView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _viewModel = [[ImageViewModel alloc] init];
}
- (IBAction)fetchOriginImage:(id)sender {
    [[[_viewModel originImage] continueWithBlock:^id _Nullable(OSSTask * _Nonnull task) {
        if (task.result) {
            OSSGetObjectResult *result = (OSSGetObjectResult *)task.result;
            UIImage *image = [[UIImage alloc] initWithData:result.downloadedData];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = image;
            });
        } else {
            OSSLogError(@"get originImage failed!");
        }
        return nil;
    }] waitUntilFinished];
}

- (IBAction)resizeImage:(id)sender {
    [[[_viewModel circleImage] continueWithBlock:^id _Nullable(OSSTask * _Nonnull task) {
        if (task.result) {
            OSSGetObjectResult *result = (OSSGetObjectResult *)task.result;
            UIImage *image = [[UIImage alloc] initWithData:result.downloadedData];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = image;
            });
        } else {
            OSSLogError(@"get originImage failed!");
        }
        return nil;
    }] waitUntilFinished];
}

- (IBAction)circleImage:(id)sender {
    [[[_viewModel circleImage] continueWithBlock:^id _Nullable(OSSTask * _Nonnull task) {
        if (task.result) {
            OSSGetObjectResult *result = (OSSGetObjectResult *)task.result;
            UIImage *image = [[UIImage alloc] initWithData:result.downloadedData];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = image;
            });
        } else {
            OSSLogError(@"get originImage failed!");
        }
        return nil;
    }] waitUntilFinished];
}

- (IBAction)cropImage:(id)sender {
    [[[_viewModel cropImage] continueWithBlock:^id _Nullable(OSSTask * _Nonnull task) {
        if (task.result) {
            OSSGetObjectResult *result = (OSSGetObjectResult *)task.result;
            UIImage *image = [[UIImage alloc] initWithData:result.downloadedData];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = image;
            });
        } else {
            OSSLogError(@"get cropImage failed!");
        }
        return nil;
    }] waitUntilFinished];
}

- (IBAction)indexcropImage:(id)sender {
    [[[_viewModel indexcropImage] continueWithBlock:^id _Nullable(OSSTask * _Nonnull task) {
        if (task.result) {
            OSSGetObjectResult *result = (OSSGetObjectResult *)task.result;
            UIImage *image = [[UIImage alloc] initWithData:result.downloadedData];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = image;
            });
        } else {
            OSSLogError(@"get indexcropImage failed!");
        }
        return nil;
    }] waitUntilFinished];
}

- (IBAction)rounded_cornersImage:(id)sender {
    [[[_viewModel rounded_cornersImage] continueWithBlock:^id _Nullable(OSSTask * _Nonnull task) {
        if (task.result) {
            OSSGetObjectResult *result = (OSSGetObjectResult *)task.result;
            UIImage *image = [[UIImage alloc] initWithData:result.downloadedData];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = image;
            });
        } else {
            OSSLogError(@"get rounded_cornersImage failed!");
        }
        return nil;
    }] waitUntilFinished];
}

- (IBAction)rotateImage:(id)sender {
    [[[_viewModel rotateImage] continueWithBlock:^id _Nullable(OSSTask * _Nonnull task) {
        if (task.result) {
            OSSGetObjectResult *result = (OSSGetObjectResult *)task.result;
            UIImage *image = [[UIImage alloc] initWithData:result.downloadedData];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = image;
            });
        } else {
            OSSLogError(@"get rotateImage failed!");
        }
        return nil;
    }] waitUntilFinished];
}

- (IBAction)blurImage:(id)sender {
    [[[_viewModel blurImage] continueWithBlock:^id _Nullable(OSSTask * _Nonnull task) {
        if (task.result) {
            OSSGetObjectResult *result = (OSSGetObjectResult *)task.result;
            UIImage *image = [[UIImage alloc] initWithData:result.downloadedData];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = image;
            });
        } else {
            OSSLogError(@"get blurImage failed!");
        }
        return nil;
    }] waitUntilFinished];
}

- (IBAction)brightImage:(id)sender {
    [[[_viewModel brightImage] continueWithBlock:^id _Nullable(OSSTask * _Nonnull task) {
        if (task.result) {
            OSSGetObjectResult *result = (OSSGetObjectResult *)task.result;
            UIImage *image = [[UIImage alloc] initWithData:result.downloadedData];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = image;
            });
        } else {
            OSSLogError(@"get brightImage failed!");
        }
        return nil;
    }] waitUntilFinished];
}

- (IBAction)contrastImage:(id)sender {
    [[[_viewModel contrastImage] continueWithBlock:^id _Nullable(OSSTask * _Nonnull task) {
        if (task.result) {
            OSSGetObjectResult *result = (OSSGetObjectResult *)task.result;
            UIImage *image = [[UIImage alloc] initWithData:result.downloadedData];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = image;
            });
        } else {
            OSSLogError(@"get contrastImage failed!");
        }
        return nil;
    }] waitUntilFinished];
}

- (IBAction)sharpenImage:(id)sender {
    [[[_viewModel sharpenImage] continueWithBlock:^id _Nullable(OSSTask * _Nonnull task) {
        if (task.result) {
            OSSGetObjectResult *result = (OSSGetObjectResult *)task.result;
            UIImage *image = [[UIImage alloc] initWithData:result.downloadedData];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = image;
            });
        } else {
            OSSLogError(@"get sharpenImage failed!");
        }
        return nil;
    }] waitUntilFinished];
}

- (IBAction)formatImage:(id)sender {
    [[[_viewModel formateImage] continueWithBlock:^id _Nullable(OSSTask * _Nonnull task) {
        if (task.result) {
            OSSGetObjectResult *result = (OSSGetObjectResult *)task.result;
            UIImage *image = [[UIImage alloc] initWithData:result.downloadedData];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = image;
            });
        } else {
            OSSLogError(@"get formateImage failed!");
        }
        return nil;
    }] waitUntilFinished];
}

- (IBAction)watermarkImage:(id)sender {
    [[[_viewModel watermarkImage] continueWithBlock:^id _Nullable(OSSTask * _Nonnull task) {
        if (task.result) {
            OSSGetObjectResult *result = (OSSGetObjectResult *)task.result;
            UIImage *image = [[UIImage alloc] initWithData:result.downloadedData];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = image;
            });
        } else {
            OSSLogError(@"get watermarkImage failed!");
        }
        return nil;
    }] waitUntilFinished];
}


@end
