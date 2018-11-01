//
//  CharlesShareAlertView.h
//  SahreAlert
//
//  Created by zxfApple on 2018/10/31.
//  Copyright © 2018年 Charles_XF.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TouchBeginBlock)(void);
@protocol XFShareViewProtocol <NSObject>

-(void)clickWeChat;
-(void)clickCircleFriendsShare;
-(void)clickQQShare;
-(void)clickQQZoneShare;

@end

NS_ASSUME_NONNULL_BEGIN

@interface CharlesShareAlertView : UIView

@property (nonatomic, strong) TouchBeginBlock touchBeginBlock;
@property(nonatomic,weak)id<XFShareViewProtocol> delegate;

- (instancetype)initWithShareFrame:(CGRect)frame;

/**弹出*/
- (void)show;

@end

NS_ASSUME_NONNULL_END
