//
//  SJShowHUDView.h
//  SJShowHUD
//
//  Created by SPIREJ on 16/1/19.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <UIKit/UIKit.h>
extern NSString *const SJLoadingViewLoadingText; //Default
extern NSString *const SJLoadingViewSubmitText;

@interface SJShowHUDView : UIView

@property (nonatomic, strong) UIActivityIndicatorView *indicatorView; //系统菊花
@property (nonatomic, strong) UIImageView *loadingView; //自定义图片
@property (nonatomic, strong) UILabel *loading; //提示文字

//系统菊花转效果
- (void)stopLoading;
- (void)startLoading;

//自定义图片转效果
- (void)startAnimation;
- (void)endAnimation;

@end
