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
    self.view.backgroundColor = [UIColor whiteColor];
    
    // section 1
    UIImage* rawimage = [UIImage imageNamed:@"0.jpg"];
    UIImage* maskimge = [UIImage imageNamed:@"hexagon.png"];
    UIImage* clipedimg = [UIImage maskClipImage:rawimage withMaskImage:maskimge];
    
    UIImageView* imv0 = [[UIImageView alloc] initWithImage:clipedimg];
    [self.view addSubview:imv0];
    imv0.frame = CGRectMake(100, 40,120, 120);
    
    // section 2
    NSMutableArray* marray = [NSMutableArray new];
    for (int i = 0; i < 6; i++) {
        NSString* str = [NSString stringWithFormat:@"%d.jpg",i];
        UIImage* img = [UIImage imageNamed:str];
        [marray addObject:img];
    }
 
    NSArray* imageAry = [NSArray arrayWithArray:marray];
    UIImage *headImage = [UIImage mergeImages:imageAry];
   
    UIImageView* imv1 = [[UIImageView alloc] initWithImage:headImage];
    [self.view addSubview:imv1];
    imv1.frame = CGRectMake(100, 200,120, 120);
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
