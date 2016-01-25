//
//  SJShowHUDView.m
//  SJShowHUD
//
//  Created by SPIREJ on 16/1/19.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJShowHUDView.h"
#import "UIView+LBExtension.h"

NSString *const SJLoadingViewLoadingText = @"正在加载...";  //Default
NSString *const SJLoadingViewSubmitText = @"请稍候...";

@implementation SJShowHUDView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    if (self = [super init]) {
        //
        self.frame = CGRectMake(0, 0, 150, 100);
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        
        //系统的菊花,默认是系统的菊花
        self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        self.indicatorView.center = CGPointMake( self.width/2, 20 + self.indicatorView.height/2.0);
        [self addSubview:self.indicatorView];
        self.indicatorView.hidden = NO;
        
#warning - //自定义的图片，默认隐藏,如果需要使用这个效果，则把系统的菊花隐藏掉，图片的隐藏属性改为NO
        self.loadingView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loadingImage"]];
        self.loadingView.center = CGPointMake(self.center.x, self.center.y-15);
        [self addSubview:self.loadingView];
        self.loadingView.hidden = NO;
        
        self.loading = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 140, 20)];
        self.loading.backgroundColor = [UIColor clearColor];
        self.loading.textColor = [UIColor whiteColor];
        self.loading.font = [UIFont systemFontOfSize:14];
        self.loading.textAlignment = NSTextAlignmentCenter;
        self.loading.text = SJLoadingViewLoadingText;
        self.loading.center = CGPointMake( self.width/2, self.indicatorView.maxY + 15);
        [self addSubview:self.loading];
        self.height = self.loading.maxY + 20;
    }
    return self;
}
- (void)startLoading
{
    if (!self.loadingView.hidden) {
        self.loadingView.hidden = YES;
    }
    [self.indicatorView startAnimating];
}

- (void)stopLoading
{
    [self.indicatorView stopAnimating];
}

#pragma mark 图片旋转
- (void)startAnimation
{
    if (!self.indicatorView.hidden) {
        self.indicatorView.hidden = YES;
    }
    CABasicAnimation *basicAni= [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    basicAni.duration = 1;
    basicAni.repeatCount = MAXFLOAT;
    basicAni.toValue = @(M_PI * 2);
    [self.loadingView.layer addAnimation:basicAni forKey:nil];
}
- (void)endAnimation
{
    [self.loadingView.layer removeAllAnimations];
}


@end
