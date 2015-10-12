//
//  plant.h
//  plant&zombie
//
//  Created by MBZL on 15/9/18.
//  Copyright (c) 2015年 高昭鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@interface plant : UIImageView//植物的父类
@property (nonatomic)UIImage * plantImage;//植物的图片
@property(nonatomic)NSInteger count;
@property(nonatomic,weak)ViewController * vc;
-(void)fire;//射击
@end
