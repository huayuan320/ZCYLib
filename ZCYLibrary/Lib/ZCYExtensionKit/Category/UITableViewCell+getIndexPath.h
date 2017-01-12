//
//  UITableViewCell+getIndexPath.h
//  yougutu
//
//  Created by 赵晨宇 on 16/7/19.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (getIndexPath)
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
-(UITableView *)getMyTableView;
/**
 *  得到当前cell的控制器
 *
 *  @return <#return value description#>
 */
- (UIViewController*)getMyController;

@end
