//
//  JQProgreView.h
//  JQNewImage-master
//
//  Created by 江其 on 2017/6/26.
//  Copyright © 2017年 jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JQProgreView : UIView
/**
 supView:将要加载到那个视图上，一般都是UIImageView
 subFrame:设置进度条展示的位置，默认是居中
 */
+(void)showView:(UIView *)supView center:(CGPoint)subCenter;
/**
 实时更新进度
 */
+(void)progressForFloat:(NSInteger)progressF;
/**
 消失
 */
+(void)dismiss;
@end
