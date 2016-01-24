//
//  DGEssenceTag.h
//  joksKIng
//
//  Created by LDG on 16/1/21.
//  Copyright © 2016年 ldg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DGEssenceTag : NSObject

/** 名字 */
@property (nonatomic, copy) NSString *theme_name;
/** 图片 */
@property (nonatomic, copy) NSString *image_list;
/** 订阅数 */
@property (nonatomic, assign) NSInteger sub_number;

@end
