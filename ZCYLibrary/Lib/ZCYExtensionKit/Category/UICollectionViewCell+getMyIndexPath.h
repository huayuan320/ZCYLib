//
//  UICollectionViewCell+getMyIndexPath.h
//  mengYou
//
//  Created by 赵晨宇 on 16/10/25.
//  Copyright © 2016年 waiLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewCell (getMyIndexPath)
/**
 *  获取当前cell的indexPath值
 *
 *  @return 返回indexPath值
 */
-(NSIndexPath *)getMyIndexPath;
/**
 *  得到当前cell的TableView
 *
 *  @return <#return value description#>
 */
-(UICollectionView *)getMyTableView;
/**
 *  得到当前cell的控制器
 *
 *  @return <#return value description#>
 */
- (UIViewController*)getMyController;
@end
