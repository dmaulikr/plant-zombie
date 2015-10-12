//
//  tudu.m
//  plant&zombie
//
//  Created by MBZL on 15/9/18.
//  Copyright (c) 2015年 高昭鹏. All rights reserved.
//

#import "tudu.h"

@implementation tudu
//重写初始化方法
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    //设置图片
        self.plantImage=[UIImage imageNamed:@"plant_8.png"];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
