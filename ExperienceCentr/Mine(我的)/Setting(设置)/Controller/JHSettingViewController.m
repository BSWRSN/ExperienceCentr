//
//  JHSettingViewController.m
//  ExperienceCentr
//
//  Created by 同城小鸟 on 2018/7/17.
//  Copyright © 2018年 同城小鸟. All rights reserved.
//

#import "JHSettingViewController.h"
#import "JHPersonalViewController.h"
#import "JHSecurityViewController.h"
#import "JHReceivingAddrViewController.h"

@interface JHSettingViewController ()

@property (nonatomic, strong) UISwitch *notificationSwitch;

@end

@implementation JHSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = @"设置";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"头像背景"]];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;//UIScrollView也适用
        self.tableView.estimatedSectionHeaderHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}


- (void)notificationSwitchAction:(UISwitch *)sender{
    if (sender.on) {
        NSLog(@"开");
    } else {
        NSLog(@"关");
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return 3;
    } else if (section == 1) {
        return 2;
    } else {
        return 1;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    if (indexPath.section == 0) {
        NSArray *arr = @[@"个人资料", @"账号安全", @"收货地址"];
        cell.textLabel.text = arr[indexPath.row];
        
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.accessoryType = UITableViewCellAccessoryNone;
            [cell.contentView addSubview:self.notificationSwitch];
        }
        cell.textLabel.text = indexPath.row == 0 ? @"消息通知" : @"清除缓存";
        
    } else if (indexPath.section == 2) {
        cell.textLabel.text = @"关于我们";
        
    } else if (indexPath.section == 3) {
        cell.textLabel.text = @"退出当前账号";
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return 20;
    } else {
        return 15;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.001;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            JHPersonalViewController *vc = [[JHPersonalViewController alloc] init];
            vc.title = cell.textLabel.text;
            [self.navigationController pushViewController:vc animated:YES];
        } else if (indexPath.row == 1) {
            JHSecurityViewController *vc = [[JHSecurityViewController alloc] init];
            vc.title = cell.textLabel.text;
            [self.navigationController pushViewController:vc animated:YES];
        } else if (indexPath.row == 2) {
            JHReceivingAddrViewController *vc = [[JHReceivingAddrViewController alloc] init];
            vc.title = cell.textLabel.text;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    
    
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}



#pragma mark - getter
- (UISwitch *)notificationSwitch{
    if (!_notificationSwitch) {
        _notificationSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(KSCREEN_WIDTH-64, 7, 0, 0)];
        [_notificationSwitch addTarget:self action:@selector(notificationSwitchAction:) forControlEvents:UIControlEventValueChanged];
    }
    return _notificationSwitch;
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
