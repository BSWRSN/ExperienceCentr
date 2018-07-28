//
//  JHReceivingAddrTableViewCell.h
//  ExperienceCentr
//
//  Created by 同城小鸟 on 2018/7/28.
//  Copyright © 2018年 JH_同城小鸟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHReceivingAddrTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UIButton *defaultBtn;
@property (weak, nonatomic) IBOutlet UILabel *address;

@end
