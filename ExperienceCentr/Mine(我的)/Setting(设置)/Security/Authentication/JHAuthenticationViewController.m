//
//  JHAuthenticationViewController.m
//  ExperienceCentr
//
//  Created by 同城小鸟 on 2018/7/30.
//  Copyright © 2018年 JH_同城小鸟. All rights reserved.
//

#import "JHAuthenticationViewController.h"

@interface JHAuthenticationViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *frontImageView;
@property (weak, nonatomic) IBOutlet UIImageView *reverseImageView;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *IdNumberTextField;

@end

@implementation JHAuthenticationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.frontImageView.layer.borderWidth = self.reverseImageView.layer.borderWidth = 0.5;
    self.frontImageView.layer.borderColor = self.reverseImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.frontImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectIdCardPhotoTapGestureRecognizer:)]];
    [self.reverseImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectIdCardPhotoTapGestureRecognizer:)]];
    
}


#pragma mark - 选择照片上传
- (void)selectIdCardPhotoTapGestureRecognizer:(UITapGestureRecognizer *)sender{
    if (sender.view.tag == 277) {
        NSLog(@"%ld", (long)sender.view.tag);
    } else {
        NSLog(@"%ld", (long)sender.view.tag);
    }
}


#pragma mark - 提交按钮
- (IBAction)submitBtnClick:(id)sender {
    
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
