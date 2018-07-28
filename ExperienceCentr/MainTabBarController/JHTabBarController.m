//
//  JHTabBarController.m
//  ExperienceCentr
//
//  Created by 同城小鸟 on 2018/7/12.
//  Copyright © 2018年 同城小鸟. All rights reserved.
//

#import "JHTabBarController.h"

static JHTabBarController *manager = nil;

@interface JHTabBarController ()

@property (nonatomic, strong) UIViewController *rootViewController;
@property (nonatomic, assign) NSInteger indexFlag;

@end

@implementation JHTabBarController

+ (instancetype)sharedManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBarHeight = KSCREEN_HEIGHT == 812.f ? 83 : self.tabBar.frame.size.height;
    
    [self initializationAppearance];
}


- (void)initializationAppearance{
    NSArray *controllerNames = @[@"JHHomeViewController", @"JHClassifyViewController", @"JHShoppingCartViewController", @"JHMineViewController"];
    
    // 用来传递给标签控制器的数组
    NSMutableArray *viewControllers = [NSMutableArray array];
    
    NSArray *controllerTitles = @[@"首页", @"分类", @"购物车", @"我的"];
    NSArray *normalImages = @[@"home_uncheck",@"classify_uncheck",@"shopping_uncheck", @"mine_uncheck"];
    NSArray *selectedImages = @[@"home_selected",@"classify_selected",@"shopping_selected", @"mine_selected"];
    
    [controllerNames enumerateObjectsUsingBlock:^(NSString * obj, NSUInteger idx, BOOL *stop) {
        UIViewController *controller = [[NSClassFromString(obj) alloc] init];
        
        // 设置导航栏标题
        controller.title = controllerTitles[idx];
        UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:controller];
        navc.navigationBar.translucent = NO;
        
        controller.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:18], NSForegroundColorAttributeName: [UIColor redColor]};
//        controller.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
        controller.navigationController.navigationBar.tintColor = [UIColor blackColor];
        
        [viewControllers addObject:navc];
        
        NSString *normalImage = [normalImages[idx] stringByAppendingString:@".png"];
        NSString *selectedImage = [selectedImages[idx] stringByAppendingString:@".png"];
        
        // 禁止系统渲染图片
        UIImage *originNormalImage = [[UIImage imageNamed:normalImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        UIImage *originSelectedImage = [UIImage imageNamed:selectedImage];
        
        originSelectedImage = [originSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        // 重新给controller赋值tabBarItem
        navc.tabBarItem = [[UITabBarItem alloc] initWithTitle:controllerTitles[idx] image:originNormalImage selectedImage:originSelectedImage];
        
        // 设置tabBarItem的字体颜色
        [navc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor darkTextColor]} forState:UIControlStateNormal];
        [navc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor]} forState:UIControlStateSelected];
    }];
    
    // 标签控制器
    self.viewControllers = viewControllers;
    
    // 设置阴影
//    self.tabBar.layer.shadowOpacity = 0.3;
//    self.tabBar.layer.shadowOffset = CGSizeMake(0, -1);
    
    // 让标签栏不透明
//    self.tabBar.translucent = NO;
    
    self.selectedIndex = 0;
    if (self.selectedIndex == 0) {
        for (UIControl *btn in self.tabBar.subviews) {
            if ([btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                [btn addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            }
        }
    }
    
    [self setStatusBarBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"头像背景"]]];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

#pragma mark - 设置状态栏颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}


#pragma mark - UITabBarDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    for (UIControl *btn in self.tabBar.subviews) {
        if ([btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [btn addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}


#pragma mark - 执行动画
- (void)tabBarButtonClick:(UIControl *)item{
    NSInteger index = [self.tabBar.items indexOfObject:self.tabBar.selectedItem];
    if (index != self.indexFlag) {
        for (UIView *imageView in item.subviews) {
            if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
                //放大效果
                CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
                //速度控制函数，控制动画运行的节奏
                animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
                animation.duration = 0.2;       //执行时间
                animation.repeatCount = 1;      //执行次数
                animation.removedOnCompletion = NO;
                animation.fillMode = kCAFillModeForwards;           //保证动画效果延续
                animation.fromValue = [NSNumber numberWithFloat:0.7];   //初始伸缩倍数
                animation.toValue = [NSNumber numberWithFloat:1.0];     //结束伸缩倍数
                [imageView.layer addAnimation:animation forKey:nil];
            }
        }
        self.indexFlag = index;
    }
}


#pragma mark - getter https://blog.csdn.net/lvlemo/article/details/76607073
- (UIViewController *)rootViewController{
    if (!_rootViewController) {
        
//        UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:self];
//        navc.navigationBarHidden = YES;
        
        _rootViewController = self;
    }
    return _rootViewController;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
