//
//  JHHomeViewController.m
//  ExperienceCentr
//
//  Created by 同城小鸟 on 2018/7/12.
//  Copyright © 2018年 同城小鸟. All rights reserved.
//

#import "JHHomeViewController.h"
#import "JHCollectionReusableViewHeader.h"
#import "JHGoodsCollectionViewCell.h"
#import "JHGoodsInfoViewController.h"

@interface JHHomeViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UITextField *searchTextField;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *adsImageView;
@property (nonatomic, strong) UIView *dailyView;

@end

@implementation JHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self _initializationAppearance];
    [self initAdsImageView];
    [self initDailyView];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

#pragma mark - 初始化外观
- (void)_initializationAppearance{
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.searchTextField];
    [self.collectionView addSubview:self.scrollView];
    [self.collectionView addSubview:self.adsImageView];
    
    NSArray *classifyArr = @[@"线下体验", @"纳晶水光", @"套装礼盒", @"全部分类"];
    CGFloat with = 0, count = 0;
    for (NSInteger i = 0; i < classifyArr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        if (with >= KSCREEN_WIDTH) {
            with = 0;
            count++;
            btn.mj_x = with;
        } else {
            btn.mj_x = with;
        }
        with += KSCREEN_WIDTH/4;
        btn.mj_y = CGRectGetMaxY(self.scrollView.frame)+count*(KSCREEN_WIDTH/4);
        btn.mj_w = KSCREEN_WIDTH/4;
        btn.mj_h = KSCREEN_WIDTH/4;
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitle:classifyArr[i] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:classifyArr[1]] forState:UIControlStateNormal];
        btn.imageEdgeInsets = UIEdgeInsetsMake((btn.mj_h - btn.imageView.mj_h-btn.titleLabel.mj_h -44)/2, (btn.mj_w - btn.imageView.mj_w)/2, (btn.mj_h -btn.imageView.mj_h - btn.titleLabel.mj_h)/2, (btn.mj_w - btn.imageView.mj_w)/2);
        btn.titleEdgeInsets = UIEdgeInsetsMake(CGRectGetMaxY(btn.imageView.frame)+10, -btn.imageView.mj_w, (btn.mj_h - btn.imageView.mj_h - btn.titleLabel.mj_h -10)/2, 0);
        [btn addTarget:self action:@selector(classifyBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 277 + i;
        [self.collectionView addSubview:btn];
    }
}


- (void)initAdsImageView{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, self.scrollView.mj_h)];
    imageView.image = [UIImage imageNamed:@"banner"];
    [self.scrollView addSubview:imageView];
}


#pragma mark - 每日必看
- (void)initDailyView{
    [self.collectionView addSubview:self.dailyView];
    
    for (NSInteger i = 0; i < 4; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        if (i == 0) {
            imageView.frame = CGRectMake(9, 60, (KSCREEN_WIDTH-20)/7*3, (KSCREEN_WIDTH-20)/7*4+1);
        } else if (i == 1) {
            imageView.frame = CGRectMake(10+(KSCREEN_WIDTH-20)/7*3, 60, (KSCREEN_WIDTH-20)/7*4, (KSCREEN_WIDTH-20)/7*2);
        } else if (i == 2) {
            imageView.frame = CGRectMake(10+(KSCREEN_WIDTH-20)/7*3, 60+(KSCREEN_WIDTH-20)/7*2+1, (KSCREEN_WIDTH-20)/7*2-1, (KSCREEN_WIDTH-20)/7*2);
        } else {
            imageView.frame = CGRectMake(10+(KSCREEN_WIDTH-20)/7*5, 60+(KSCREEN_WIDTH-20)/7*2+1, (KSCREEN_WIDTH-20)/7*2, (KSCREEN_WIDTH-20)/7*2);
        }
        imageView.backgroundColor = [UIColor yellowColor];
        imageView.layer.borderWidth = 0.5;
        imageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [self.dailyView addSubview:imageView];
    }
}


