//
//  peaNut.h
//  plant&zombie
//
//  Created by MBZL on 15/9/18.
//  Copyright (c) 2015年 高昭鹏. All rights reserved.
//

#import "plant.h"
#import "ViewController.h"

@interface peaNut : plant
//创建子弹的数组
@property NSMutableArray * bullets;
//子弹图片
@property(nonatomic,strong)UIImage * bulletImage;
@end
