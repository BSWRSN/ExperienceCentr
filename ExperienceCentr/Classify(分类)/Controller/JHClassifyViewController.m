//
//  JHClassifyViewController.m
//  ExperienceCentr
//
//  Created by 同城小鸟 on 2018/7/12.
//  Copyright © 2018年 同城小鸟. All rights reserved.
//

#import "JHClassifyViewController.h"
#import "JHClassifyTableViewCell.h"
#import "JHClassifyCollectionViewCell.h"
#import "JHGoodsListViewController.h"

@interface JHClassifyViewController ()<UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate>{
    UIButton *_normalNameBtn;
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation JHClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.navigationController.navigationBar.translucent = NO;
    NSArray *familyNames = [UIFont familyNames];
    NSLog(@"所有字体名称--%@",familyNames);
    
//    if (@available(iOS 11.0, *)) {
//        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;//UIScrollView也适用
//    } else {
//        self.automaticallyAdjustsScrollViewInsets = NO;
//    }
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.collectionView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = [NSString stringWithFormat:@"cell%ld,%ld", indexPath.section, indexPath.row];
    JHClassifyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[JHClassifyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.nameBtn.mj_w = self.tableView.mj_w-14;
    [cell.nameBtn setTitle:@"赚钱机会" forState:UIControlStateNormal];
    cell.nameBtn.tag = indexPath.row;
    if (indexPath.row == 0 && _normalNameBtn.tag == 0) {
        cell.nameBtn.selected = YES;
        _normalNameBtn = cell.nameBtn;
    }
    
    
    return cell;
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JHClassifyTableViewCell *cell = (JHClassifyTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    if (_normalNameBtn.tag != cell.nameBtn.tag) {
        cell.nameBtn.selected = YES;
        _normalNameBtn.selected = NO;
        _normalNameBtn = cell.nameBtn;
    }
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 7;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JHClassifyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    
    cell.imageUrl.backgroundColor = [UIColor yellowColor];
    cell.name.text = @"赚钱机会";
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    JHGoodsListViewController *vc = [[JHGoodsListViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - UICollectionViewDelegateFlowLayout
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(15, 15, 15, 15);
}


#pragma mark - getter
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 117, KSCREEN_HEIGHT-CGRectGetMaxY(self.navigationController.navigationBar.frame)-tabBar_height) style:UITableViewStylePlain];
        _tableView.showsVerticalScrollIndicator = NO;
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[JHClassifyTableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake((KSCREEN_WIDTH-self.tableView.mj_w-61)/3, (KSCREEN_WIDTH-self.tableView.mj_w-61)/3 +27);
        layout.minimumLineSpacing = 15;
        layout.minimumInteritemSpacing = 15;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(self.tableView.mj_w+1, self.tableView.mj_y, KSCREEN_WIDTH-self.tableView.mj_w-1, self.tableView.mj_h) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        [_collectionView registerClass:[JHClassifyCollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    }
    return _collectionView;
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