#pragma mark - 分类点击
- (void)classifyBtnClick:(UIButton *)sender{
    NSLog(@"%ld", sender.tag);
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 7;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 7;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JHGoodsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    
    cell.imageUrl.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"洗面洁面"]];
    cell.name.text = @"帅气黄家豪VS女神范朱琪";
    cell.sales.text = [NSString stringWithFormat:@"销量:%@", @"5297"];
    cell.price.text = [NSString stringWithFormat:@"¥%@", @"5297.77"];
    [cell.name sizeToFit];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        JHCollectionReusableViewHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"JHCollectionReusableViewHeader" forIndexPath:indexPath];
        if (indexPath.section == 0) {
            header.name.mj_y = CGRectGetMaxY(self.dailyView.frame)+5;
            header.name.text = @"VIP活动专区";
        } else {
            header.name.mj_y = 0;
            header.name.text = @"我的功能";
        }
        return header;
    }
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    JHGoodsInfoViewController *vc = [[JHGoodsInfoViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return CGSizeMake(KSCREEN_WIDTH, CGRectGetMaxY(self.dailyView.frame)+49);
    } else {
        return CGSizeMake(KSCREEN_WIDTH, 44);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake((KSCREEN_WIDTH-20)/3, (KSCREEN_WIDTH-20)/3 +87);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return 5;
}


#pragma mark - getter
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
//        layout.minimumInteritemSpacing = 5;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEN_HEIGHT-CGRectGetMaxY(self.navigationController.navigationBar.frame)) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        [_collectionView registerClass:[JHGoodsCollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
        [_collectionView registerClass:[JHCollectionReusableViewHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"JHCollectionReusableViewHeader"];
    }
    return _collectionView;
}

- (UITextField *)searchTextField{
    if (!_searchTextField) {
        _searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY([UIApplication sharedApplication].statusBarFrame)+5, KSCREEN_WIDTH-40, 34)];
        _searchTextField.backgroundColor = [UIColor whiteColor];
        _searchTextField.placeholder = @"搜索";
        _searchTextField.leftView = [JH_sharedManager textFieldLeftViewWithText:nil imageStr:@"搜索" width:44 height:30];
        _searchTextField.leftViewMode = UITextFieldViewModeAlways;
        _searchTextField.layer.cornerRadius = 17;
        _searchTextField.layer.masksToBounds = YES;
        
        UIImageView *bacImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY([UIApplication sharedApplication].statusBarFrame), KSCREEN_WIDTH, 44)];
        bacImage.image = [UIImage imageNamed:@"顶部透明阴影"];
        [self.view addSubview:bacImage];
    }
    return _searchTextField;
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, 135*JHVerticalFlexibleRatio())];
        _scrollView.contentSize = CGSizeMake(KSCREEN_WIDTH * 2, 0);
    }
    return _scrollView;
}

- (UIImageView *)adsImageView{
    if (!_adsImageView) {
        _adsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.scrollView.frame) + KSCREEN_WIDTH/4 +10, KSCREEN_WIDTH-20, 77*JHVerticalFlexibleRatio())];
        _adsImageView.image = [UIImage imageNamed:@"timg"];
    }
    return _adsImageView;
}

- (UIView *)dailyView{
    if (!_dailyView) {
        _dailyView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.adsImageView.frame)+10, KSCREEN_WIDTH, (KSCREEN_WIDTH-20)/7*4 + 77)];
        _dailyView.backgroundColor = [UIColor whiteColor];
        
        for (NSInteger i = 0; i < 2; i++) {
            UILabel *label = [[UILabel alloc] init];
            label.mj_x = i == 0 ? 15 : 0;
            label.mj_y = i == 0 ? 0 : 49;
            label.mj_w = i == 0 ? KSCREEN_WIDTH-15 : KSCREEN_WIDTH;
            label.mj_h = i == 0 ? 49 : 1;
            label.text = i == 0 ? @"每日必看" : nil;
            label.backgroundColor = i == 0 ? nil : [UIColor lightGrayColor];
            [_dailyView addSubview:label];
        }
    }
    return _dailyView;
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
