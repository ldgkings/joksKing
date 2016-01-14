//
//  UIImage+DGExtend.m
//  微博项目
//
//  Created by etcxm on 15/9/24.
//  Copyright (c) 2015年 etcxm. All rights reserved.
//

#import "UIImage+DGExtend.h"

@implementation UIImage (DGExtend)

+ (instancetype)imageWithRenderingName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+ (instancetype )resizableImage:(UIImage *)image
{
    
    CGFloat top = image.size.height * 0.5;
    CGFloat left = image.size.width * 0.5;

return  [image resizableImageWithCapInsets:UIEdgeInsetsMake(top, left, top, left) resizingMode:UIImageResizingModeStretch];

}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGFloat imageH = 100;
    CGFloat imageW = 100;
    // 开启一个基于位图的上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageH, imageW), YES, 0.0);
    
    // 创建一个矩形框大小的图片
    [color set];
    UIRectFill(CGRectMake(0, 0, imageW, imageH));
    
    // 得到图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();

    return image;

}




@end
