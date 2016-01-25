//
//  SJShowWaitingAlert.m
//  SJShowHUD
//
//  Created by SPIREJ on 16/1/25.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJShowWaitingAlert.h"
#import "MRProgress.h"

@interface SJShowWaitingAlert ()

@end

@implementation SJShowWaitingAlert

+ (void)showWaitingContent:(NSString *)alert inView:(id)delegate{
        if (![alert isEqualToString:@"noAlert"]) {
            if ([delegate isKindOfClass:[UIView class]]) {
                    [self showWaitingAlertWithContent:alert inView:delegate];
            }else if ([delegate isKindOfClass:[UIViewController class]]){
                UIViewController *vc = (UIViewController *)delegate;
                    [self showWaitingAlertWithContent:alert inView:vc.view];
            }
        }
}

//在主线程中刷新UI，不这么做好像也没影响
//+ (void)showWaitingContent:(NSString *)alert inView:(id)delegate{
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        if (![alert isEqualToString:@"noAlert"]) {
//            if ([delegate isKindOfClass:[UIView class]]) {
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    [self showWaitingAlertWithContent:alert inView:delegate];
//                });
//                
//            }else if ([delegate isKindOfClass:[UIViewController class]]){
//                UIViewController *vc = (UIViewController *)delegate;
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    //
//                    [self showWaitingAlertWithContent:alert inView:vc.view];
//                });
//                
//            }
//        }
//
//    });
//}

+ (void)hideWaitingInView:(id)delegate
{
    if ([delegate isKindOfClass:[UIView class]]) {
        [self hideCurrentWaitngAlertInView:delegate];
    }else if ([delegate isKindOfClass:[UIViewController class]]){
        UIViewController *vc = (UIViewController *)delegate;
        [self hideCurrentWaitngAlertInView:vc.view];
    }
}


+ (void)showWaitingAlertWithContent:(NSString *)content inView:(UIView *)view{
    if (view == nil) {
        return;
    }
    NSArray *subViews = [view subviews];
    BOOL isShowingAlert = NO;
    for (UIView *view in subViews) {
        if ([view isKindOfClass:[MRProgressOverlayView class]]) {
            isShowingAlert = YES;
            break;
        }
    }
    if (!isShowingAlert) {
        MRProgressOverlayView *progressView = [[MRProgressOverlayView alloc] init];
        progressView.mode = MRProgressOverlayViewModeCustom;
        progressView.modeView = [[SJShowHUDView alloc] init];
//让progressView.modeView初始化SJShowHUDView，达到加载窗的效果
        SJShowHUDView *loadingView = (SJShowHUDView *)progressView.modeView;
#warning - 这里可以选择是系统的菊花，还是自己定义的图片效果
//        [loadingView startLoading];
        [loadingView startAnimation];
        
        loadingView.loading.text = content;
        [view addSubview:progressView];
        [progressView show:YES];
    }
}

+ (void)hideCurrentWaitngAlertInView:(UIView *)view{
    NSArray *subViews = [view subviews];
    for (UIView *view in subViews) {
        if ([view isKindOfClass:[MRProgressOverlayView class]]) {
            [self performBlock:^{
                //暂停loadingView中的定时器
                MRProgressOverlayView *progress = (MRProgressOverlayView *)view;
                if ([progress.modeView isKindOfClass:[SJShowHUDView class]]) {
                    SJShowHUDView *loadView = (SJShowHUDView *)progress.modeView;

//                    [loadView stopLoading];
                    [loadView endAnimation];
                }
                [(MRProgressOverlayView *)view dismiss:NO];
            } afterDelay:0.1];
            break;
        }
    }
}

+(void)performBlock:(void(^)())block afterDelay:(NSTimeInterval)delay{
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay *NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), block);
}


@end
