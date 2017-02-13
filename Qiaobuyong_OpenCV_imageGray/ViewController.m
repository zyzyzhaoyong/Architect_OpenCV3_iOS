//
//  ViewController.m
//  Qiaobuyong_OpenCV_imageGray
//
//  Created by Apple on 2017/2/9.
//  Copyright © 2017年 乔布永. All rights reserved.
//

#import "ViewController.h"
#import "ImageUtils.h"
#import "systemStrategy.h"
#import "OpencvStrategy.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic) ImageUtils *utils1;
@property (nonatomic) id<Strategy> utils;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _utils1 = [[ImageUtils alloc]init];

    _utils = [[systemStrategy alloc]init];//系统方法协议
//    _utils = [[OpencvStrategy alloc]init];//OpenCV方法

}
//灰度
- (IBAction)clickImageGray:(UIButton *)sender {
    //三个颜色值相同就是灰色
    //底层算法就是通过动态修改颜色OpenCV和系统自带的API底层算法是相同的
   _imageView.image =  [_utils imageToGrayImage:_imageView.image];
//    _imageView.image =  [_utils1 systemImageToGrayImage:_imageView.image];

    
    //策略模式最基本使用
    
    
    
}
//原图
- (IBAction)clickImageNormal:(UIButton *)sender {
    _imageView.image = [UIImage imageNamed:@"紫霞仙子.jpeg"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
