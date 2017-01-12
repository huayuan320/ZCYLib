

#import <UIKit/UIKit.h>

@class  ZCYCollectionViewFlowLayout;

@protocol ZCYCollectionViewFlowLayoutDelegate <UICollectionViewDelegateFlowLayout>

@required
/**
 *  number of column in section protocol delegate methods
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView
                     layout:(ZCYCollectionViewFlowLayout *)layout
   numberOfColumnsInSection:(NSInteger)section;

@end

@interface ZCYCollectionViewFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, weak) id<ZCYCollectionViewFlowLayoutDelegate> xlDelegate;

@property (nonatomic) BOOL enableStickyHeaders; //Defalut is NO, set it's YES will sticky the section header.

@end
