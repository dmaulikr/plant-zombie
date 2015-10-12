//
//  ViewController.m
//  plant&zombie
//
//  Created by MBZL on 15/9/17.
//  Copyright (c) 2015年 高昭鹏. All rights reserved.
//

#import "ViewController.h"
#import "sunFlower.h"//导入向日葵
#import "peaNut.h"//导入豌豆射手
#import "icePeaNut.h"//导入冰豌豆射手
#import "plant.h"//导入植物类
#import "tudu.h"//导入土豆
@interface ViewController ()

@property(nonatomic,strong)plant * dragPlant;//创建抓取图片的属性

@end

@implementation ViewController
-(void)initUI{
    
    
    //创建一个种子面板的图片对象
    UIImage * plantsImage = [UIImage imageNamed:@"seedpackets.png"];
   //遍历种子面板的数组
    for (NSInteger i = 0; i < self.plantImageViews.count; i++) {
    //在从面板的数组里拿到每一个种子面板对象
        UIImageView * plantIV = self.plantImageViews[i];
        NSInteger x = 0;
        switch (i) {
            case 0://向日葵
                x = 0;
                break;
            case 1://豌豆射手
                x = 1;
                break;
            case 2://寒冰射手
                x = 3;
                break;
            case 3://坚果墙
                x = 8;
                break;
        }
    //切出每个面板
        CGImageRef subImage = CGImageCreateWithImageInRect(plantsImage.CGImage, CGRectMake(x*plantsImage.size.width/18, 0, plantsImage.size.width/18, plantsImage.size.height));
    //将切出来的图片cope到每个面板上
        plantIV.image = [UIImage imageWithCGImage:subImage];
    //释放切出来的图片
        CGImageRelease(subImage);
    }
}
//隐藏状态栏
-(BOOL)prefersStatusBarHidden{
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //创建touch对象
    UITouch * touch=[touches anyObject];
    //获得触摸点的坐标
    CGPoint p=[touch locationInView:self.view];
    //遍历种子面板数组
    for (UIImageView * plantIV in self.plantImageViews) {
        //通过CGRectContainsPoint 判定是不是点到种子面板
        if (CGRectContainsPoint(plantIV.frame, p)) {
            //根据种子的匿名判定 创建对应的对象
            switch (plantIV.tag) {
                case 0:
                    self.dragPlant=[[sunFlower alloc]initWithFrame:plantIV.frame];
                    
                    //把对象上的VC设为自己界面
                    self.dragPlant.vc=self;
                    break;
                case 1:
                    self.dragPlant=[[peaNut alloc]initWithFrame:plantIV.frame];
                    self.dragPlant.vc=self;
                    break;
                case 2:
                    self.dragPlant=[[icePeaNut alloc]initWithFrame:plantIV.frame];
                    break;
                case 3:
                    self.dragPlant=[[tudu alloc]initWithFrame:plantIV.frame];
                    break;



                default:
                    break;
            }
    //将抓到的图片创建在界面上
    [self.view addSubview:self.dragPlant];
        }
    }

}

//当触摸点移动的时候的监听事件
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch=[touches anyObject];
    CGPoint p=[touch locationInView:self.view];
    //当拖动时 抓到图片的中心点等于点到的点
    self.dragPlant.center=p;
}
//当触摸点结束的时候的监听事件

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{UITouch * touch=[touches anyObject];
    CGPoint p=[touch locationInView:self.view];
//传入抓到的图片如果不为空就进行判断
    if (self.dragPlant) {
    //遍历 草地上的洞
        for (UIView * box in self.plantGrass) {
            //当停的位置在洞上且洞上没有对象
            if (CGRectContainsPoint(box.frame, p)&&box.subviews.count == 0) {
    //将抓到的对象放在洞上
                [box addSubview:self.dragPlant];
    //把对象的位置设置为中心店
                self.dragPlant.center=CGPointMake(box.bounds.size.width/2, box.bounds.size.height/2);
                
    //对象 调用射击方法
                [self.dragPlant fire];

            }
        }
    }
    //假如对象的父类的视图 是在self.view
    if ([self.dragPlant.superview isEqual:self.view]) {
        
    //将对象清除掉
        [self.dragPlant removeFromSuperview];
            }
    self.dragPlant=nil;

}

@end
