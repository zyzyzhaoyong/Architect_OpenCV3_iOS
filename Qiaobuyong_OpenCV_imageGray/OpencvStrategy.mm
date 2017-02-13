//
//  OpencvStrategy.m
//  Qiaobuyong_OpenCV_imageGray
//
//  Created by Apple on 2017/2/9.
//  Copyright © 2017年 乔布永. All rights reserved.
//

#import "OpencvStrategy.h"
//第一步:导入OpenCV头文件
#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>
//第二步:导入命名空间
using namespace cv;
@implementation OpencvStrategy
- (UIImage*)imageToGrayImage:(UIImage*)image{
    //image:表示源文件(原始图片)
    //第一步:将iOS的UIimage转成C++的图片(数据:矩阵)
    Mat mat_image_gray;
    UIImageToMat(image, mat_image_gray);
    
    //第二步:将C++的彩色图片转成灰度图片
    //参数1:数据源(原图片)
    //参数2:目标数据(目标图片)
    //参数3:转换类型(图片格式)
    //COLOR_BGR2GRAY :将彩色图片转成灰度图片
    Mat mat_image_dst;
    cvtColor(mat_image_gray, mat_image_dst, COLOR_BGR2GRAY);
    
    //第三步:转回可显示的图片 灰度->可显示图片
    //普及:RGB(3个通道的颜色) ARGB(4个通道颜色,增加了1个透明度)
    cvtColor(mat_image_dst, mat_image_gray, COLOR_GRAY2BGR);
    
    //第四步将C++处理后的图片转成iOS可以识别的UIimage
    
    return MatToUIImage(mat_image_gray);
}
@end
