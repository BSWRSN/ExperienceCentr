//
//  JHClassifyTableViewCell.m
//  ExperienceCentr
//
//  Created by 同城小鸟 on 2018/7/13.
//  Copyright © 2018年 同城小鸟. All rights reserved.
//

#import "JHClassifyTableViewCell.h"

@implementation JHClassifyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.nameBtn];
    }
    return self;
}



- (UIImage*)createImageWithColor: (UIColor*) color{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}


- (UIButton *)nameBtn{
    if (!_nameBtn) {
        _nameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _nameBtn.frame = CGRectMake(7, 7, self.mj_w-14, 36);
        [_nameBtn setBackgroundImage:[self createImageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
        [_nameBtn setBackgroundImage:[self createImageWithColor:[UIColor blackColor]] forState:UIControlStateSelected];
        [_nameBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_nameBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        _nameBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _nameBtn.userInteractionEnabled = NO;
        _nameBtn.layer.cornerRadius = 18;
        _nameBtn.layer.masksToBounds = YES;
    }
    return _nameBtn;
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
