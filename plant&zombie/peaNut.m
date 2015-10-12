//
//  peaNut.m
//  plant&zombie
//
//  Created by MBZL on 15/9/18.
//  Copyright (c) 2015年 高昭鹏. All rights reserved.
//

#import "peaNut.h"

@implementation peaNut
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    //设置植物图片
        self.plantImage=[UIImage imageNamed:@"plant_1.png"];
    //对bullets开辟内存
        _bullets=[NSMutableArray array];
    //设置子弹的图片
        _bulletImage=[UIImage imageNamed:@"bullet_0.png"];
    }
    return self;
}
//改变子弹的位置
-(void)changeBullet{
//遍历所有的子弹每进一次timer 所有子弹位置向前
    for (UIImageView * bulletIV in self.bullets) {
        bulletIV.center=CGPointMake(bulletIV.center.x+14, bulletIV.center.y);
//当子弹超出屏幕的时候清除子弹
        if (bulletIV.center.x>=670) {
            [bulletIV removeFromSuperview];
            [self.bullets removeObject:bulletIV];
            //注意在for in 迭代器中对该数组进行删除会导致程序崩溃
            //
            break;
            
        }
    }

}
//重写豌豆射手的图片动画
-(void)changeImage{
    CGImageRef subImage=CGImageCreateWithImageInRect(self.plantImage.CGImage, CGRectMake(self.count++%5*self.plantImage.size.width/5, 0, self.plantImage.size.width/5, self.plantImage.size.height));
    self.image=[UIImage imageWithCGImage:subImage];
    
}
//重写射击方法
-(void)fire{
    
    //创建添加子弹的timer
    [NSTimer scheduledTimerWithTimeInterval:2
                                     target:self selector:@selector(addBullet) userInfo:nil repeats:YES];
    //创建改变子弹位移的方法
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(changeBullet) userInfo:nil repeats:YES];

}
//添加子弹
-(void)addBullet{
//创建一个UIImageView 来表示子弹 初始化位置
    UIImageView * bulletIV=[[UIImageView alloc]initWithFrame:CGRectMake(self.superview.center.x+15, self.self.superview.center.y-17, 15, 15)];
//设置子弹的图片
    bulletIV.image=self.bulletImage;
//将子弹添加到父视图上
    [self.vc.view addSubview:bulletIV];
//将子弹添加到子弹数组里面
    [self.bullets addObject:bulletIV];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
