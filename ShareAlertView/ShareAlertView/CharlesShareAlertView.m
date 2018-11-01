//
//  CharlesShareAlertView.m
//  SahreAlert
//
//  Created by zxfApple on 2018/10/31.
//  Copyright © 2018年 Charles_XF.com. All rights reserved.
//

#import "CharlesShareAlertView.h"
#import "CharlesBtn.h"

#define WEAKSELF typeof(self) __weak weakSelf = self;
#define kColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define SCREEN_WIDTH  [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define Rate UIScreen.mainScreen.bounds.size.width/375   //屏宽比例

@interface CharlesShareAlertView ()

@property (nonatomic,strong) UIView *shahreBroundView;
@property (nonatomic,strong) UIView *shahreBgView;

@end

@implementation CharlesShareAlertView

- (instancetype)initWithShareFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = kColor(0, 0, 0, 0.5);
        
        [self createShareView];
    }
    return self;
}

/**弹出*/
- (void)show{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    WEAKSELF
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.shahreBgView.transform = CGAffineTransformMakeTranslation(0, -(weakSelf.shahreBgView.frame.size.height - 20));
    }];
}

- (void)createShareView {
    
    _shahreBroundView = [[UIView alloc]initWithFrame:self.bounds];
    _shahreBroundView.backgroundColor = [UIColor clearColor];
    [self addSubview:_shahreBroundView];
    
    _shahreBgView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 200*Rate)];
    _shahreBgView.backgroundColor = [UIColor whiteColor];
    [_shahreBroundView addSubview:_shahreBgView];
    
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 * Rate, 0, SCREEN_WIDTH - 10 * Rate, 40 * Rate)];
    titleLabel.text = @"分享到";
    titleLabel.font = [UIFont systemFontOfSize:15];
    [_shahreBgView addSubview:titleLabel];
    
    UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(titleLabel.frame), SCREEN_WIDTH, 1 * Rate)];
    lineView.backgroundColor = kColor(242, 242, 242, 1);
    [_shahreBgView addSubview:lineView];
    
    CharlesBtn * weChatBtn = [[CharlesBtn alloc] initWithFrame:CGRectMake(6 * Rate,CGRectGetHeight(titleLabel.frame) + 25 * Rate, (SCREEN_WIDTH - 45 * Rate)/4, 50 * Rate)];
    [weChatBtn setTitle:@"微信" forState:UIControlStateNormal];
    [weChatBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [weChatBtn setImage:[UIImage imageNamed:@"微信"] forState:UIControlStateNormal];
    [weChatBtn addTarget:self action:@selector(weChatShare) forControlEvents:UIControlEventTouchUpInside];
    [_shahreBgView addSubview:weChatBtn];
    
    CharlesBtn * circleBtn = [[CharlesBtn alloc] initWithFrame:CGRectMake( CGRectGetMaxX(weChatBtn.frame) + 10 * Rate,CGRectGetHeight(titleLabel.frame) + 25 * Rate, (SCREEN_WIDTH - 45 * Rate)/4, 50 * Rate)];
    [circleBtn setTitle:@"朋友圈" forState:UIControlStateNormal];
    [circleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [circleBtn setImage:[UIImage imageNamed:@"朋友圈"] forState:UIControlStateNormal];
    [circleBtn addTarget:self action:@selector(CircleFriendsShare) forControlEvents:UIControlEventTouchUpInside];
    [_shahreBgView addSubview:circleBtn];
    
    CharlesBtn * QQBtn = [[CharlesBtn alloc] initWithFrame:CGRectMake( CGRectGetMaxX(circleBtn.frame) + 10 * Rate,CGRectGetHeight(titleLabel.frame) + 25 * Rate, (SCREEN_WIDTH - 45 * Rate)/4, 50 * Rate)];
    [QQBtn setTitle:@"QQ" forState:UIControlStateNormal];
    [QQBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [QQBtn setImage:[UIImage imageNamed:@"QQ"] forState:UIControlStateNormal];
    [QQBtn addTarget:self action:@selector(QQShare) forControlEvents:UIControlEventTouchUpInside];
    [_shahreBgView addSubview:QQBtn];
    
    
    CharlesBtn * QQZoneBtn = [[CharlesBtn alloc] initWithFrame:CGRectMake( CGRectGetMaxX(QQBtn.frame) + 10 * Rate,CGRectGetHeight(titleLabel.frame) + 25 * Rate, (SCREEN_WIDTH - 45 * Rate)/4, 50 * Rate)];
    [QQZoneBtn setTitle:@"QQ空间" forState:UIControlStateNormal];
    [QQZoneBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [QQZoneBtn setImage:[UIImage imageNamed:@"QQ-空间"] forState:UIControlStateNormal];
    [QQZoneBtn addTarget:self action:@selector(clickQQZoneShare) forControlEvents:UIControlEventTouchUpInside];
    [_shahreBgView addSubview:QQZoneBtn];
    
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"点击了view");
    if (self.touchBeginBlock) {
        self.touchBeginBlock();
    }
    [self hideShareView];
}

- (void)weChatShare {
        if (self.delegate) {
            [self.delegate clickWeChat];
        }
    
    [self hideShareView];
}

- (void)CircleFriendsShare {
        if (self.delegate) {
            [self.delegate clickCircleFriendsShare];
        }
    [self hideShareView];
}

- (void)QQShare {
        if (self.delegate) {
            [self.delegate clickQQShare];
        }
    [self hideShareView];
}

- (void)clickQQZoneShare{
        if (self.delegate) {
            [self.delegate clickQQZoneShare];
        }
    [self hideShareView];
}

#pragma mark - 关闭弹框
- (void)hideShareView{
    WEAKSELF
    [UIView animateWithDuration:0.2 animations:^{
        weakSelf.shahreBgView.transform = CGAffineTransformIdentity;
    }completion:^(BOOL finished) {
        [weakSelf removeFromSuperview];
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
