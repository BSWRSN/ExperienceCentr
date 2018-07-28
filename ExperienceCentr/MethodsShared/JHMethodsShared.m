//
//  JHMethodsShared.m
//  ExperienceCentr
//
//  Created by 同城小鸟 on 2018/7/21.
//  Copyright © 2018年 同城小鸟. All rights reserved.
//

#import "JHMethodsShared.h"

static JHMethodsShared *manager = nil;

@implementation JHMethodsShared

+ (instancetype)sharedManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (UIView *)textFieldLeftViewWithText:(NSString *)text imageStr:(NSString *)imageStr width:(CGFloat)width height:(CGFloat)height{
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    
    if (imageStr == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        label.text = text;
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentCenter;
        [leftView addSubview:label];
        
    } else {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        imageView.image = [UIImage imageNamed:imageStr];
        [leftView addSubview:imageView];
    }
    return leftView;
}

@end
