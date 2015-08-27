

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>



@interface UIImage (maskClip)
+ (UIImage *)mergeImages:(NSArray *)imageArray;
+ (UIImage*)maskClipImage:(UIImage *)image withMaskImage:(UIImage*)maskimg;
@end

