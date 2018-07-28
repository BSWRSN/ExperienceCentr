//
//  JHTabBarController.h
//  ExperienceCentr
//
//  Created by 同城小鸟 on 2018/7/12.
//  Copyright © 2018年 同城小鸟. All rights reserved.
//

#import <UIKit/UIKit.h>

#define tabBar_height [JHTabBarController sharedManager].tabBarHeight

@interface JHTabBarController : UITabBarController

@property (nonatomic, strong, readonly) UIViewController *rootViewController;
@property (nonatomic, assign) CGFloat tabBarHeight;

+ (instancetype)sharedManager;

@end
