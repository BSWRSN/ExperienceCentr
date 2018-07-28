//
//  JHGoodsInfoViewController.m
//  ExperienceCentr
//
//  Created by 同城小鸟 on 2018/7/16.
//  Copyright © 2018年 同城小鸟. All rights reserved.
//

#import "JHGoodsInfoViewController.h"
#import "JHSpecCollectionViewCell.h"
#import "JHAutoCollectionViewFlowLayout.h"
#import "JHCollectionReusableViewHeader.h"

#define RandColor RGBColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

static NSString *const kUICollectionViewCellIdentifier = @"UICollectionViewCellIdentifier";

@interface JHGoodsInfoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>{
    UIButton *_firstSelectedBtn, *_secondSelectedBtn;
}

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIButton *shoppingBtn;
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) UIView *specView;


@end

@implementation JHGoodsInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self.view addSubview:self.shoppingBtn];
    
    [self.specView addSubview:self.collectionView];
}

- (void)viewWillAppear:(BOOL)animated{
    self.shoppingBtn.mj_y = KSCREEN_HEIGHT-tabBar_height-CGRectGetMaxY(self.navigationController.navigationBar.frame);
}


- (void)shoppingBtnClick{
    [[UIApplication sharedApplication].keyWindow addSubview:self.maskView];
    [[UIApplication sharedApplication].keyWindow setCenter:self.maskView.center];
    [[UIApplication sharedApplication].keyWindow addSubview:self.specView];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.specView.mj_y -= self.specView.mj_h;
        self.maskView.alpha = 0.4;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)removeMask:(UITapGestureRecognizer *)sender{
    [UIView animateWithDuration:0.3 animations:^{
        self.specView.mj_y += self.specView.mj_h;
        self.maskView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.maskView removeFromSuperview];
        [self.specView removeFromSuperview];
    }];
}


#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 7;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JHSpecCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:kUICollectionViewCellIdentifier forIndexPath:indexPath];
//    cell.contentView.backgroundColor = RandColor;
    if (indexPath.section == 0) {
        [cell.jhBtn setTitle:@"帅气老公黄家豪" forState:UIControlStateNormal];
    } else if (indexPath.section == 1) {
        [cell.jhBtn setTitle:@"女神老婆朱琪" forState:UIControlStateNormal];
    }
//    cell.hkLab.text = self.hotKeys[indexPath.item];
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    JHSpecCollectionViewCell *cell = (JHSpecCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if (indexPath.section == 0 && _firstSelectedBtn != cell.jhBtn) {
        cell.jhBtn.selected = YES;
        _firstSelectedBtn.selected = NO;
        _firstSelectedBtn = cell.jhBtn;
    } else if (indexPath.section == 1 && _secondSelectedBtn != cell.jhBtn) {
        cell.jhBtn.selected = YES;
        _secondSelectedBtn.selected = NO;
        _secondSelectedBtn = cell.jhBtn;
    }
    
    
    NSLog(@"点击了:  %@",cell.jhBtn.titleLabel.text);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        JHCollectionReusableViewHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"JHCollectionReusableViewHeader" forIndexPath:indexPath];
        header.mj_h = 49;
        if (indexPath.section == 0) {
            header.mj_y = 100;
            header.name.text = @"女神老婆朱琪😘";
        } else {
            header.name.mj_y = 0;
            header.name.text = @"帅气老公黄家豪😘";
        }
        return header;
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return CGSizeMake(KSCREEN_WIDTH, 150);
    } else {
        return CGSizeMake(KSCREEN_WIDTH, 50);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *text;
    if (indexPath.section == 0) {
        text = @"帅气老公黄家豪";
    } else {
        text = @"女神老婆朱琪";
    }
    CGSize size = [text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14], NSFontAttributeName, nil]];
    
    return CGSizeMake(size.width + 20, 30);
}


#pragma mark - getter
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        JHAutoCollectionViewFlowLayout *layout = [[JHAutoCollectionViewFlowLayout alloc]init];
        layout.minimumInteritemSpacing = 10;
        layout.minimumLineSpacing = 10;
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 27, 10);
//        layout.headerReferenceSize = CGSizeMake(KSCREEN_WIDTH, 50);
//        layout.footerReferenceSize = CGSizeMake(KSCREEN_WIDTH, 50);
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, self.specView.mj_h-tabBar_height) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[JHSpecCollectionViewCell class] forCellWithReuseIdentifier:kUICollectionViewCellIdentifier];
        [_collectionView registerClass:[JHCollectionReusableViewHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"JHCollectionReusableViewHeader"];
    }
    return _collectionView;
}

- (UIButton *)shoppingBtn{
    if (!_shoppingBtn) {
        _shoppingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _shoppingBtn.frame = CGRectMake(7, KSCREEN_HEIGHT-tabBar_height-CGRectGetMaxY(self.navigationController.navigationBar.frame), KSCREEN_WIDTH-14, 42);
        _shoppingBtn.backgroundColor = [UIColor redColor];
        [_shoppingBtn setTitle:@"立即购买" forState:UIControlStateNormal];
        [_shoppingBtn addTarget:self action:@selector(shoppingBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _shoppingBtn.layer.cornerRadius = 7;
        _shoppingBtn.layer.masksToBounds = YES;
    }
    return _shoppingBtn;
}

- (UIView *)maskView{
    if (!_maskView) {
        _maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEN_HEIGHT)];
        _maskView.backgroundColor = RGB_Color(0, 0, 127/255.0, 1);
        _maskView.userInteractionEnabled = YES;
        [_maskView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeMask:)]];
        _maskView.alpha = 0;
    }
    return _maskView;
}

- (UIView *)specView{
    if (!_specView) {
        _specView = [[UIView alloc] initWithFrame:CGRectMake(0, KSCREEN_HEIGHT, KSCREEN_WIDTH, KSCREEN_HEIGHT-197)];
        _specView.backgroundColor = [UIColor whiteColor];
    }
    return _specView;
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
