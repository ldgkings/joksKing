//
//  DGProfileCell.m
//  joksKIng
//
//  Created by LDG on 16/1/24.
//  Copyright © 2016年 ldg. All rights reserved.
//

#import "DGProfileCell.h"

@implementation DGProfileCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
        self.textLabel.font = [UIFont systemFontOfSize:16];
        self.textLabel.textColor = [UIColor darkGrayColor];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.y = DGMainMargin * 0.5;
    self.imageView.height = self.height - DGMainMargin;
    self.imageView.width = self.imageView.height;

}

@end
