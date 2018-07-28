//
//  JHGoodsListViewController.m
//  ExperienceCentr
//
//  Created by 同城小鸟 on 2018/7/14.
//  Copyright © 2018年 同城小鸟. All rights reserved.
//

#import "JHGoodsListViewController.h"
#import "JHGoodsCollectionViewCell.h"
#import "JHGoodsTableViewCell.h"
#import "JHGoodsInfoViewController.h"

@interface JHGoodsListViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *headerView;

@end

@implementation JHGoodsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self initializationAppearance];
}


- (void)initializationAppearance{
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;//UIScrollView也适用
        self.tableView.estimatedSectionHeaderHeight = 0;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"田" style:UIBarButtonItemStylePlain target:self action:@selector(barButtonClick:)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    
    NSArray *array = @[@"综合", @"销量", @"价格", @"筛选"];
    for (int i = 0; i < array.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i * KSCREEN_WIDTH/4, 0, KSCREEN_WIDTH/4, 44);
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(siftingButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 197 + i;
        [self.headerView addSubview:button];
    }
    
    [self.view addSubview:self.collectionView];
}


- (void)barButtonClick:(UIBarButtonItem *)sender{
    if (sender.tag == 297) {
        self.navigationItem.rightBarButtonItem.tag = 277;
        [self.tableView removeFromSuperview];
        [self.view addSubview:self.collectionView];
        self.headerView.mj_y = 0;
        [self.collectionView reloadData];
    } else {
        self.navigationItem.rightBarButtonItem.tag = 297;
        [self.collectionView removeFromSuperview];
        [self.view addSubview:self.tableView];
        [self.tableView reloadData];
    }
}


#pragma mark - 筛选商品
- (void)siftingButtonClick:(UIButton *)sender{
    NSLog(@"%ld", sender.tag);
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 7;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JHGoodsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    
    cell.imageUrl.backgroundColor = [UIColor yellowColor];
    cell.name.text = @"帅气老公黄家豪VS女神范老婆朱琪";
    cell.sales.text = [NSString stringWithFormat:@"销量:%@", @"5297"];
    cell.price.text = [NSString stringWithFormat:@"¥%@", @"5297.77"];
    [cell.name sizeToFit];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    JHGoodsInfoViewController *vc = [[JHGoodsInfoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"UICollectionReusableView" forIndexPath:indexPath];
        
        [header addSubview:self.headerView];
        
        return header;
    }
    return nil;
}


#pragma mark - UICollectionViewDelegateFlowLayout
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(5, 5, 5, 5);
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JHGoodsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[JHGoodsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.imageUrl.backgroundColor = [UIColor yellowColor];
    cell.name.text = @"帅气无敌好老公黄家豪VS貌美如花好老婆朱琪";
    cell.sales.text = [NSString stringWithFormat:@"销量:%@", @"5297"];
    cell.price.text = [NSString stringWithFormat:@"¥%@", @"5297.77"];
    [cell.name sizeToFit];
    
    return cell;
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 110;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return _headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JHGoodsInfoViewController *vc = [[JHGoodsInfoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - getter
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEN_HEIGHT-CGRectGetMaxY(self.navigationController.navigationBar.frame)) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[JHGoodsTableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake((KSCREEN_WIDTH-15)/2, (KSCREEN_WIDTH-15)/2 +87);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 5;
        layout.headerReferenceSize = CGSizeMake(KSCREEN_WIDTH, 44);
        layout.sectionHeadersPinToVisibleBounds = YES;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEN_HEIGHT-CGRectGetMaxY(self.navigationController.navigationBar.frame)) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        [_collectionView registerClass:[JHGoodsCollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UICollectionReusableView"];
    }
    return _collectionView;
}

- (UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, 44)];
        _headerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _headerView;
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
