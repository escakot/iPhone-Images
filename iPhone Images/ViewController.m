//
//  ViewController.m
//  iPhone Images
//
//  Created by Errol Cheong on 2017-07-17.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIImageView *iPhoneImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.iPhoneImageView = [[UIImageView alloc] init];
    [self.view addSubview:self.iPhoneImageView];
    self.iPhoneImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.iPhoneImageView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.iPhoneImageView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.iPhoneImageView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.iPhoneImageView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
//    [self.iPhoneImageView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
//    [self.iPhoneImageView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = YES;
    
    
    NSURL *url = [NSURL URLWithString:@"https://i.imgur.com/zdwdenZ.png"];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        NSData *data = [NSData dataWithContentsOfURL:location];
        UIImage *image = [UIImage imageWithData:data];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.iPhoneImageView.image = image;
        }];
        
    }];
    
    [downloadTask resume];
    
}



@end
