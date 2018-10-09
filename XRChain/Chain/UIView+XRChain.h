//
//  UIView+XRChain.h
//  ZJGoldenCode
//
//  Created by 袁训锐 on 2018/7/12.
//  Copyright © 2018年 中交金码. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XRChainMaker.h"

@interface UIView (XRChain)

@property (nonatomic) XRChainMaker *XRMake;

- (void)xr_makeChains:(void(^)(XRChainMaker *make))block;
- (XRChainMaker *)xr_make;
@end
