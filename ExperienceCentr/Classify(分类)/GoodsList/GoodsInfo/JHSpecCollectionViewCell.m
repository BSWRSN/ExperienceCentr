//
//  JHSpecCollectionViewCell.m
//  ExperienceCentr
//
//  Created by 同城小鸟 on 2018/7/16.
//  Copyright © 2018年 同城小鸟. All rights reserved.
//

#import "JHSpecCollectionViewCell.h"

@implementation JHSpecCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.jhBtn];
        
//        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.bounds.size.width, self.contentView.bounds.size.height)];
//        image.image = [self createImageWithColor:[UIColor yellowColor]];
//        [self.contentView addSubview:image];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat boundMargin = 0.0f;
    CGFloat ory = 0.0f;
    
    self.jhBtn.frame = CGRectMake(boundMargin, ory, self.contentView.bounds.size.width - 2 * boundMargin, self.contentView.bounds.size.height - 2 * ory);
//    self.contentView.layer.cornerRadius = self.contentView.bounds.size.height * 0.5;
    self.contentView.layer.cornerRadius = 7;
    self.contentView.layer.masksToBounds = YES;
}


- (UIImage*)createImageWithColor:(UIColor*)color{
    CGRect rect = CGRectMake(0,0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


- (UIButton *)jhBtn{
    if (!_jhBtn) {
        _jhBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_jhBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_jhBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [_jhBtn setBackgroundImage:[self createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [_jhBtn setBackgroundImage:[self createImageWithColor:[UIColor blackColor]] forState:UIControlStateSelected];
        _jhBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _jhBtn.userInteractionEnabled = NO;
    }
    return _jhBtn;
}


@end
