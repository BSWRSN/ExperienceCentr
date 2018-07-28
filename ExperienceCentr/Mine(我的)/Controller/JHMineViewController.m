//
//  JHMineViewController.m
//  ExperienceCentr
//
//  Created by 同城小鸟 on 2018/7/12.
//  Copyright © 2018年 同城小鸟. All rights reserved.
//

#import "JHMineViewController.h"
#import "JHMineCollectionViewCell.h"
#import "JHCollectionReusableViewHeader.h"
#import "JHCollectionReusableViewFooter.h"
#import "JHClassifyViewController.h"
#import "JHSettingViewController.h"

#define background_height 190

@interface JHMineViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *orderStateArr;
@property (nonatomic, strong) NSArray *toolsArr;
@property (nonatomic, strong) UIImageView *headPortrait;
@property (nonatomic, strong) UILabel *username;
@property (nonatomic, strong) UILabel *account;
@property (nonatomic, strong) UIButton *vipBtn;
@property (nonatomic, strong) UILabel *exchangeIntegral;
@property (nonatomic, strong) UILabel *experienceIntegral;
@property (nonatomic, strong) UILabel *LBIntegral;

@end

@implementation JHMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self initializationAppearance];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


#pragma mark - 初始化外观
- (void)initializationAppearance{
    self.orderStateArr = @[@"待付款", @"待发货", @"待收货", @"全部订单"];
    self.toolsArr = @[@"优惠券", @"收藏", @"签到", @"推荐好友", @"足迹", @"收货地址", @"隐私安全", @"联系客服"];
    
    UIImageView *backgroundimage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, background_height)];
    backgroundimage.image = [UIImage imageNamed:@"头像背景"];
    [self.collectionView addSubview:backgroundimage];
    
    UIImage *originalImage = [[UIImage imageNamed:@"设置"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIButton *settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    settingBtn.frame = CGRectMake(KSCREEN_WIDTH-60, 0, 44, 44);
    [settingBtn setImage:originalImage forState:UIControlStateNormal];
    [settingBtn addTarget:self action:@selector(_settingBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.collectionView addSubview:settingBtn];
    
    unsigned int hex;
    [[NSScanner scannerWithString:@"e8002c"] scanHexInt:&hex];
    NSArray *moneyArr = @[@"兑换通证", @"体验分", @"LB通证"];
    for (int i = 0; i < 3; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.mj_x = i * KSCREEN_WIDTH/3;
        label.mj_y = CGRectGetMaxY(self.headPortrait.frame) +54;
        label.mj_w = KSCREEN_WIDTH/3;
        label.mj_h = 20;
        label.text = moneyArr[i];
        label.textColor = RGB_HEX(hex);
        label.font = [UIFont systemFontOfSize:13];
        label.textAlignment = NSTextAlignmentCenter;
        [self.collectionView addSubview:label];
        
        UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(label.mj_x, CGRectGetMaxY(self.headPortrait.frame)+27, 1, 47)];
        line.backgroundColor = i == 0 ? [UIColor clearColor] : [UIColor whiteColor];
        [self.collectionView addSubview:line];
    }
    
    
    [self.view addSubview:self.collectionView];
    [self.collectionView addSubview:self.headPortrait];
    [self.collectionView addSubview:self.username];
    [self.collectionView addSubview:self.account];
    [self.collectionView addSubview:self.vipBtn];
    [self.collectionView addSubview:self.exchangeIntegral];
    [self.collectionView addSubview:self.experienceIntegral];
    [self.collectionView addSubview:self.LBIntegral];
}


#pragma mark - 设置点击
- (void)_settingBtnClick{
    JHSettingViewController *vc = [[JHSettingViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - vipBtn点击
- (void)_vipBtnClick{
    
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (section == 0) {
        return self.orderStateArr.count;
    } else {
        return self.toolsArr.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JHMineCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        [cell.button setImage:[UIImage imageNamed:self.orderStateArr[indexPath.row]] forState:UIControlStateNormal];
        [cell.button setTitle:self.orderStateArr[indexPath.row] forState:UIControlStateNormal];
    } else if (indexPath.section == 1) {
        [cell.button setImage:[UIImage imageNamed:self.toolsArr[indexPath.row]] forState:UIControlStateNormal];
        [cell.button setTitle:self.toolsArr[indexPath.row] forState:UIControlStateNormal];
    }
    
    cell.button.imageEdgeInsets = UIEdgeInsetsMake((cell.button.mj_h-cell.button.imageView.mj_h-cell.button.titleLabel.mj_h-30)/2, (cell.button.mj_w-cell.button.imageView.mj_w)/2, (cell.button.mj_h-cell.button.imageView.mj_h-cell.button.titleLabel.mj_h)/2, (cell.button.mj_w-cell.button.imageView.mj_w)/2);
    cell.button.titleEdgeInsets = UIEdgeInsetsMake(CGRectGetMaxY(cell.button.imageView.frame)+20, -cell.button.imageView.mj_w, (cell.button.mj_h-cell.button.imageView.mj_h-cell.button.titleLabel.mj_h-10)/2, 0);
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        JHCollectionReusableViewHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"JHCollectionReusableViewHeader" forIndexPath:indexPath];
        if (indexPath.section == 0) {
            header.name.mj_y = background_height;
            header.name.text = @"我的订单";
        } else {
            header.name.mj_y = 0;
            header.name.text = @"我的功能";
        }
        
        return header;
    } else {
        JHCollectionReusableViewFooter *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"JHCollectionReusableViewFooter" forIndexPath:indexPath];
        if (indexPath.section == 0) {
            footer.imageUrl.hidden = YES;
        } else {
            footer.imageUrl.hidden = NO;
        }
        return footer;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    JHClassifyViewController *vc = [[JHClassifyViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - UICollectionViewDelegateFlowLayout
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return CGSizeMake(KSCREEN_WIDTH, background_height +44);
    } else {
        return CGSizeMake(KSCREEN_WIDTH, 44);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    
    if (section == 0) {
        return CGSizeMake(KSCREEN_WIDTH, 15);
    } else {
        return CGSizeMake(KSCREEN_WIDTH, 60*JHVerticalFlexibleRatio());
    }
}


#pragma mark - getter
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(KSCREEN_WIDTH/4, KSCREEN_WIDTH/4);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEN_HEIGHT) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        [_collectionView registerClass:[JHMineCollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
        [_collectionView registerClass:[JHCollectionReusableViewHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"JHCollectionReusableViewHeader"];
        [_collectionView registerClass:[JHCollectionReusableViewFooter class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"JHCollectionReusableViewFooter"];
    }
    return _collectionView;
}

- (UIImageView *)headPortrait{
    if (!_headPortrait) {
        _headPortrait = [[UIImageView alloc] initWithFrame:CGRectMake(20, 44, 60, 60)];
        _headPortrait.image = [UIImage imageNamed:@"头像"];
        _headPortrait.layer.cornerRadius = 30;
        _headPortrait.layer.masksToBounds = YES;
    }
    return _headPortrait;
}

- (UILabel *)username{
    if (!_username) {
        _username = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headPortrait.frame)+15, self.headPortrait.mj_y+7, 85, 20)];
        _username.text = @"赚钱机会";
        _username.textColor = [UIColor whiteColor];
        _username.font = [UIFont boldSystemFontOfSize:19];
        [_username sizeToFit];
    }
    return _username;
}

- (UILabel *)account{
    if (!_account) {
        _account = [[UILabel alloc] initWithFrame:CGRectMake(self.username.mj_x, CGRectGetMaxY(self.username.frame)+5, 177, 24)];
        _account.text = @"TC60929267";
        _account.textColor = [UIColor whiteColor];
        _account.font = [UIFont systemFontOfSize:15];
        [_account sizeToFit];
    }
    return _account;
}

- (UIButton *)vipBtn{
    if (!_vipBtn) {
        unsigned int hex;
        [[NSScanner scannerWithString:@"e8002c"] scanHexInt:&hex];
        
        _vipBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _vipBtn.frame = CGRectMake(CGRectGetMaxX(self.username.frame)+15, self.username.mj_y+3, 67, 18);
        [_vipBtn setTitle:@"四星会员" forState:UIControlStateNormal];
        [_vipBtn setTitleColor:RGB_HEX(hex) forState:UIControlStateNormal];
        _vipBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        _vipBtn.layer.cornerRadius = 9;
        _vipBtn.layer.borderWidth = 1;
        _vipBtn.layer.borderColor = RGB_HEX(hex).CGColor;
        [_vipBtn addTarget:self action:@selector(_vipBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _vipBtn;
}

- (UILabel *)exchangeIntegral{
    if (!_exchangeIntegral) {
        _exchangeIntegral = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headPortrait.frame)+27, KSCREEN_WIDTH/3, 27)];
        _exchangeIntegral.text = @"¥5201314.97";
        _exchangeIntegral.textColor = [UIColor whiteColor];
        _exchangeIntegral.font = [UIFont systemFontOfSize:15];
        _exchangeIntegral.textAlignment = NSTextAlignmentCenter;
    }
    return _exchangeIntegral;
}

- (UILabel *)experienceIntegral{
    if (!_experienceIntegral) {
        _experienceIntegral = [[UILabel alloc] initWithFrame:CGRectMake(KSCREEN_WIDTH/3, _exchangeIntegral.mj_y, KSCREEN_WIDTH/3, 27)];
        _experienceIntegral.text = @"¥5297.00";
        _experienceIntegral.textColor = [UIColor whiteColor];
        _experienceIntegral.font = [UIFont systemFontOfSize:15];
        _experienceIntegral.textAlignment = NSTextAlignmentCenter;
    }
    return _experienceIntegral;
}

- (UILabel *)LBIntegral{
    if (!_LBIntegral) {
        _LBIntegral = [[UILabel alloc] initWithFrame:CGRectMake(KSCREEN_WIDTH-KSCREEN_WIDTH/3, _exchangeIntegral.mj_y, KSCREEN_WIDTH/3, 27)];
        _LBIntegral.text = @"¥5297.00";
        _LBIntegral.textColor = [UIColor whiteColor];
        _LBIntegral.font = [UIFont systemFontOfSize:15];
        _LBIntegral.textAlignment = NSTextAlignmentCenter;
    }
    return _LBIntegral;
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
