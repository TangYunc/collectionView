//
//  LayoutHeadView.m
//  SingleModel
//
//  Created by Long on 2017/12/26.
//  Copyright © 2017年 zgjzd. All rights reserved.
//

#import "LayoutHeadView.h"
#import "SetCollectionViewCell.h"

#define cellWidth self.frame.size.width/3
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
static NSString *const cellId = @"cellId";
static NSString *const headerId = @"headerId";
static NSString *const footerId = @"footerId";

@interface LayoutHeadView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@property (nonatomic, strong) UICollectionViewFlowLayout *customLayout;
@property (nonatomic, strong) UICollectionView *collectionsView;

@end

@implementation LayoutHeadView

-(id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _arrayList = [NSArray array];

    }
    return self;
}

-(void)starItemArray:(NSArray *)array
{
    self.arrayList = array;
    [self loadingHostView];
}

- (void)setArrayList:(NSArray *)arrayList{
    if (_arrayList != arrayList) {
        _arrayList = arrayList;
        
        [self loadingHostView];
        
    }
}
-(id)initWithCustomFrame:(CGRect)frame itemArray:(NSMutableArray *)array
{
    self = [super initWithFrame:frame];
    _arrayList = array;
    [self loadingHostView];
    return self;
}

-(void)loadingHostView
{
//    if (_customLayout) {
//        return;
//    }
    _customLayout = [[UICollectionViewFlowLayout alloc]init];
    _customLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _customLayout.minimumLineSpacing = 1.f;
    _customLayout.minimumInteritemSpacing = 1.f;
    _customLayout.headerReferenceSize = CGSizeMake(self.frame.size.width, 2);
    _customLayout.footerReferenceSize = CGSizeMake(self.frame.size.width, 2);
    _customLayout.itemSize = CGSizeMake((self.frame.size.width-3.0)/4, 123);
    _collectionsView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:_customLayout];
    _collectionsView.backgroundColor = [UIColor colorWithRed:239/255.f green:239/255.f blue:239/255.f alpha:1.f];
    _collectionsView.dataSource = self;
    _collectionsView.delegate = self;
    [self addSubview:_collectionsView];
    [_collectionsView registerClass:[SetCollectionViewCell class] forCellWithReuseIdentifier:cellId];
    [_collectionsView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerId];
    [_collectionsView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerId];
    _collectionsView.scrollEnabled = NO;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _arrayList.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
//    SetCollectionViewCell *cell = [_collectionsView ]
    SetCollectionViewCell *cell = [_collectionsView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.infoStr = [_arrayList objectAtIndex:indexPath.row];
    cell.thumbnailImageStr = _arrayList[indexPath.row];
//    [cell setNeedsLayout];

    return cell;
}

-(UICollectionReusableView *)collectionVIew:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ( [kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *headerView = [_collectionsView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerId forIndexPath:indexPath];
        if (headerView == nil) {
            headerView = [[UICollectionReusableView alloc]init];
        }
        headerView.backgroundColor = [UIColor grayColor];
        return headerView;
    }else if([kind isEqualToString:UICollectionElementKindSectionFooter]){
        UICollectionReusableView *footerView = [_collectionsView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footerId forIndexPath:indexPath];
        if (footerView == nil) {
            footerView = [[UICollectionReusableView alloc]init];
        }
        footerView.backgroundColor = [UIColor grayColor];
        return footerView;
    }
    return nil;
}

-(BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark ViewDelegate

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(getDataInteraction:)]) {
        [self.delegate getDataInteraction:[_arrayList objectAtIndex:indexPath.row]];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end











