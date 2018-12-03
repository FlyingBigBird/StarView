//
//  StarView.m
//  FotileCSS
//
//  Created by BaoBaoDaRen on 2018/7/5.
//  Copyright © 2018年 康振超. All rights reserved.
//


#import "StarView.h"

@implementation StarView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self == [super initWithFrame:frame]) {
        
        self.maxStar = 100;
        self.showStar = 80;
        self.canSelected = NO;
        
        //背景色
        self.backgroundColor = [UIColor clearColor];
        
        //字体大小
        self.fontSize = 30;
        
        //颜色
        self.fullColor = [UIColor redColor];
        self.emptyColor = [UIColor grayColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    NSString *stars=@"★★★★★";
    
    //设置frame
    rect = self.bounds;
    
    UIFont *font = [UIFont systemFontOfSize:self.fontSize];
    NSDictionary *dict =  @{NSFontAttributeName: font};
    CGSize starSize = [stars sizeWithAttributes:dict];
    rect.size = starSize;
    [stars drawInRect:rect withAttributes:@{NSFontAttributeName: font,NSForegroundColorAttributeName: self.emptyColor}];
    
    CGRect clip=rect;
    clip.size.width = clip.size.width * self.showStar / self.maxStar;
    CGContextClipToRect(context,clip);
    [stars drawInRect:rect withAttributes:@{NSFontAttributeName: font,NSForegroundColorAttributeName: self.fullColor}];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.canSelected)
    {
        //可以选择
        NSString *sting = @"★★★★★";
        CGPoint pt = [[touches anyObject] locationInView:self];
        UIFont *font = [UIFont systemFontOfSize:self.fontSize];
        CGSize starSize = [sting sizeWithAttributes:@{NSFontAttributeName: font}];
        
        if (pt.x > starSize.width + 5)
        {
            return;
        }
        
        self.showStar = (NSInteger)(100.0f * pt.x / starSize.width);
        
        //重新绘制
        [self setNeedsDisplay];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.canSelected)
    {
        //可以选择
        NSString *sting = @"★★★★★";
        CGPoint pt = [[touches anyObject] locationInView:self];
        UIFont *font = [UIFont systemFontOfSize:self.fontSize];
        CGSize starSize = [sting sizeWithAttributes:@{NSFontAttributeName: font}];
        
        if (pt.x > starSize.width + 5)
        {
            return;
        }
        
        self.showStar = (NSInteger)(100.0f * pt.x / starSize.width);
        
        //重新绘制
        [self setNeedsDisplay];
    }
}

@end
