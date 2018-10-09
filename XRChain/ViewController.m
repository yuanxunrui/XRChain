//
//  ViewController.m
//  XRChain
//
//  Created by 袁训锐 on 2018/10/9.
//  Copyright © 2018年 XR. All rights reserved.
//

#import "ViewController.h"
#import "UIView+XRChain.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn xr_makeChains:^(XRChainMaker *make) {
        make.title(@"点我",UIControlStateNormal)
        .titleColor([UIColor whiteColor],UIControlStateNormal)
        .bgColor([UIColor redColor])
        .boldFont(14.f)
        .tag(1)
        .horizontalAlignment(UIControlContentHorizontalAlignmentCenter)
        .addAction(self,@selector(buttonClick:),UIControlEventTouchUpInside)
        //        .hidden(YES)
        .cornerRadius(5.f)
        .addToSuperView(self.view);
    }];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)buttonClick:(UIButton *)sender{
    NSLog(@"%s",__FUNCTION__);
}

@end
