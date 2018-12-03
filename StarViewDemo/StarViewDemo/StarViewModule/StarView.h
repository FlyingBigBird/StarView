//
//  StarView.m
//  FotileCSS
//
//  Created by BaoBaoDaRen on 2018/7/5.
//  Copyright © 2018年 康振超. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface StarView : UIView

/** 最大等分    */
@property (nonatomic,assign) NSInteger maxStar;

/** 显示多少份*/
@property (nonatomic,assign) NSInteger showStar;

/** 设置字体*/
@property (nonatomic,assign) CGFloat fontSize;

/** 填充色*/
@property (nonatomic,strong) UIColor *fullColor;

/** ---默认色*/
@property (nonatomic,strong) UIColor *emptyColor;

/** 设置是否可以点击选中   yes可以点击，拖动 No 用来简单显示*/
@property (nonatomic,assign) BOOL canSelected;

@end
