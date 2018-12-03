//
//  ViewController.m
//  StarViewDemo
//
//  Created by BaoBaoDaRen on 2018/12/3.
//  Copyright © 2018年 BaoBao. All rights reserved.
//

#import "ViewController.h"
#import "StarView.h"

@interface ViewController ()

@property (nonatomic, strong) StarView *startView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.startView = [[StarView alloc]initWithFrame:CGRectMake(0, 0, 90, 20)];
    [self.view  addSubview:self.startView];
    self.startView.center = self.view.center;
    
    _startView.fontSize = 20;
    _startView.maxStar = 100;
    _startView.fullColor = [self colorWithHexString:@"f2d681"];
    _startView.emptyColor = [self colorWithHexString:@"979797"];
    _startView.showStar = 80;// 初始化设置显示值...
    _startView.canSelected = NO;// 设置成YES可以手动点击...
    [_startView setNeedsLayout];
    
}

#define DEFAULT_VOID_COLOR [UIColor whiteColor]
- (UIColor *)colorWithHexString:(NSString *)stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString length] < 6)
    {
        return DEFAULT_VOID_COLOR;
    }
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return DEFAULT_VOID_COLOR;
    }
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
