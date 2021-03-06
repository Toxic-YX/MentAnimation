//
//  YXMenuAnimateView.m
//  WeatherDemo
//
//  Created by Rookie_YX on 16/10/26.
//  Copyright © 2016年 Rookie_YX. All rights reserved.
//

#import "YXMenuAnimateView.h"
@interface YXButton : UIButton
@end
@implementation YXButton

- (void)layoutSubviews {
  [super layoutSubviews];
  CGFloat magre = 8;
  CGFloat imgW = self.imageView.frame.size.width;
  CGFloat imgH = self.imageView.frame.size.height;
  CGFloat imgX = (self.frame.size.width-imgW)*0.5;
  self.imageView.frame = CGRectMake(imgX, 0, imgW, imgH);
  CGFloat titleH = self.titleLabel.frame.size.height;
  self.titleLabel.frame = CGRectMake(0, imgH+magre, self.frame.size.width, titleH);
  self.titleLabel.textAlignment = NSTextAlignmentCenter;
  
}
@end

@implementation YXMenuAnimateView

- (void)btnShow {
  NSLog(@"%s",__func__);
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    int columnCount= self.columnCount?self.columnCount:3;
    CGFloat width = 100;
    CGFloat edge = (CGRectGetWidth(self.bounds) - width*3)/4;
    for (int i = 0; i<self.imageNameArray.count; i++) {
      int row=i/columnCount;
      int loc=i%columnCount;
      YXButton *button = [[YXButton alloc] init];
      // 这里计算frame  你画图计算一下就会明白的
      button.frame = CGRectMake(edge+(edge+width)*loc, 515+edge+(edge+width)*row, width, width);
      [self addSubview:button];
      NSString *imageName = self.imageNameArray[i];
      [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
      if (self.textArray) {
        [button setTitle:self.textArray[i] forState:UIControlStateNormal];
      }
      button.titleLabel.font = [UIFont systemFontOfSize:14];
      [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
      button.tag = i;
      [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
      //动画方式一：UIView
      [UIView animateWithDuration:0.5 delay:i*0.03 usingSpringWithDamping:0.7 initialSpringVelocity:0.05 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        
        button.frame  = CGRectMake(edge+(edge+width)*loc, 15+edge+(edge+width)*row, width, width);;
        
      } completion:^(BOOL finished) {
      }];
    }
  });
}
//按钮事件
- (void)buttonAction:(YXButton*)button {
  NSInteger index = button.tag;
  if ([self.delegate respondsToSelector:@selector(menuAnimateViewButton:andIndex:)]) {
    [self.delegate menuAnimateViewButton:button andIndex:index];
  }
}

// 关闭
- (void)btnClose:(void(^)())completion {
  for (int i = 0; i<self.imageNameArray.count; i++) {
    YXButton *button = self.subviews[i];
    CGFloat width = CGRectGetWidth(button.frame);
    CGFloat buttonX = button.frame.origin.x;
    CGFloat buttonY = button.frame.origin.y;
    [UIView animateWithDuration:0.6 delay:0.3-i*0.03 usingSpringWithDamping:0.6 initialSpringVelocity:0.05 options:UIViewAnimationOptionAllowUserInteraction animations:^{
      button.frame  = CGRectMake(buttonX, buttonY+500, width, width);
    } completion:^(BOOL finished) {
      completion();
      [button removeFromSuperview];
    }];
  }
}

@end
