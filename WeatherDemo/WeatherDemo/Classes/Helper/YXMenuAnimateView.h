//
//  YXMenuAnimateView.h
//  WeatherDemo
//
//  Created by Rookie_YX on 16/10/26.
//  Copyright © 2016年 Rookie_YX. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YXMenuAnimateViewDelegate <NSObject>
- (void)menuAnimateViewButton:(UIButton *)button andIndex:(NSInteger)index;
@end


@interface YXMenuAnimateView : UIView
@property (nonatomic, assign) int columnCount;  // default  is 3
@property (nonatomic, strong) NSArray *textArray;
@property (nonatomic, strong) NSArray<NSString *> *imageNameArray;
@property (nonatomic, weak)   id<YXMenuAnimateViewDelegate>delegate;
- (void)btnShow;
- (void)btnClose:(void(^)())completion;

@end
