

#import "UIImageView+ZCYKit.h"

@implementation UIImageView (ZCYKit)
// 播放GIF
- (void)ZCY_playGifAnimationImages:(NSArray *)animationImages {
    if (!animationImages.count) {
        return;
    }
    //动画图片数组
    self.animationImages = animationImages;
    //执行一次完整动画所需的时长
    self.animationDuration = 0.5;
    //动画重复次数, 设置成0 就是无限循环
    self.animationRepeatCount = 0;
    [self startAnimating];
}
// 停止动画
- (void)ZCY_stopGifAnimating {
    if (self.isAnimating) {
        [self stopAnimating];
    }
    [self removeFromSuperview];
}

@end
