//
//  JHChangePasswordViewController.m
//  ExperienceCentr
//
//  Created by 同城小鸟 on 2018/7/21.
//  Copyright © 2018年 同城小鸟. All rights reserved.
//

#import "JHChangePasswordViewController.h"

@interface JHChangePasswordViewController ()

@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) UITextField *password;
@property (nonatomic, strong) UITextField *freshPassword;
@property (nonatomic, strong) UITextField *confirmPassword;

@end

@implementation JHChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;//UIScrollView也适用
        self.tableView.estimatedSectionHeaderHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    if (self.isPay == 1) {
        self.titleArr = @[@"支付密码", @"新支付密码", @"确认支付密码"];
    } else {
        self.titleArr = @[@"登录密码", @"新登录密码", @"确认登录密码"];
    }
}


#pragma mark - 确认按钮点击
- (void)confirmBtnClick:(UIButton *)sender{
    if (sender.tag == 277) {
        NSLog(@"修改登录密码");
    } else {
        NSLog(@"修改支付密码");
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    cell.textLabel.text = self.titleArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row == 0) {
        [cell.contentView addSubview:self.password];
    } else if (indexPath.row == 1) {
        [cell.contentView addSubview:self.freshPassword];
    } else {
        [cell.contentView addSubview:self.confirmPassword];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 77;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *footerView = [[UIView alloc] init];
    
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    confirmBtn.frame =CGRectMake(15, 20, KSCREEN_WIDTH-30, 49);
    confirmBtn.backgroundColor = [UIColor blackColor];
    [confirmBtn setTitle:@"确认修改" forState:UIControlStateNormal];
    [confirmBtn addTarget:self action:@selector(confirmBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    confirmBtn.layer.cornerRadius = 7;
    confirmBtn.layer.masksToBounds = YES;
    confirmBtn.tag = self.isPay + 277;
    [footerView addSubview:confirmBtn];
    
    return footerView;
}


#pragma mark - getter
- (UITextField *)password{
    if (!_password) {
        _password = [[UITextField alloc] initWithFrame:CGRectMake(127, 0, KSCREEN_WIDTH-127, 44)];
        _password.placeholder = self.isPay == 1 ? @"请输入支付密码" : @"请输入登录密码";
        _password.font = [UIFont systemFontOfSize:15];
    }
    return _password;
}

- (UITextField *)freshPassword{
    if (!_freshPassword) {
        _freshPassword = [[UITextField alloc] initWithFrame:CGRectMake(127, 0, KSCREEN_WIDTH-127, 44)];
        _freshPassword.placeholder = self.isPay == 1 ? @"请输入新支付密码" : @"请输入新登录密码";
        _freshPassword.font = [UIFont systemFontOfSize:15];
    }
    return _freshPassword;
}

- (UITextField *)confirmPassword{
    if (!_confirmPassword) {
        _confirmPassword = [[UITextField alloc] initWithFrame:CGRectMake(127, 0, KSCREEN_WIDTH-127, 44)];
        _confirmPassword.placeholder = self.isPay == 1 ? @"确认新支付密码" : @"确认新登录密码";
        _confirmPassword.font = [UIFont systemFontOfSize:15];
    }
    return _confirmPassword;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
