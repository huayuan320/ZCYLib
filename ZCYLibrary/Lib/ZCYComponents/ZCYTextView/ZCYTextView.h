

#import <UIKit/UIKit.h>

@interface ZCYTextView : UITextView

@property(copy,nonatomic)   NSString *placeholder;

@property(strong,nonatomic) NSIndexPath * indexPath;

//最大长度设置
@property(assign,nonatomic) NSInteger maxTextLength;

//更新高度的时候
@property(assign,nonatomic) float updateHeight;

/**
 *  增加text 长度限制
 */
-(void)addMaxTextLengthWithMaxLength:(NSInteger)maxLength andEvent:(void(^)(ZCYTextView *text))limit;
/**
 *  开始编辑 的 回调
 */
-(void)addTextViewBeginEvent:(void(^)(ZCYTextView *text))begin;

/**
 *  结束编辑 的 回调
 */
-(void)addTextViewEndEvent:(void(^)(ZCYTextView *text))End;

/**
 *  设置Placeholder 颜色
 */
-(void)setPlaceholderColor:(UIColor*)color;

/**
 *  设置Placeholder 字体
 */
-(void)setPlaceholderFont:(UIFont*)font;

/**
 *  设置透明度
 */
-(void)setPlaceholderOpacity:(float)opacity;

@end
