//
//  XRChainMaker.h
//  ZJGoldenCode
//
//  Created by 袁训锐 on 2018/7/12.
//  Copyright © 2018年 中交金码. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XRChainMaker : NSObject

@property (nonatomic,weak) UIView *originalView;

// set font to viewlabel
- (XRChainMaker *(^)(float))font;
// set bold font to viewlabel
- (XRChainMaker *(^)(float))boldFont;
// set tag to view
- (XRChainMaker *(^)(NSInteger))tag;
// view add to superview
- (XRChainMaker *(^)(UIView *))addToSuperView;
//
- (XRChainMaker *(^)(NSTextAlignment))textAlighment;
//
- (XRChainMaker *(^)(BOOL))hidden;
//
- (XRChainMaker *(^)(float))cornerRadius;
//
- (XRChainMaker *(^)(UIColor *))bgColor;
//
- (XRChainMaker *(^)(float))alpha;
//
- (XRChainMaker *(^)(CGRect))frame;

//
- (XRChainMaker *(^)(BOOL))clipsToBounds;

//add shadow to view
//shadowColor、shadowOffset、opacity、radius
- (XRChainMaker *(^)(UIColor*,CGSize,float,float))addShadow;
//
- (XRChainMaker *(^)(UIColor *,float))border;

// add target action to button|textfield
- (XRChainMaker *(^)(id,SEL,UIControlEvents))addAction;
#pragma mark label
// set label text
- (XRChainMaker *(^)(NSString *))text;
- (XRChainMaker *(^)(UIColor *))textColor;
#pragma mark UIButton
// set button title
- (XRChainMaker *(^)(NSString *,UIControlState))title;

// set button title color
- (XRChainMaker *(^)(UIColor *,UIControlState))titleColor;


//set background image
- (XRChainMaker *(^)(UIImage *,UIControlState))bgImage;
// set button title position
- (XRChainMaker *(^)(UIControlContentHorizontalAlignment))horizontalAlignment;


@end
