//
//  UIScrollView+leftSlide.m
//  mengYou
//
//  Created by 赵晨宇 on 16/10/19.
//  Copyright © 2016年 waiLian. All rights reserved.
//

#import "UIScrollView+leftSlide.h"
#import <objc/runtime.h>
@implementation UIScrollView (leftSlide)
+(void)load
{
    [super load];
    [self exchangeMethod];
}
+ (void)exchangeMethod
{
    Method origGet1 = class_getInstanceMethod([self class], @selector(hitTest:withEvent:));
    Method replaceGet1 = class_getInstanceMethod([self class], @selector(MyhitTest:withEvent:));
    method_exchangeImplementations(origGet1, replaceGet1);
}
- (UIView *)MyhitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *hitView = nil;
    NSInteger pointX= (NSInteger )point.x;
    NSInteger screenW = [UIScreen mainScreen].bounds.size.width;
    if (pointX % screenW <= 15) {
        hitView = nil;
    } else {
        hitView = [super hitTest:point withEvent:event];
    }
    return hitView;
}

@end
