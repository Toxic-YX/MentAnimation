//
//  YXWeatherController.m
//  WeatherDemo
//
//  Created by Rookie_YX on 16/10/26.
//  Copyright © 2016年 Rookie_YX. All rights reserved.
//

#import "YXPushController.h"
#import "YXMenuAnimateView.h"

@interface YXPushController ()<YXMenuAnimateViewDelegate>
@property (strong, nonatomic) IBOutlet YXMenuAnimateView *buttonView;

@end

@implementation YXPushController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  [self  setupSubViews];
}

#pragma mark - private methond
- (IBAction)backBtn:(UIButton *)sender {
  
  [self.buttonView btnClose:^{
    [self dismissViewControllerAnimated:NO completion:nil];
  }];
}

- (void)setupSubViews{
  NSArray *textArr = @[NSLocalizedString(@"文字",nil),NSLocalizedString(@"图片",nil),NSLocalizedString(@"视频",nil),NSLocalizedString(@"语音",nil),NSLocalizedString(@"投票",nil),NSLocalizedString(@"签到",nil),];
  NSMutableArray *imgArr = [NSMutableArray array];
  for (int i = 0; i<textArr.count; i++) {
    NSString *imageName = [NSString stringWithFormat:@"publish_%d",i];
    [imgArr addObject:imageName];
  }
  
  NSLog(@"%@",textArr);
  self.buttonView.textArray = textArr;
  self.buttonView.imageNameArray = imgArr;
  self.buttonView.delegate = self;
  [self.buttonView btnShow];
}

#pragma mark - YXMenuAnimateViewDelegate
- (void)menuAnimateViewButton:(UIButton *)button andIndex:(NSInteger)index{
  NSLog(@"%ld",index);
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 模糊视图
 - (void)setupBlurEffect{
 UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
 UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
 effectView.frame = self.view.bounds;
 //     effectView.alpha = 0.8;
 [self.view addSubview:effectView];
 [self.view sendSubviewToBack:effectView];
 }
 }
 */

@end
