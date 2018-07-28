//
//  JHMethodsShared.h
//  ExperienceCentr
//
//  Created by 同城小鸟 on 2018/7/21.
//  Copyright © 2018年 同城小鸟. All rights reserved.
//

#import <Foundation/Foundation.h>

#define JH_sharedManager [JHMethodsShared sharedManager]

@interface JHMethodsShared : NSObject

+ (instancetype)sharedManager;

- (UIView *)textFieldLeftViewWithText:(NSString *)text imageStr:(NSString *)imageStr width:(CGFloat)width height:(CGFloat)height;

@end
