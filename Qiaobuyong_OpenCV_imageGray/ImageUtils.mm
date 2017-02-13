//
//  ImageUtils.m
//  Qiaobuyong_OpenCV_imageGray
//
//  Created by Apple on 2017/2/9.
//  Copyright © 2017年 乔布永. All rights reserved.
//

#import "ImageUtils.h"
//第一步:导入OpenCV头文件
#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>
//第二步:导入命名空间
using namespace cv;
@implementation ImageUtils
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
//系统方法实现
- (UIImage*)systemImageToGrayImage:(UIImage*)image{
    int width = image.size.width;
    int height = image.size.height;
    //第一步:创建颜色空间(说白了就是 开辟一块颜色内存空间)
    //图片灰度处理(创建灰度空间)
 
    CGColorSpaceRef colorRef = CGColorSpaceCreateDeviceGray();
    
    //第二步:颜色空间的上下文(保存图像数据信息)
    //参数1:内存大小(指向这块内存区域的地址)(内存地址)
    //参数2:图片宽
    //参数3:图片高
    //参数4:像素位数(颜色空间,例如:32位像素格式和RGB颜色空间,8位)
    //参数5:图片每一行占用的内存比特数
    //参数6:颜色空间
    //参数7:图片是否包含A通道(ARGB通道)
CGContextRef context = CGBitmapContextCreate(nil, width, height, 8, 0, colorRef, kCGImageAlphaNone);
    
    //释放内存
    CGColorSpaceRelease(colorRef);
    if (context == nil) {
        return nil;
    }
    //第三步:渲染图片(绘制图片)
    //参数1:上下文
    //参数2:渲染区域
    //参数3:源文件(原图片)(说白了现在是一个C/C++的内存区域)
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), image.CGImage);
    
    //第四步:将绘制颜色空间转成CGImage(转成可识别图片类型)
    CGImageRef grayImageRef = CGBitmapContextCreateImage(context);
    
    //第五步:将C/C++ 的图片CGImage转成面向对象的UIImage(转成iOS程序认识的图片类型)
    UIImage* dstImage = [UIImage imageWithCGImage:grayImageRef];
    
    //释放内存
    CGContextRelease(context);
    CGImageRelease(grayImageRef);
    return dstImage;

    return nil;
}

@end
