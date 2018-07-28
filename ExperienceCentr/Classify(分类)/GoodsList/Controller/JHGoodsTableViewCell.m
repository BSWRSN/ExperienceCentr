//
//  JHGoodsTableViewCell.m
//  ExperienceCentr
//
//  Created by 同城小鸟 on 2018/7/14.
//  Copyright © 2018年 同城小鸟. All rights reserved.
//

#import "JHGoodsTableViewCell.h"

@implementation JHGoodsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        
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
        _imageUrl = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    }
    return _imageUrl;
}

- (UILabel *)name{
    if (!_name) {
        _name = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.imageUrl.frame)+10, self.imageUrl.mj_y+10, KSCREEN_WIDTH-120, 20)];
        _name.font = [UIFont systemFontOfSize:14];
        _name.textAlignment = NSTextAlignmentLeft;
        _name.numberOfLines = 2;
    }
    return _name;
}

- (UILabel *)sales{
    if (!_sales) {
        _sales = [[UILabel alloc] initWithFrame:CGRectMake(self.name.mj_x, CGRectGetMaxY(self.imageUrl.frame)-44, self.name.mj_w, 20)];
        _sales.font = [UIFont systemFontOfSize:13];
        _sales.textAlignment = NSTextAlignmentLeft;
        _sales.textColor = [UIColor lightGrayColor];
    }
    return _sales;
}

- (UILabel *)price{
    if (!_price) {
        _price = [[UILabel alloc] initWithFrame:CGRectMake(self.name.mj_x, CGRectGetMaxY(self.imageUrl.frame)-24, self.name.mj_w, 20)];
        _price.font = [UIFont systemFontOfSize:17];
        _price.textAlignment = NSTextAlignmentLeft;
        _price.textColor = [UIColor redColor];
    }
    return _price;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
