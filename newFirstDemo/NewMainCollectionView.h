//
//  NewMainCollectionView.h
//  WarmHomeGZ
//
//  Created by tangyunchuan on 2018/8/6.
//

#import <UIKit/UIKit.h>

@protocol NewMainCollectionViewDelegate <NSObject>
@optional
-(void)getDataInteraction:(NSString *)infos;

@end

@interface NewMainCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>

@property (nonatomic, strong) id <NewMainCollectionViewDelegate> theNewMainDelegate;
@property (nonatomic, strong) NSDictionary *sliderDataDic;
@property (nonatomic, strong) NSDictionary *dataDic;

@end
