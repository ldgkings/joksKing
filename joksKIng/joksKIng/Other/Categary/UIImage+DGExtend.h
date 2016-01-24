//
//  UIImage+DGExtend.h
//  微博项目
//
//  Created by etcxm on 15/9/24.
//  Copyright (c) 2015年 etcxm. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIImage (DGExtend)

// 返回一个带边框的裁剪的图片
+ (instancetype)circleImageWithImage:(UIImage *)oldImage borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

+ (instancetype)imageWithRenderingName:(NSString *)imageName;

+ (instancetype )resizableImage:(UIImage *)image;

+ (UIImage *)imageWithColor:(UIColor *)color;

// 改变图片的大小
+ (UIImage *)image:(UIImage*)image byScalingToSize:(CGSize)targetSize;

@end
