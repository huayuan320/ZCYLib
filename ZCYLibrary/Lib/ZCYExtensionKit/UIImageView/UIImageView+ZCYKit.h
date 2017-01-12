

#import <UIKit/UIKit.h>

@interface UIImageView (ZCYKit)

// 播放GIF
- (void)ZCY_playGifAnimationImages:(NSArray *)animationImages;

// 停止动画
- (void)ZCY_stopGifAnimating;

@end
