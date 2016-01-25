//
//  SJShowHUDView.m
//  SJShowHUD
//
//  Created by SPIREJ on 16/1/19.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJShowHUDView.h"
#import "UIView+LBExtension.h"

NSString *const XSLoadingViewLoadingText = @"正在加载...";  //Default
NSString *const XSLoadingViewSubmitText = @"请稍候...";

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
        
        //
        self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        self.indicatorView.center = CGPointMake( self.width/2, 20 + self.indicatorView.height/2.0);
        [self addSubview:self.indicatorView];
        self.indicatorView.hidden = NO;
        
        self.loadingView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Loading_Progress"]];
        self.loadingView.center = CGPointMake(self.center.x, self.center.y-15);
        [self addSubview:self.loadingView];
        
        self.loading = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 140, 20)];
        self.loading.backgroundColor = [UIColor clearColor];
        self.loading.textColor = [UIColor whiteColor];
        self.loading.font = [UIFont systemFontOfSize:14];
        self.loading.textAlignment = NSTextAlignmentCenter;
        self.loading.text = XSLoadingViewLoadingText;
        self.loading.center = CGPointMake( self.width/2, self.indicatorView.maxY + 15);
        [self addSubview:self.loading];
        self.height = self.loading.maxY + 20;
    }
    return self;
}

- (void)stopLoading
{
    [self.indicatorView stopAnimating];
}

- (void)startLoading
{
    [self.indicatorView startAnimating];
}

@end
