//
//  JHClassifyCollectionViewCell.m
//  ExperienceCentr
//
//  Created by 同城小鸟 on 2018/7/13.
//  Copyright © 2018年 同城小鸟. All rights reserved.
//

#import "JHClassifyCollectionViewCell.h"

@implementation JHClassifyCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.imageUrl];
        [self addSubview:self.name];
    }
    return self;
}


#pragma mark - getter
- (UIImageView *)imageUrl{
    if (!_imageUrl) {
        _imageUrl = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.mj_w, self.mj_w)];
    }
    return _imageUrl;
}

- (UILabel *)name{
    if (!_name) {
        _name = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imageUrl.frame)+3, self.mj_w, 20)];
        _name.font = [UIFont systemFontOfSize:15*JHHorizontalFlexibleRatio()];
        _name.textAlignment = NSTextAlignmentCenter;
    }
    return _name;
}


@end
