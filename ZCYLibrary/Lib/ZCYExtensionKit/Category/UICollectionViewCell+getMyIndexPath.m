//
//  UICollectionViewCell+getMyIndexPath.m
//  mengYou
//
//  Created by 赵晨宇 on 16/10/25.
//  Copyright © 2016年 waiLian. All rights reserved.
//

#import "UICollectionViewCell+getMyIndexPath.h"

@implementation UICollectionViewCell (getMyIndexPath)
-(NSIndexPath *)getMyIndexPath
{
    for (UIView* next = [self superview]; next; next = next.superview) {
        if ([next isKindOfClass:[UICollectionView class]]) {
            
            NSIndexPath *indexPath= [(UICollectionView*)next indexPathForCell:self];
            
            return indexPath;
        }
    }
    return NULL;
}
-(UICollectionView *)getMyTableView
{
    for (UIView* next = [self superview]; next; next = next.superview) {
        if ([next isKindOfClass:[UITableView class]]) {
            
            return (UICollectionView*)next;
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
