#Hi#

This is a code to clip UIImage by mask. 

##Usage##

1st, add a file named "mask.png" as the shaped-clip one.<br>
2nd, call the method with raw image as param.<br>
3rd, you can also call the advanced method to merge the cliped ones together.<br>

###Sample images###
<br/>
<img src="https://github.com/chenguohao/groupAvatar/blob/master/sample1.png"/>
<br/>
###Code ###

    #clip image with mask
    UIImage* rawimage = [UIImage imageNamed:@"0.jpg"];
    UIImage* maskimge = [UIImage imageNamed:@"hexagon.png"];
    UIImage* clipedimg = [UIImage maskClipImage:rawimage withMaskImage:maskimge];

###Sample images###
<br/>
<img src="https://github.com/chenguohao/groupAvatar/blob/master/sample2.png"/>
<br/>
###Code ###
    #advanced Usage
    NSMutableArray* marray = [NSMutableArray new];
    for (int i = 0; i < 6; i++) {
        NSString* str = [NSString stringWithFormat:@"%d.jpg",i];
        UIImage* img = [UIImage imageNamed:str];
        [marray addObject:img];
    }
    NSArray* imageAry = [NSArray arrayWithArray:marray];
    UIImage *headImage = [UIImage mergeImages:imageAry];
To learn more about this click [here][1]

[1]: http://blog.csdn.net/leo_master/article/details/48023191