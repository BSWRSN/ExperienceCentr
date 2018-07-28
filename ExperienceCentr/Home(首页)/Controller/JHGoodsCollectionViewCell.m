//
//  JHGoodsCollectionViewCell.m
//  ExperienceCentr
//
//  Created by 同城小鸟 on 2018/7/13.
//  Copyright © 2018年 同城小鸟. All rights reserved.
//

#import "JHGoodsCollectionViewCell.h"

@implementation JHGoodsCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(-5, 0, 5, self.mj_h)];
        line.backgroundColor = [UIColor whiteColor];
        [self addSubview:line];
        [self addSubview:self.imageUrl];
        [self addSubview:self.name];
        [self addSubview:self.sales];
        [self addSubview:self.price];
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
        _name = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imageUrl.frame)+5, self.mj_w, 20)];
        _name.font = [UIFont systemFontOfSize:14];
        _name.textAlignment = NSTextAlignmentLeft;
        _name.numberOfLines = 2;
    }
    return _name;
}

- (UILabel *)sales{
    if (!_sales) {
        _sales = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imageUrl.frame)+44, self.mj_w, 20)];
        _sales.font = [UIFont systemFontOfSize:13];
        _sales.textAlignment = NSTextAlignmentLeft;
        _sales.textColor = [UIColor lightGrayColor];
    }
    return _sales;
}

- (UILabel *)price{
    if (!_price) {
        _price = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.sales.frame), self.mj_w, 20)];
        _price.font = [UIFont systemFontOfSize:17];
        _price.textAlignment = NSTextAlignmentLeft;
        _price.textColor = [UIColor redColor];
    }
    return _price;
}



@end
