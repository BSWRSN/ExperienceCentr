//
//  JHReceivingAddrViewController.m
//  ExperienceCentr
//
//  Created by 同城小鸟 on 2018/7/28.
//  Copyright © 2018年 JH_同城小鸟. All rights reserved.
//

#import "JHReceivingAddrViewController.h"
#import "JHReceivingAddrTableViewCell.h"

@interface JHReceivingAddrViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation JHReceivingAddrViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self _initializationAppearance];
}

#pragma mark - 初始化外观
- (void)_initializationAppearance{
    [self.view addSubview:self.tableView];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        self.tableView.estimatedSectionHeaderHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    UIButton *addReceivingAddrBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addReceivingAddrBtn.frame = CGRectMake(7, KSCREEN_HEIGHT-CGRectGetMaxY(self.navigationController.navigationBar.frame)-tabBar_height, KSCREEN_WIDTH-14, 42);
    addReceivingAddrBtn.backgroundColor = [UIColor whiteColor];
    [addReceivingAddrBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [addReceivingAddrBtn setTitle:@"添加收货地址" forState:UIControlStateNormal];
    [addReceivingAddrBtn addTarget:self action:@selector(addReceivingAddrBtnClick) forControlEvents:UIControlEventTouchUpInside];
    addReceivingAddrBtn.layer.cornerRadius = 7;
    addReceivingAddrBtn.layer.masksToBounds = YES;
    addReceivingAddrBtn.layer.borderWidth = 0.5;
    addReceivingAddrBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.view addSubview:addReceivingAddrBtn];
}

- (void)addReceivingAddrBtnClick{
    
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 7;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JHReceivingAddrTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[JHReceivingAddrTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.name.text = @"轩辕梦琪";
    cell.phone.text = @"13557013546";
    cell.address.text = @"收到千万别点比我比比大笔北青网IEU币阿布迪是博瑞大厦别的";
    cell.defaultBtn.layer.borderWidth = 0.5;
    cell.defaultBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    return cell;
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return 20;
    } else{
        return 5;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 15;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


#pragma mark - getter
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEN_HEIGHT-CGRectGetMaxY(self.navigationController.navigationBar.frame)-tabBar_height) style:UITableViewStyleGrouped];
        _tableView.estimatedRowHeight = 77;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([JHReceivingAddrTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
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
