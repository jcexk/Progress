//
//  ViewController.m
//  JQNewImage-master
//
//  Created by 江其 on 2017/6/26.
//  Copyright © 2017年 jiang. All rights reserved.
//

#import "ViewController.h"
#import "JQProgreView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *head_ImgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)uploadClick:(id)sender
{
    [JQProgreView showView:self.head_ImgView center:CGPointMake(0, 0)];
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(chang) userInfo:nil repeats:YES];
}
static int a;
-(void)chang
{
    a++;
    [JQProgreView progressForFloat:a];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [JQProgreView dismiss];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
