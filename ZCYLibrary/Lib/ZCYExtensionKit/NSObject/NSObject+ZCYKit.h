

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (ZCYKit)

/**
 方法交换

 @param originalSelector 原方法
 @param swizzledSelector 新方法
 */
+ (void)methodSwizzlingWithOriginalSelector:(SEL)originalSelector
                         bySwizzledSelector:(SEL)swizzledSelector;


@end
