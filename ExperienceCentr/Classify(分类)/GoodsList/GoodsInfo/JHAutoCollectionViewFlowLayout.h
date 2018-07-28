//
//  JHAutoCollectionViewFlowLayout.h
//  ExperienceCentr
//
//  Created by 同城小鸟 on 2018/7/16.
//  Copyright © 2018年 同城小鸟. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JHCellAlignment){
    JHCellAlignmentLeft,
    JHCellAlignmentCenter,
    JHCellAlignmentRight
};

@interface JHAutoCollectionViewFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) NSInteger JH_cellAlignment;

@end
