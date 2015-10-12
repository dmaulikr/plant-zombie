//
//  sunFlower.m
//  plant&zombie
//
//  Created by MBZL on 15/9/18.
//  Copyright (c) 2015年 高昭鹏. All rights reserved.
//

#import "sunFlower.h"
@implementation sunFlower
//初始化方法
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    //改变植物的背景图片
        self.plantImage=[UIImage imageNamed:@"plant_0.png"];
    //打开交互功能
        self.userInteractionEnabled=YES;
    }
    return self;
}
-(void)fire{
//创建开火timer
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(addSunAction) userInfo:nil repeats:YES];

}
//添加太阳动画
-(void)addSunAction{
//创建太阳的button
    UIButton * sunBtn=[[UIButton alloc]initWithFrame:CGRectMake(5+arc4random()%20, 5+arc4random()%20, 25, 25)];
//设置太阳的背景图
    [sunBtn setImage:[UIImage imageNamed:@"sun.png"] forState:UIControlStateNormal];
//添加点击特效
    [sunBtn addTarget:self action:@selector(clickedsun:) forControlEvents:UIControlEventTouchUpInside];
//将动画加到视图上
    [self addSubview:sunBtn];
//定时消失定时器
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(sunTimeoutAction:) userInfo:sunBtn repeats:YES];
}
//点击太阳花时花会从父视图上清除掉
-(void)clickedsun:(UIButton *)sunbtn{
    [sunbtn removeFromSuperview];
    
}
//太阳花消失的逻辑
-(void)sunTimeoutAction:(NSTimer*)timer{
//同过timer.userInfo拿到地址
    UIButton * suBtn=timer.userInfo;
//把地址里数据清除掉
    [suBtn removeFromSuperview];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
