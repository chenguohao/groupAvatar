//
//  UIImage-icon.m
//  CallShow
//
//  Created by sugar chen on 09-4-14.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SGUIImageEx.h"
#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>

#define SHORT_SIDE  33
#define LONG_SIDE   99

#define DEGREES_TO_RADIANS(d) ((d) * 0.0174532925199432958f)
#define HEADFACE_SIZE			50

#define RADIANS(degrees) ((degrees * M_PI) / 180.0)

@implementation UIImage(UIImageDataExpress)

+ (UIImage*)roundClipImageWithSize:(UIImage *)image angle:(double)angle
{
    CGSize size = image.size;
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    // 先画图片
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* mask = [UIImage imageNamed:@"chat_mask_clip_normal.png"];
    UIImage* rotatedmask = [UIImage rotate:mask angle:angle];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctx, size.width / 2, size.height / 2);
    CGContextTranslateCTM(ctx, size.width / 2, size.height / 2);
    

//    
    [rotatedmask drawInRect:CGRectMake(-size.width / 2, -size.width / 2, size.width, size.width) blendMode:kCGBlendModeDestinationIn alpha:1];
    
    UIImage* retImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return retImage;
    
}


+ (UIImage *)rotate:(UIImage *)image angle:(float)angle {
    CGSize size = image.size;;
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // If this is commented out, image is returned as it is.
    CGContextTranslateCTM(context, size.width / 2, size.height / 2);
    CGContextRotateCTM (context, angle);
    CGContextTranslateCTM(context, -size.width / 2, -size.height / 2);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (UIImage *) mergeGridsImageLT2RB:(NSArray *)imageArray
{
    UIImage *image = nil;
    NSUInteger maxHeadImgCount = CGRectGetHeight([UIScreen mainScreen].bounds) > 480.0f ? 6 : 4;
    NSUInteger imageCount = MIN([imageArray count], maxHeadImgCount);
    int bg_width = HEADFACE_SIZE;
    int bg_height = HEADFACE_SIZE;
    int scale =  8;
    
    // 只有一个头像，则直接返回这张头像
    if (imageCount == 1) {
        image = imageArray.firstObject;
    }
    else if ( imageCount > 1 )
    {
        float head_s = 1;
        NSMutableArray *rectArray = [NSMutableArray arrayWithCapacity:6];
        double startAngel = 0;
        // 设定不同头像个数时，头像的大小、绘制位置以及切割缺角的位置，由于不是完成对称的，所以这里都写死坐标
        if (imageCount == 2) {
            head_s = 30;
            CGRect rcImage = CGRectMake(0, (bg_height - head_s) * scale, head_s * scale, head_s * scale);
            [rectArray addObject:[NSValue valueWithCGRect:rcImage]];
            rcImage = CGRectMake((bg_width - head_s - 1) * scale, 0, head_s * scale, head_s * scale);
            [rectArray addObject:[NSValue valueWithCGRect:rcImage]];
            startAngel = 2 * M_PI * 1 / 360;
        }
        else if (imageCount == 3) {
            head_s = 26;
            CGRect rcImage = CGRectMake((bg_width - head_s) / 2 * scale, (bg_height - head_s - 3) * scale, head_s * scale, head_s * scale);
            [rectArray addObject:[NSValue valueWithCGRect:rcImage]];
            rcImage = CGRectMake(0, 0, head_s * scale, head_s * scale);
            [rectArray addObject:[NSValue valueWithCGRect:rcImage]];
            rcImage = CGRectMake((bg_width - head_s) * scale, 0, head_s * scale, head_s * scale);
            [rectArray addObject:[NSValue valueWithCGRect:rcImage]];
            startAngel =  2 * M_PI * 75 / 360;
        }
        else if (imageCount == 4) {
            head_s = 26;
            CGRect rcImage = CGRectMake(0, (bg_height - head_s) * scale, head_s * scale, head_s * scale);
            [rectArray addObject:[NSValue valueWithCGRect:rcImage]];
            rcImage = CGRectMake(0, 0, head_s * scale, head_s * scale);
            [rectArray addObject:[NSValue valueWithCGRect:rcImage]];
            rcImage = CGRectMake((bg_width - head_s) * scale, 0, head_s * scale, head_s * scale);
            [rectArray addObject:[NSValue valueWithCGRect:rcImage]];
            rcImage = CGRectMake((bg_width - head_s) * scale, (bg_height - head_s) * scale, head_s * scale, head_s * scale);
            [rectArray addObject:[NSValue valueWithCGRect:rcImage]];
            startAngel =  2 * M_PI * 45 / 360;
        }
        else if (imageCount == 5) {
            head_s = 20;
            CGRect rcImage = CGRectMake((bg_width - head_s) * scale / 2, (bg_height - head_s - 1) * scale, head_s * scale, head_s * scale);
            [rectArray addObject:[NSValue valueWithCGRect:rcImage]];
            rcImage = CGRectMake(0, (bg_height - head_s - 12) * scale, head_s * scale, head_s * scale);
            [rectArray addObject:[NSValue valueWithCGRect:rcImage]];
            rcImage = CGRectMake(5 * scale, 0, head_s * scale, head_s * scale);
            [rectArray addObject:[NSValue valueWithCGRect:rcImage]];
            rcImage = CGRectMake((bg_width - head_s - 6) * scale, 0, head_s * scale, head_s * scale);
            [rectArray addObject:[NSValue valueWithCGRect:rcImage]];
            rcImage = CGRectMake((bg_width - head_s) * scale, (bg_height - head_s - 12) * scale, head_s * scale, head_s * scale);
            [rectArray addObject:[NSValue valueWithCGRect:rcImage]];
            startAngel =  2 * M_PI * 99 / 360;
        }
        else if (imageCount == 6) {
            head_s = 18;
            CGRect rcImage = CGRectMake(8 * scale, (bg_height - head_s - 2) * scale, head_s * scale, head_s * scale);
            [rectArray addObject:[NSValue valueWithCGRect:rcImage]];
            rcImage = CGRectMake(0, (bg_height - head_s - 17) * scale, head_s * scale, head_s * scale);
            [rectArray addObject:[NSValue valueWithCGRect:rcImage]];
            rcImage = CGRectMake(8 * scale, 0, head_s * scale, head_s * scale);
            [rectArray addObject:[NSValue valueWithCGRect:rcImage]];
            rcImage = CGRectMake((bg_width - head_s - 7) * scale, 0, head_s * scale, head_s * scale);
            [rectArray addObject:[NSValue valueWithCGRect:rcImage]];
            rcImage = CGRectMake((bg_width - head_s + 1) * scale, (bg_height - head_s - 17) * scale, head_s * scale, head_s * scale);
            [rectArray addObject:[NSValue valueWithCGRect:rcImage]];
            rcImage = CGRectMake((bg_width - head_s - 7) * scale, (bg_height - head_s - 2) * scale, head_s * scale, head_s * scale);
            [rectArray addObject:[NSValue valueWithCGRect:rcImage]];
            startAngel =  2 * M_PI * 75 / 360;
        }
        
        
        CGColorSpaceRef colorSpace;
        colorSpace = CGColorSpaceCreateDeviceRGB();
        CGContextRef context = CGBitmapContextCreate (NULL,
                                                      (bg_width + 1)*scale, bg_height*scale,
                                                      8,0, colorSpace, kCGImageAlphaPremultipliedLast);
        CGColorSpaceRelease(colorSpace);
        
        UIColor * color = [UIColor redColor];
        CGContextSetFillColorWithColor(context, color.CGColor);
        
        for ( int j=0; j<imageCount; ++j )
        {
            UIImage *image_inx = [imageArray objectAtIndex:j];
            if (imageCount > 2 || j == 0) {
                double angel = startAngel - 2 * j * M_PI / imageCount;
                // 微调6个头像时切缺角的角度
                if (imageCount == 6) {
                    if (j == 3) {
                        angel -= 2 * M_PI * 1 / 360;
                    }
                    else if (j == 4) {
                        angel += 2 * M_PI * 2 / 360;
                    }
                }
                // 微调5个头像时切缺角的角度
                else if (imageCount == 5 && j == 3) {
                    angel += 2 * M_PI * 2 / 360;
                }
                image_inx = [self roundClipImageWithSize:image_inx angle:angel];
            }
            CGRect rcImage = [[rectArray objectAtIndex:j] CGRectValue];
            CGContextDrawImage(context, rcImage, image_inx.CGImage);
        }
        
        CGImageRef imageRef = CGBitmapContextCreateImage(context);
        CGContextRelease(context);
        
        image = [UIImage imageWithCGImage:imageRef scale:scale orientation:UIImageOrientationUp];
        
        if ( imageRef )
        {
            CGImageRelease(imageRef);
        }
    }
    else
    {
        CGColorSpaceRef colorSpace;
        colorSpace = CGColorSpaceCreateDeviceRGB();
        CGContextRef context = CGBitmapContextCreate (NULL,
                                                      bg_width*scale, bg_height*scale,
                                                      8,0, colorSpace, kCGImageAlphaPremultipliedLast);
        CGColorSpaceRelease(colorSpace);
        
        UIColor * color = [UIColor clearColor];
        CGContextSetFillColorWithColor(context, color.CGColor);
        
        UIImage *icon = [UIImage imageNamed:@"talk_avatar_default"];
        int x_off = (bg_width - icon.size.width) * scale / 2;
        int y_off = (bg_height - icon.size.height) * scale / 2;
        CGContextDrawImage(context, CGRectMake(x_off, y_off, icon.size.width*scale, icon.size.height*scale), icon.CGImage);
        
        CGImageRef imageRef = CGBitmapContextCreateImage(context);
        CGContextRelease(context);
        
        image = [UIImage imageWithCGImage:imageRef scale:scale orientation:UIImageOrientationUp];
        
        if ( imageRef )
        {
            CGImageRelease(imageRef);
        }
    }
    
    return image;
}
@end
