//
//  plant.m
//  plant&zombie
//
//  Created by MBZL on 15/9/18.
//  Copyright (c) 2015年 高昭鹏. All rights reserved.
//

#import "plant.h"
@implementation plant
//重写初始化方法
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    //创建时间线导入changeImage方法
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(changeImage) userInfo:nil repeats:YES];
    }
    return self;
}
//实现图片动画
-(void)changeImage{
    //切图每进一次图片切的位置向后移
    CGImageRef subImage=CGImageCreateWithImageInRect(self.plantImage.CGImage, CGRectMake(self.count++%8*self.plantImage.size.width/8, 0, self.plantImage.size.width/8, self.plantImage.size.height));
    //将切出来的图片赋值到
    self.image=[UIImage imageWithCGImage:subImage];

}
//射击方法
-(void)fire{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
