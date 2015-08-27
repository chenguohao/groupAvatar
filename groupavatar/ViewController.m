//
//  ViewController.m
//  groupavatar
//
//  Created by guohao on 15/2/13.
//  Copyright (c) 2015年 guohao. All rights reserved.
//

#import "ViewController.h"
#import "UIImageEx.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    NSMutableArray* marray = [NSMutableArray new];
    for (int i = 1; i < 7; i++) {
        NSString* str = [NSString stringWithFormat:@"%d.jpg",i];
        UIImage* img = [UIImage imageNamed:str];
        [marray addObject:img];
    }
 
    NSArray* imageAry = [NSArray arrayWithArray:marray];
    UIImage* img = [UIImage imageNamed:@"2.png"];
    UIImage *headImage = nil;
    headImage = [UIImage mergeImages:imageAry];
    //headImage = [UIImage roundClipImageWithSize:img angle:40];
    
//    CGColorSpaceRef colorSpace;
//    colorSpace = CGColorSpaceCreateDeviceRGB();
//    
//    CGContextRef context = CGBitmapContextCreate (NULL,50,50,
//                                                  8,0, colorSpace, kCGImageAlphaPremultipliedLast);
//    CGColorSpaceRelease(colorSpace);
//    CGRect rcImage = CGRectMake(0, 0, 50, 50);
//    CGContextDrawImage(context, rcImage, headImage.CGImage);
//    CGContextRotateCTM(context, 1.4);
//    CGImageRef imageRef = CGBitmapContextCreateImage(context);
//    
//    
//    UIImage *image = [UIImage imageWithCGImage:imageRef scale:1 orientation:UIImageOrientationUp];
//    
    
    
   UIImageView* imv = [[UIImageView alloc] initWithImage:headImage];
    [self.view addSubview:imv];
    imv.frame = CGRectMake(100, 100,120, 120);
    imv.layer.borderColor = [UIColor whiteColor].CGColor;
    imv.layer.borderWidth = 2;
    imv.clipsToBounds = YES;
    
   // CGContextRelease(context);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
