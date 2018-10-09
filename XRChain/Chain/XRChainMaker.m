//
//  XRChainMaker.m
//  ZJGoldenCode
//
//  Created by 袁训锐 on 2018/7/12.
//  Copyright © 2018年 中交金码. All rights reserved.
//

#import "XRChainMaker.h"
@interface XRChainMaker ()

@property (nonatomic,weak) UILabel *label;
@property (nonatomic,weak) UIButton *button;
@property (nonatomic,weak) UITextField *textField;
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,weak) UITextView *textView;
@property (nonatomic,retain) UIActivityIndicatorView *spinner;

@end
@implementation XRChainMaker

//
- (XRChainMaker *(^)(float))font{
    return ^(float font){
        [self setFont:font];
        return self;
    };
}
// set bold font to view label
- (XRChainMaker *(^)(float))boldFont{
    return ^(float boldFont){
        [self setBoldFont:boldFont];
        return self;
    };
}
- (XRChainMaker *(^)(NSInteger))tag{
    return ^(NSInteger tag){
        self.originalView.tag = tag;
        return self;
    };
}
//
- (XRChainMaker *(^)(NSTextAlignment))textAlighment{
    return ^(NSTextAlignment textAlighment){
        [self setTextAlignment:textAlighment];
        return self;
    };
}
- (XRChainMaker *(^)(BOOL))hidden{
    return ^(BOOL bol){
        self.originalView.hidden = bol;
        return self;
    };
}

- (XRChainMaker *(^)(BOOL))clipsToBounds{
    return ^(BOOL bol){
        [self.originalView setClipsToBounds:bol];
        return self;
    };
}
- (XRChainMaker *(^)(float))cornerRadius{
    return ^(float radius){
        self.originalView.layer.cornerRadius = radius;
        return self;
    };
}
- (XRChainMaker *(^)(UIColor *))bgColor{
    return ^(UIColor *color){
        self.originalView.backgroundColor = color;
        return self;
    };
}
- (XRChainMaker *(^)(float))alpha{
    return ^(float alpha){
        self.originalView.alpha = alpha;
        return self;
    };
}
- (XRChainMaker *(^)(CGRect))frame{
    return ^(CGRect rect){
        self.originalView.frame = rect;
        return self;
    };
}

- (XRChainMaker *(^)(UIView *))addToSuperView{
    return ^(UIView *superView){
        [superView addSubview:self.originalView];
        return self;
    };
}

//
- (XRChainMaker *(^)(UIColor *,float))border{
    return ^(UIColor *borderColor,float borderWidth){
        self.originalView.layer.borderColor = borderColor.CGColor;
        self.originalView.layer.borderWidth = borderWidth;
        return self;
    };
}
//add shadow to view
//shadowColor、shadowOffset、opacity、radius
- (XRChainMaker *(^)(UIColor*,CGSize,float,float))addShadow{
    return ^(UIColor*color,CGSize shadowOffset,float opacity,float radius){
        
        self.originalView.layer.shadowColor=color.CGColor;//shadowColor阴影颜色
        self.originalView.layer.shadowOffset = shadowOffset;//阴影偏移量
        self.originalView.layer.shadowOpacity = opacity;//阴影透明度，默认0
        self.originalView.layer.shadowRadius = radius;//阴影半径，默认3
        return self;
    };
}
#pragma mark label
// set label text
- (XRChainMaker *(^)(NSString *))text{
    return ^(NSString *text){
        [self.label setText:text];
        return self;
    };
}
//
- (XRChainMaker *(^)(UIColor *))textColor{
    return ^(UIColor *color){
        [self.label setTextColor:color];
        return self;
    };
}
#pragma mark  button

// set button title
- (XRChainMaker *(^)(NSString *,UIControlState))title{
    return ^(NSString *title,UIControlState state){
        [self.button setTitle:title forState:state];
        return self;
    };
}
// 
- (XRChainMaker *(^)(UIColor *,UIControlState))titleColor{
    return ^(UIColor *color,UIControlState state){
        [self.button setTitleColor:color forState:state];
        return self;
    };
}

// set title alignment
- (XRChainMaker *(^)(UIControlContentHorizontalAlignment))horizontalAlignment{
    return ^(UIControlContentHorizontalAlignment alignment){
        self.button.contentHorizontalAlignment = alignment;
        return self;
    };
}
- (XRChainMaker *(^)(id,SEL,UIControlEvents))addAction{
    
    return ^(id target,SEL sel ,UIControlEvents event){
        [self.button addTarget:target action:sel forControlEvents:event];
        return self;
    };
}

//set background image
- (XRChainMaker *(^)(UIImage *,UIControlState))bgImage{
    return ^(UIImage * image,UIControlState state){
        [self.button setBackgroundImage:image forState:state];
        return self;
    };
}

#pragma mark 
- (void)setOriginalView:(UIView *)originalView{
    
    _originalView = originalView;
    
    if ([_originalView isKindOfClass:UILabel.class]) {
        _label = (UILabel *)_originalView;
    }else if ([_originalView isKindOfClass:UIButton.class]){
        _button = (UIButton *)_originalView;
    }else if ([_originalView isKindOfClass:UITextField.class]){
        _textField = (UITextField *)_originalView;
    }else if ([_originalView isKindOfClass:UITextView.class]){
        _textView = (UITextView *)_originalView;
    }else if ([_originalView isKindOfClass:[UITableView class]]){
        _tableView = (UITableView *)_originalView;
    }
    else if ([_originalView isKindOfClass:UIActivityIndicatorView.class]){
        _spinner = (UIActivityIndicatorView *)_originalView;
    }
}

#pragma mark private method
- (void)setFont:(float)font{
    if (self.label) {
        self.label.font = [UIFont systemFontOfSize:font];
    }else if (self.textField) {
        self.textField.font = [UIFont systemFontOfSize:font];
    }else if (self.button){
        self.button.titleLabel.font = [UIFont systemFontOfSize:font];
    }else if (self.textView){
        self.textView.font = [UIFont systemFontOfSize:font];
    }
}
- (void)setBoldFont:(float)font{
    if (self.label) {
        self.label.font = [UIFont boldSystemFontOfSize:font];
    }else if (self.textField) {
        self.textField.font = [UIFont boldSystemFontOfSize:font];
    }else if (self.button){
        self.button.titleLabel.font = [UIFont boldSystemFontOfSize:font];
    }else if (self.textView){
        self.textView.font = [UIFont boldSystemFontOfSize:font];
    }
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment{
    if (self.label) {
        self.label.textAlignment = textAlignment;
    }else if (self.button){
        self.button.titleLabel.textAlignment = textAlignment;
    }else if (self.textField){
        self.textField.textAlignment = textAlignment;
    }else if (self.textView){
        self.textView.textAlignment = textAlignment;
    }
}
@end
