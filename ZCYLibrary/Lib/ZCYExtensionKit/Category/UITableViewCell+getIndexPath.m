//
//  UITableViewCell+getIndexPath.m
//  yougutu
//
//  Created by 赵晨宇 on 16/7/19.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "UITableViewCell+getIndexPath.h"

@implementation UITableViewCell (getIndexPath)

-(NSIndexPath *)getMyIndexPath
{
    for (UIView* next = [self superview]; next; next = next.superview) {
        if ([next isKindOfClass:[UITableView class]]) {
            
            NSIndexPath *indexPath= [(UITableView*)next indexPathForCell:self];
            
            return indexPath;
        }
    }
    return NULL;
}
-(UITableView *)getMyTableView
{
    for (UIView* next = [self superview]; next; next = next.superview) {
        if ([next isKindOfClass:[UITableView class]]) {
            
            return (UITableView*)next;
        }
    }
    return NULL;
}
- (UIViewController*)getMyController {
    
    for (UIView* next = [self superview]; next; next = next.superview) {
        
        UIResponder* nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            
            return (UIViewController*)nextResponder;
            
        }
    }
    return NULL;
}
@end
