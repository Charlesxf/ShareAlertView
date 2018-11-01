//
//  ViewController.m
//  ShareAlertView
//
//  Created by zxfApple on 2018/11/1.
//  Copyright © 2018年 Charles_XF.com. All rights reserved.
//

#import "ViewController.h"
#import "CharlesShareAlertView.h"

@interface ViewController ()

@property (nonatomic,strong) CharlesShareAlertView *shareView;

@end

@implementation ViewController

- (CharlesShareAlertView *)shareView{
    if (!_shareView) {
        _shareView = [[CharlesShareAlertView alloc]initWithShareFrame:self.view.bounds];
    }
    return _shareView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)shareAction:(UIButton *)sender {
    [self.shareView show];
}

@end
