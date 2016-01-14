//
//  UIImage+DGExtend.h
//  微博项目
//
//  Created by etcxm on 15/9/24.
//  Copyright (c) 2015年 etcxm. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIImage (DGExtend)

+ (instancetype)imageWithRenderingName:(NSString *)imageName;

+ (instancetype )resizableImage:(UIImage *)image;

+ (UIImage *)imageWithColor:(UIColor *)color;

@end
