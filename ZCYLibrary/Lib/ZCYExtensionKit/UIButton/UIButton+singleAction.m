

#import <UIKit/UIKit.h>

#import "NSObject+ZCYKit.h"

//默认时间间隔
#define defaultInterval 1
@implementation UIButton (singleAction)

/**
 在Objective-C runtime会自动调用两个类方法，分别为+load与+ initialize。+load 方法是在类被加载的时候调用的，也就是一定会被调用。而+initialize方法是在类或它的子类收到第一条消息之前被调用的，这里所指的消息包括实例方法和类方法的调用。也就是说+initialize方法是以懒加载的方式被调用的，如果程序一直没有给某个类或它的子类发送消息，那么这个类的+initialize方法是永远不会被调用的。此外+load方法还有一个非常重要的特性，那就是子类、父类和分类中的+load方法的实现是被区别对待的。换句话说在 Objective-C runtime自动调用+load方法时，分类中的+load方法并不会对主类中的+load方法造成覆盖。综上所述，+load 方法是实现 Method Swizzling 逻辑的最佳“场所”。如需更深入理解，可参考Objective-C 深入理解 +load 和 +initialize。
 
 文／卖报的小画家Sure（简书作者）
 原文链接：http://www.jianshu.com/p/f6dad8e1b848
 著作权归作者所有，转载请联系作者获得授权，并标注“简书作者”。
 */
+ (void)load {
    //方法交换应该要线程安全，而且保证在任何情况下（多线程环境，或者被其他人手动再次调用+load方法）只交换一次，防止再次调用又将方法交换回来。除非只是临时交换使用，在使用完成后又交换回来。 最常用的解决方案是在+load方法中使用dispatch_once来保证交换是安全的。之前有读者反馈+load方法本身即为线程安全，为什么仍需添加dispatch_once，其原因就在于+load方法本身无法保证其中代码只被执行一次。
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self methodSwizzlingWithOriginalSelector:@selector(sendAction:to:forEvent:) bySwizzledSelector:@selector(sure_SendAction:to:forEvent:)];
    });
}

- (NSTimeInterval)timeInterval{
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}
- (void)setTimeInterval:(NSTimeInterval)timeInterval{
    objc_setAssociatedObject(self, @selector(timeInterval), @(timeInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
//当按钮点击事件sendAction 时将会执行sure_SendAction
- (void)sure_SendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    if (self.isIgnore) {
        //不需要被hook
        [self sure_SendAction:action to:target forEvent:event];
        return;
    }
    if ([NSStringFromClass(self.class) isEqualToString:@"UIButton"]) {
        self.timeInterval =self.timeInterval == 0 ?defaultInterval:self.timeInterval;
        if (self.isIgnoreEvent){
            return;
        }else if (self.timeInterval > 0){
            [self performSelector:@selector(resetState) withObject:nil afterDelay:self.timeInterval];
        }
    }
    //此处 methodA和methodB方法IMP互换了，实际上执行 sendAction；所以不会死循环
    self.isIgnoreEvent = YES;
    [self sure_SendAction:action to:target forEvent:event];
}
//runtime 动态绑定 属性
- (void)setIsIgnoreEvent:(BOOL)isIgnoreEvent{
    // 注意BOOL类型 需要用OBJC_ASSOCIATION_RETAIN_NONATOMIC 不要用错，否则set方法会赋值出错
    objc_setAssociatedObject(self, @selector(isIgnoreEvent), @(isIgnoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)isIgnoreEvent{
    //_cmd == @select(isIgnore); 和set方法里一致
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}
- (void)setIsIgnore:(BOOL)isIgnore{
    // 注意BOOL类型 需要用OBJC_ASSOCIATION_RETAIN_NONATOMIC 不要用错，否则set方法会赋值出错
    objc_setAssociatedObject(self, @selector(isIgnore), @(isIgnore), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)isIgnore{
    //_cmd == @select(isIgnore); 和set方法里一致
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}
- (void)resetState{
    [self setIsIgnoreEvent:NO];
}
@end
