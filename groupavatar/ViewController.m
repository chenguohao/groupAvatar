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
    NSMutableArray* marray = [NSMutableArray new];
    for (int i = 0; i < 6; i++) {
        NSString* str = [NSString stringWithFormat:@"%d.jpg",i];
        UIImage* img = [UIImage imageNamed:str];
        [marray addObject:img];
    }
 
    NSArray* imageAry = [NSArray arrayWithArray:marray];
    UIImage *headImage = [UIImage mergeImages:imageAry];
   
    UIImageView* imv = [[UIImageView alloc] initWithImage:headImage];
    [self.view addSubview:imv];
    imv.frame = CGRectMake(100, 100,120, 120);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
