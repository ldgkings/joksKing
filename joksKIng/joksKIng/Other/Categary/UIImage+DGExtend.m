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

// 返回一个带边框的裁剪的图片
+ (instancetype)circleImageWithImage:(UIImage *)oldImage borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    // 1.开启上下文
    CGFloat imageW = oldImage.size.width + 2 * borderWidth;
    CGFloat imageH = oldImage.size.height + 2 * borderWidth;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    
    // 2.取得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 3.画边框(大圆)
    [borderColor set];
    CGFloat bigRadius = imageW * 0.5; // 大圆半径
    CGFloat centerX = bigRadius; // 圆心
    CGFloat centerY = bigRadius;
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx); // 画圆
    
    // 4.小圆
    CGFloat smallRadius = bigRadius - borderWidth;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    // 裁剪(后面画的东西才会受裁剪的影响)
    CGContextClip(ctx);
    
    // 5.画图
    [oldImage drawInRect:CGRectMake(borderWidth, borderWidth, oldImage.size.width, oldImage.size.height)];
    
    // 6.取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 7.结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

// 改变图片的大小
+ (UIImage *)image:(UIImage*)image byScalingToSize:(CGSize)targetSize {
    UIImage *sourceImage = image;
    UIImage *newImage = nil;
    
    UIGraphicsBeginImageContext(targetSize);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = CGPointZero;
    thumbnailRect.size.width  = targetSize.width;
    thumbnailRect.size.height = targetSize.height;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage ;
}


@end
