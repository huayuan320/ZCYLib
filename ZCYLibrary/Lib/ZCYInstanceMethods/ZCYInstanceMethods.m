//
//  ZCYInstanceMethods.m
//  ZCYKit
//
//  Created by ZCY on 2016/10/10.
//  Copyright © 2016年 ZCY. All rights reserved.
//

#import "ZCYInstanceMethods.h"

@implementation ZCYInstanceMethods

@end

/**************************************************************************************************/

@implementation CIImage (ZCYUtility)

/** 将CIImage转换成UIImage */
- (UIImage *)ZCY_createNonInterpolatedWithSize:(CGFloat)size {
    
    CGRect extent = CGRectIntegral(self.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:self fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    
    UIImage *image = [UIImage imageWithCGImage:scaledImage];
    
    return image;
}

@end

/**************************************************************************************************/
