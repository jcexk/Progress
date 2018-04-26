一款呼吸灯效果的进度提示Demo
============
<br>
/**<br>
 supView:将要加载到那个视图上，一般都是UIImageView
 <br>
 subFrame:设置进度条展示的位置，默认是居中
 <br>
 */<br>
 
+(void)showView:(UIView *)supView center:(CGPoint)subCenter;<br>
/**<br>
 实时更新进度<br>
 */<br>
+(void)progressForFloat:(NSInteger)progressF;<br>
/**<br>
 消失<br>
 */<br>
+(void)dismiss;<br>
