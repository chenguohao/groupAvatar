

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>



@interface UIImage (maskClip)


+ (UIImage *) mergeImages:(NSArray *)imageArray;
+ (UIImage*)maskClipImage:(UIImage *)image angle:(double)angle;
@end

