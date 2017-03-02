
#import <UIKit/UIKit.h>

@interface UIButton (singleAction)

//点击间隔
@property (nonatomic, assign) NSTimeInterval timeInterval;
//用于设置单个按钮不需要被hook
@property (nonatomic, assign) BOOL isIgnore;
@end
