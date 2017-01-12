//
//  ZCYInstanceMethods.h
//  ZCYKit
//
//  Created by ZCY on 2016/10/10.
//  Copyright © 2016年 ZCY. All rights reserved.
//

#import <Foundation/Foundation.h>

//实例方法是-开头

@interface ZCYInstanceMethods : NSObject

@end

/**************************************************************************************************/
#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>

@interface CIImage (ZCYUtility)

/** 将CIImage转换成UIImage */
- (UIImage *)ZCY_createNonInterpolatedWithSize:(CGFloat)size;

@end

/**************************************************************************************************/
