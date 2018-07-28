//
//  JHAdaptScreen.h
//  ExperienceCentr
//
//  Created by 同城小鸟 on 2018/7/12.
//  Copyright © 2018年 同城小鸟. All rights reserved.
//

#ifndef JHAdaptScreen_h
#define JHAdaptScreen_h


#import <UIKit/UIKit.h>

static const CGFloat baseScreenWidth = 375.f;
static const CGFloat baseScreenHeight = 667.f;

#define JH_INLINE   static inline
// 内联函数：函数的栈只分配一次
// 尽量用在使用频繁，函数体简单的函数

/**
 *  当前屏幕高度/基准屏幕高度
 *
 *  @return 竖直方向的比例
 */
JH_INLINE CGFloat JHVerticalFlexibleRatio()
{
    CGFloat screen_height = [UIScreen mainScreen].bounds.size.height;
    
    return screen_height == 812.f ? 1 : [UIScreen mainScreen].bounds.size.height / baseScreenHeight;
}

/**
 *  水平方向的比例=当前屏幕的宽/基准屏幕的宽
 *
 *  @return 水平方向的比例
 
 */
JH_INLINE CGFloat JHHorizontalFlexibleRatio()
{
    return [UIScreen mainScreen].bounds.size.width /  baseScreenWidth;
}

// 外面传一个frame进来，我们通过等比例的操作反一个frame出去
// 但是我们的等比例需要对center操作
// 所以先要把frame拆分成center和size，再分别对center和size等比例适配，再把适配后的center和size合成一个frame返回
// 在适配size的时候有两种情况：宽高同时乘以高的比例，对一般的视图；宽乘以宽的比例，高乘以高的比例，对要铺满屏幕宽的视图。

// 通过center和size合成一个frame
JH_INLINE CGRect JHFrameWithCenterAndSize(CGPoint center, CGSize size)
{
    return CGRectMake(center.x - size.width/2, center.y - size.height/2, size.width, size.height);
}

/**
 *  通过基准屏幕下的size返回当前屏幕下适配的size
 *
 *  @param baseSize 基准屏幕下的size
 *  @param flag     YES表示宽和高都乘以高的比例，NO表示宽乘以宽的比例，高乘以高的比例
 *
 *  @return 适配后的size
 */
JH_INLINE CGSize JHFlexibleSizeWithBaseSize(CGSize baseSize, BOOL flag)
{
    CGFloat ratio = flag ? JHVerticalFlexibleRatio() : JHHorizontalFlexibleRatio();
    // 宽通过flag来判断是乘以高的比例还是宽的比例
    CGFloat width = baseSize.width * ratio;
    // 高直接乘以高的比例
    CGFloat height = baseSize.height * JHVerticalFlexibleRatio();
    return CGSizeMake(width, height);
}

/**
 *  通过基准屏幕的center返回适配后的center
 *
 *  @param baseCenter 基准屏幕的center
 *
 *  @return 适配后的center
 */
JH_INLINE CGPoint JHFlexibleCenterWithBaseCenter(CGPoint baseCenter)
{
    CGFloat x = baseCenter.x * JHHorizontalFlexibleRatio();
    CGFloat y = baseCenter.y * JHVerticalFlexibleRatio();
    return CGPointMake(x, y);
}

JH_INLINE CGRect JHFlexibleFrameWithBaseFrame(CGRect baseFrame, BOOL flag)
{
    // 适配size
    CGSize size = JHFlexibleSizeWithBaseSize(baseFrame.size, flag);
    // 适配center
    CGPoint center = CGPointMake(baseFrame.origin.x + baseFrame.size.width/2, baseFrame.origin.y + baseFrame.size.height/2);
    center = JHFlexibleCenterWithBaseCenter(center);
    // 通过适配好的 size和center合成frame然后返回
    return JHFrameWithCenterAndSize(center, size);
    
}

#endif /* JHAdaptScreen_h */
