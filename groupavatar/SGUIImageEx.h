//
//  SGUIImageEx.h
//  QZone
//
//  Created by sugar chen on 10-5-3.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
//  uiimage  扩展类
//  提供图片缩放合并图片等功能

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>



@interface UIImage (UIImageDataExpress) 

- (UIImage*)iconImageWithWidth:(double)width cornerRadius:(double)radius
						border:(double)border borderColor:(UIColor*)color ;
- (UIImage*)imageWithProcLeft:(double)width height:(double)height proc:(float)proc;
- (UIImage*)imageWithProcRight:(double)width height:(double)height proc:(float)proc;

- (UIImage*)iconImageWithWidth:(double)width cornerRadius:(double)radius;
#define ROUNDCORNER_TYPE_SMALL      0 // 70*70以下用
#define ROUNDCORNER_TYPE_NORMAL     1 // 100*100以下用
#define ROUNDCORNER_TYPE_BIG        2 // 128*128以下用
#define ROUNDCORNER_TYPE_EXTRA      3 // 聊天窗口图片用
#define ROUNDCORNER_TYPE_USERSUMMARY_BUSINESS      4 // 资料卡第三方业务入口头像切割

- (CGSize)getThumbnailFitSize;
- (UIImage*)getThumbnailWithRoundCorner:(BOOL)needRoundCorner cornerType:(int)cornerType;

//原图获取大图接口
- (UIImage*)GetBigImage;

- (UIImage*)roundCornerImageWithSize:(CGSize)size; // 根据传进来的宽度自适应选择圆角size？
- (UIImage*)roundCornerImageWithSize:(CGSize)size cornerType:(int)cornerType;
- (UIImage*)grayImage;
- (UIImage *)grayImageByFilter;
- (UIImage*)linghtImage;
- (UIImage*)whiteImage;
- (UIImage*)qqScaleToSize:(CGSize)size;
- (UIImage*)qqScalToSuitSizeWithMaxShortSide:(CGFloat)maxShortSide maxLongSide:(CGFloat)maxLongSide;
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;
- (UIImage*)qqScaleToSizeNoTransparent:(CGSize)size;
- (UIImage *)qqStateImage:(UIImage *)sImage;
- (NSArray *)framesWithSize:(CGSize )size;
+ (UIImage*)chatBgImage:(UIImage*)sImage withSize:(CGSize)size;
+ (UIImage *)mergeImage:(NSArray *)imgAry;
- (BOOL)isTransparentImage;
- (UIImage*)scaleToSizeForDoodle:(CGSize)size;
- (BOOL)is2xScreen;
+ (BOOL)pix2Screen;
- (void)drawGrayImageInRect:(CGRect)rect;
+ (UIImage *) mergeGridsImage:(NSArray *)imageArray;
+ (UIImage *) mergeGridsImageLT2RB:(NSArray *)imageArray;
+ (UIImage *)borderImage:(UIImage *)image;
+ (UIImage *)roundIconImageWith:(UIImage *)image diameter:(double)diameter stretch:(bool)stretch;

// 纵向黄金分割
+ (UIImage *)clipImageByGoldenSectionRatio:(UIImage *)OrgImage drawSize:(CGSize)viewsize;
+ (UIImage *)clipImageByGoldenSectionRatio:(UIImage *)OrgImage drawSize:(CGSize)size innerGlow:(BOOL)innerGlow;
// 图片标准裁减
+ (UIImage *)clipImageByNormalSectionRatio:(UIImage *)OrgImage drawSize:(CGSize)size innerGlow:(BOOL)innerGlow;

-(UIImage*)qqImageForCurrentScale;

- (UIImage*)roundCornerImageWithSize:(CGSize)size topLeft:(BOOL)topLeft topRight:(BOOL)topRight bottomLeft:(BOOL)bottomLeft bottomRight:(BOOL)bottomRight cornerType:(int)cornerType;

/* blur the current image with a box blur algoritm */
- (UIImage*)blurImageWithBlur:(CGFloat)blur;

- (UIImage *)accelerateBlurWithImage:(CGFloat)blurLevel;
+ (UIImage*)roundClipImageWithSize:(UIImage *)image angle:(double)angle;
-(UIImage*)invertColorImage;
@end

