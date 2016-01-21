//
//  DGQuicklyLoginButton.m
//  joksKIng
//
//  Created by LDG on 16/1/21.
//  Copyright © 2016年 ldg. All rights reserved.
//

#import "DGQuicklyLoginButton.h"

@implementation DGQuicklyLoginButton

- (void)awakeFromNib
{
    self.imageView.contentMode = UIViewContentModeCenter;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

   // 调整图片的位置
    self.imageView.x = 0;
    self.imageView.y = 0;
    self.imageView.width = self.width;
    self.imageView.height = self.height * 0.75;
    
    // 调整文字的位置
    self.titleLabel.x = 0;
    self.titleLabel.y = CGRectGetMaxY(self.imageView.frame);
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.imageView.height;
}

@end
