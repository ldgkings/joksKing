//
//  DGEssenceTagCell.m
//  joksKIng
//
//  Created by LDG on 16/1/21.
//  Copyright © 2016年 ldg. All rights reserved.
//

#import <UIImageView+WebCache.h>
#import "DGEssenceTagCell.h"
#import "DGEssenceTag.h"


@interface DGEssenceTagCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UILabel *subTitle;

@end

@implementation DGEssenceTagCell

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setEssencetag:(DGEssenceTag *)essencetag
{
    _essencetag = essencetag;
    // 名称
    self.nameView.text = essencetag.theme_name;
    
    // 阅读数
    NSString *subText;
    if (essencetag.sub_number >= 10000) {
        subText = [NSString stringWithFormat:@"%.1f万人订阅",essencetag.sub_number / 10000.0];
    }else{
        subText = [NSString stringWithFormat:@"%ld人订阅",essencetag.sub_number];
    }
    self.subTitle.text = subText;
    
    // 头像
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:essencetag.image_list]  placeholderImage:[UIImage imageNamed:@"defaultUserIcon"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        UIImage *newImage = [UIImage circleImageWithImage:image borderWidth:0 borderColor:nil];
        self.iconView.image = newImage;
    }];

}

- (void)setFrame:(CGRect)frame
{
    frame.size.height -= 0.3;
    [super setFrame:frame];
}

@end
