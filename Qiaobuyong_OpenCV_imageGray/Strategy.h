//
//  Strategy.h
//  Qiaobuyong_OpenCV_imageGray
//
//  Created by Apple on 2017/2/9.
//  Copyright © 2017年 乔布永. All rights reserved.
//

#import <UIKit/UIKit.h>
//策略协议:面向协议编程
@protocol Strategy <NSObject>
//定义算法
- (UIImage*)imageToGrayImage:(UIImage*)image;
@end
