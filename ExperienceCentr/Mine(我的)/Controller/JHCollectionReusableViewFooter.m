//
//  JHCollectionReusableViewFooter.m
//  ExperienceCentr
//
//  Created by 同城小鸟 on 2018/7/12.
//  Copyright © 2018年 同城小鸟. All rights reserved.
//

#import "JHCollectionReusableViewFooter.h"

@implementation JHCollectionReusableViewFooter

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.imageUrl];
    }
    return self;
}


- (void)imageUrlTapGestureRecognizer:(UITapGestureRecognizer *)sender{
    NSLog(@"我爱你朱琪😘😘😘%.f", sender.view.mj_h);
}


- (UIImageView *)imageUrl{
    if (!_imageUrl) {
        _imageUrl = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, self.mj_h)];
        _imageUrl.image = [UIImage imageNamed:@"banner1"];
        _imageUrl.hidden = YES;
        _imageUrl.userInteractionEnabled = YES;
        [_imageUrl addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageUrlTapGestureRecognizer:)]];
    }
    return _imageUrl;
}

@end
