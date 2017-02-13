//
//  systemStrategy.m
//  Qiaobuyong_OpenCV_imageGray
//
//  Created by Apple on 2017/2/9.
//  Copyright © 2017年 乔布永. All rights reserved.
//

#import "systemStrategy.h"

@implementation systemStrategy 
//系统方法实现
- (UIImage*)imageToGrayImage:(UIImage*)image{
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
