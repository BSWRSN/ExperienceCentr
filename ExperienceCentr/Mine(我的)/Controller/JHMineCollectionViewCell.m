//
//  JHMineCollectionViewCell.m
//  ExperienceCentr
//
//  Created by 同城小鸟 on 2018/7/12.
//  Copyright © 2018年 同城小鸟. All rights reserved.
//

#import "JHMineCollectionViewCell.h"

@implementation JHMineCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.button];
    }
    return self;
}

- (UIButton *)button{
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(0, 0, self.mj_w, self.mj_h);
        [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _button.titleLabel.font = [UIFont systemFontOfSize:15];
        _button.userInteractionEnabled = NO;
    }
    return _button;
}

@end
