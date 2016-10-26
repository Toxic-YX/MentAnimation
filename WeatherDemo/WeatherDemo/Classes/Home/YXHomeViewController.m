//
//  YXHomeViewController.m
//  WeatherDemo
//
//  Created by Rookie_YX on 16/10/26.
//  Copyright © 2016年 Rookie_YX. All rights reserved.
//

#import "YXHomeViewController.h"
#import "YXPushController.h"

@interface YXHomeViewController ()
@property (strong, nonatomic) IBOutlet UIButton *rightBarBtnItem;

@end

@implementation YXHomeViewController
#pragma mark - life cycle
- (void)viewDidLoad {
  [super viewDidLoad];
  
}

#pragma mark -  private methond

/**
 导航栏右边按钮
 */
- (IBAction)rightBarBtnItem:(UIButton *)sender {
  YXPushController *weatherVC = [YXPushController new];
  
  [UIView animateWithDuration:0.1 animations:^{
    self.rightBarBtnItem.transform = CGAffineTransformRotate(self.rightBarBtnItem.transform, M_1_PI *5);
  } completion:^(BOOL finished) {
    self.rightBarBtnItem.transform = CGAffineTransformRotate(self.rightBarBtnItem.transform, -M_1_PI *5);
  }];
  [self presentViewController:weatherVC animated:NO completion:nil];
}


@end
