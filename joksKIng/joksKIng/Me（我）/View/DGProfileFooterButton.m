//
//  DGProfileFooterButton.m
//  joksKIng
//
//  Created by LDG on 16/1/24.
//  Copyright © 2016年 ldg. All rights reserved.
//

#import <UIButton+WebCache.h>
#import "DGProfileFooterButton.h"
#import "DGProfileSquare.h"


@implementation DGProfileFooterButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.x = 0;
    self.imageView.y = DGMainMargin * 0.5;
    self.imageView.width = self.width;
    self.imageView.height = self.height * 0.6;
    
    self.titleLabel.x = 0;
    self.titleLabel.y = CGRectGetMaxY(self.imageView.frame);
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.imageView.height;
}


- (void)setSquare:(DGProfileSquare *)square
{
    _square = square;
    
    [self setTitle:square.name forState:UIControlStateNormal];
    
    [self sd_setImageWithURL:[NSURL URLWithString:square.icon] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"defaultUserIcon"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        UIImage *targeImage = [UIImage image:image byScalingToSize:CGSizeMake(44,44)];
        UIImage *newImage = [UIImage circleImageWithImage:targeImage borderWidth:0 borderColor:nil];
        [self setImage:newImage forState:UIControlStateNormal];
    }];
}




@end
