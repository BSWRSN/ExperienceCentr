//
//  JHCollectionReusableViewHeader.m
//  ExperienceCentr
//
//  Created by 同城小鸟 on 2018/7/12.
//  Copyright © 2018年 同城小鸟. All rights reserved.
//

#import "JHCollectionReusableViewHeader.h"

@implementation JHCollectionReusableViewHeader

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _line = [[UILabel alloc] initWithFrame:CGRectMake(-15, CGRectGetMaxY(self.name.frame), KSCREEN_WIDTH, 1)];
        _line.backgroundColor = [UIColor lightGrayColor];
        [self.name addSubview:_line];
        [self addSubview:self.name];
    }
    return self;
}


- (UILabel *)name{
    if (!_name) {
        _name = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, KSCREEN_WIDTH-30, 43)];
        _name.backgroundColor = [UIColor whiteColor];
        _name.textAlignment = NSTextAlignmentLeft;

        for (int i = 0; i < 2; i++) {
            UIView *bac = [[UIView alloc] initWithFrame:CGRectMake(i == 0 ? -15 : self.name.mj_w, 0, 15, self.name.mj_h)];
            bac.backgroundColor = [UIColor whiteColor];
            [self.name addSubview:bac];
        }
    }
    return _name;
}

@end
