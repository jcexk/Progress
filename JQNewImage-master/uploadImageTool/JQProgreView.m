//
//  JQProgreView.m
//  JQNewImage-master
//
//  Created by 江其 on 2017/6/26.
//  Copyright © 2017年 jiang. All rights reserved.
//

#import "JQProgreView.h"

@interface JQProgreView ()
@property (nonatomic,strong) UIView *centerView;
@property (nonatomic,strong) UILabel *progress_Lab;
@property (nonatomic,strong) CALayer *bg_Layer;
@end
@implementation JQProgreView
static JQProgreView *instance;
static dispatch_once_t onceToken;
#pragma mark - --初始化
+ (instancetype)instance
{
    
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        instance.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.7];
    }) ;
    return instance;
}
-(instancetype)init
{
    self = [super init];
    if (self) {
        self.centerView = [[UIView alloc]init];
        [self addSubview:self.centerView];
        self.centerView.bounds = CGRectMake(0, 0, 50, 50);
        
        _bg_Layer = [[CALayer alloc]init];
        [self.layer addSublayer:_bg_Layer];
        
        _progress_Lab = [[UILabel alloc]init];
        [self addSubview:_progress_Lab];
        _progress_Lab.font = [UIFont systemFontOfSize:10.0];
        _progress_Lab.textColor = [UIColor whiteColor];
        _progress_Lab.bounds = CGRectMake(0, 0, self.centerView.bounds.size.width, 20);
        _progress_Lab.textAlignment = NSTextAlignmentCenter;
        
        //圆角
        self.centerView.layer.masksToBounds = YES;
        self.centerView.layer.cornerRadius = self.centerView.frame.size.width / 2;
        //边框
        self.centerView.layer.borderColor = [UIColor whiteColor].CGColor;
        self.centerView.layer.borderWidth = 2;
        
        self.centerView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.7];

    }
    return self;
}
#pragma mark - --显示
+(void)showView:(UIView *)supView center:(CGPoint)subCenter
{
    instance = [self instance];
    
    instance.frame = supView.bounds;
    [supView addSubview:instance];
    
    instance.centerView.center = CGPointMake(instance.bounds.size.width/2, instance.bounds.size.height/2);
    
    instance.progress_Lab.center = CGPointMake(instance.bounds.size.width/2, instance.bounds.size.height/2);
    
    //添加背景
    instance.bg_Layer.position = instance.centerView.layer.position;//这里是个人喜好这么写
    instance.bg_Layer.bounds = instance.centerView.bounds;
    instance.bg_Layer.cornerRadius = instance.centerView.layer.cornerRadius;
    instance.bg_Layer.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.5].CGColor;//这里必须设置layer层的背景颜色，默认应该是透明的，导致设置的阴影颜色无法显示出来
    instance.bg_Layer.shadowColor = [[UIColor redColor]colorWithAlphaComponent:0.7].CGColor;//设置阴影的颜色
    instance.bg_Layer.shadowRadius = 5;//设置阴影的宽度
    instance.bg_Layer.shadowOffset = CGSizeMake(0, 0);//设置偏移
    instance.bg_Layer.shadowOpacity = 1;
    
    [instance bringSubviewToFront:instance.centerView];
 
    CABasicAnimation *animation =[CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = [NSNumber numberWithFloat:1.0f];
    animation.toValue = [NSNumber numberWithFloat:0.0f];
    animation.autoreverses = YES;    //回退动画（动画可逆，即循环）
    animation.duration = 1.5f;
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;//removedOnCompletion,fillMode配合使用保持动画完成效果
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [instance.centerView.layer addAnimation:animation forKey:@"aAlpha"];
    
}
#pragma mark - --实时更新进度
+(void)progressForFloat:(NSInteger)progressF
{
    
    @autoreleasepool {
        NSString *proStr = [[NSString alloc]initWithFormat:@"%ld%%",(long)progressF ];
        instance.progress_Lab.text = proStr;
        proStr = nil;
    }
    
}
#pragma mark - --消失
+(void)dismiss
{
    [instance removeFromSuperview];
    instance = nil;
    onceToken = 0;
    
}
-(void)dealloc
{
    
}
@end
