//
//  ViewController.h
//  plant&zombie
//
//  Created by MBZL on 15/9/17.
//  Copyright (c) 2015年 高昭鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *plantGrass;//草地上的洞

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *plantImageViews;
//种子数组

@property (strong, nonatomic) IBOutlet UILabel *sunCountLabel;
//计分标签


@end

