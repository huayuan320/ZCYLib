
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (GetCurrentScreenViewController)

//通过控制器的布局视图可以获取到控制器实例对象    modal的展现方式需要取到控制器的根视图
- (UIViewController *)ZCY_getCurrentScreenViewController;

@end


@interface UIView (GetCurrentViewDisplayedController)

//通过响应者链条获取view所在的控制器
- (UIViewController *)ZCY_getCurrentViewDisplayedController;

@end
