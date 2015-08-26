//
//  UIImage+RoundWithHexagonAvatar.m
//  zhuaAvatar
//
//  Created by guohao on 15/4/24.
//  Copyright (c) 2015年 guohao. All rights reserved.
//

#import "UIImage+RoundWithHexagonAvatar.h"
#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>
@implementation UIImage (RoundWithHexagonAvatar)
+ (UIImage*)imagewithMaster:(UIImage *)imageM
                   imagePet:(UIImage*)imageP
{
    CGSize size = imageM.size;
    
    
    
    // master
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [imageM drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* mask = [UIImage imageNamed:@"brokenround.png"];
    [mask drawInRect:CGRectMake(0,0, size.width, size.width) blendMode:kCGBlendModeDestinationIn alpha:1];
    UIImage* retImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    //Pet
    size = imageP.size;
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [imageP drawInRect:CGRectMake(0, 0, size.width, size.height)];
    mask = [UIImage imageNamed:@"sixstar"];
    [mask drawInRect:CGRectMake(0,0, size.width, size.width) blendMode:kCGBlendModeDestinationIn alpha:1];
    UIImage* retImage2 = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    CGColorSpaceRef colorSpace;
    colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate (NULL,
                                                  250, 200,
                                                  8,0, colorSpace, kCGImageAlphaPremultipliedLast);
    
    CGColorSpaceRelease(colorSpace);
    
    CGRect rcImage =  CGRectMake(0, 0, 200, 200);
    CGContextDrawImage(context, rcImage, retImage.CGImage);
    
    rcImage =  CGRectMake(150, 0, 100, 100);
    
    CGContextDrawImage(context, rcImage, retImage2.CGImage);
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    
    UIImage *image = [UIImage imageWithCGImage:imageRef scale:1 orientation:UIImageOrientationUp];
    
    if ( imageRef )
    {
        CGImageRelease(imageRef);
    }
    
    return image;
    
}
@end
