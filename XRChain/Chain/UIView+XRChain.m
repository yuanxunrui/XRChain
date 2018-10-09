//
//  UIView+XRChain.m
//  ZJGoldenCode
//
//  Created by 袁训锐 on 2018/7/12.
//  Copyright © 2018年 中交金码. All rights reserved.
//

#import "UIView+XRChain.h"
#import <objc/runtime.h>

const char *keyOfMethod;
@implementation UIView (XRChain)

- (XRChainMaker *)XRMake{
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setXRMake:(XRChainMaker *)XRMake{
    
    objc_setAssociatedObject(self, @selector(XRMake), XRMake, OBJC_ASSOCIATION_RETAIN);
}
- (void)xr_makeChains:(void(^)(XRChainMaker *make))block{
    
    XRChainMaker *chainMaker = [[XRChainMaker alloc]init];
    chainMaker.originalView = self;
    block(chainMaker);
}
- (XRChainMaker *)xr_make{
    XRChainMaker *chainMaker = [self XRMake];
    if (!chainMaker) {
        chainMaker =  [[XRChainMaker alloc] init];
        chainMaker.originalView = self;
    }
    return chainMaker;
}
@end
