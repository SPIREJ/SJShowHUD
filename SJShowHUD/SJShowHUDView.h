//
//  SJShowHUDView.h
//  SJShowHUD
//
//  Created by SPIREJ on 16/1/19.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <UIKit/UIKit.h>
extern NSString *const XSLoadingViewLoadingText; //Default
extern NSString *const XSLoadingViewSubmitText;

@interface SJShowHUDView : UIView

@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;
@property (nonatomic, strong) UIImageView *loadingView;
@property (nonatomic, strong) UILabel *loading;

- (void)stopLoading;
- (void)startLoading;


@end
