//
//  NewMainCollectionView.m
//  WarmHomeGZ
//
//  Created by tangyunchuan on 2018/8/6.
//

#import "NewMainCollectionView.h"
#import "SetCollectionViewCell.h"
#import "FilterConditionModel.h"
#import "NewMainSectionHeaderView.h"
#import "NewMainHeaderCollectionViewCell.h"

static NSString *const cellHeaderId = @"cellHeaderId";
static NSString *const cellId = @"cellId";
static NSString *const headerId = @"headerId";
static NSString *const footerId = @"footerId";

@interface NewMainCollectionView ()

@property (assign, nonatomic)int heights;

@end

@implementation NewMainCollectionView

- (id) initWithFrame:(CGRect)frame {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(70, frame.size.height);
    flowLayout.minimumLineSpacing = 1.f;
    flowLayout.minimumInteritemSpacing = 1.f;
    flowLayout.headerReferenceSize = CGSizeMake(self.frame.size.width, 2);
    flowLayout.footerReferenceSize = CGSizeMake(self.frame.size.width, 2);
    flowLayout.itemSize = CGSizeMake((self.frame.size.width-3.0)/4, 123);
    flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
    self=[super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self) {
        self.backgroundColor = [UIColor cyanColor];
        self.dataSource=self;
        self.delegate=self;
        [self registerClass:[NewMainHeaderCollectionViewCell class] forCellWithReuseIdentifier:cellHeaderId];
        [self registerClass:[SetCollectionViewCell class] forCellWithReuseIdentifier:cellId];
        [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerId];
        [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerId];
        self.heights = iPhoneX? 120:49;
    
    }
    return self;
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataDic.count + 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    NSArray *arr = [FilterConditionModel getNeedSignStrFrom:self.dataDic isGetKey:NO];
    NSArray *tempArr = arr[section-1];
    return tempArr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        NewMainHeaderCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellHeaderId forIndexPath:indexPath];
        cell.backgroundColor = [UIColor redColor];
        
        cell.sliderDataDic = self.sliderDataDic;
        [cell setNeedsLayout];
        return cell;
    }
    SetCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    
    NSArray *arr = [FilterConditionModel getNeedSignStrFrom:self.dataDic isGetKey:NO];
    NSArray *tempArr = arr[indexPath.section-1];
    cell.infoStr = [tempArr objectAtIndex:indexPath.row];
    cell.thumbnailImageStr = tempArr[indexPath.row];
    [cell setNeedsLayout];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath;
{
    
    if ( [kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerId forIndexPath:indexPath];
        if (headerView == nil) {
            headerView = [[UICollectionReusableView alloc]init];
        }
        
        NewMainSectionHeaderView *sectionHeaderView = [[NewMainSectionHeaderView alloc] initWithFrame:CGRectMake(KWFloat(15), 0, ScreenWidth - 2 * KWFloat(15), KHFloat(40))];
        NSArray *arr = [FilterConditionModel getNeedSignStrFrom:self.dataDic isGetKey:YES];
        sectionHeaderView.title = arr[indexPath.section - 1];
        sectionHeaderView.layer.cornerRadius = 5;
        sectionHeaderView.clipsToBounds = YES;
        [headerView addSubview:sectionHeaderView];
            
        return headerView;
    }else if([kind isEqualToString:UICollectionElementKindSectionFooter]){
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footerId forIndexPath:indexPath];
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

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0){
        
        return CGSizeMake(ScreenWidth, ScreenHeight - NAVIGATION_BAR_HEIGHT -self.heights - ScreenWidth);
    }
    return CGSizeMake((self.frame.size.width-3.0-KWFloat(15)*2)/4, 123);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, KWFloat(15), 0, KWFloat(15));
}

//设置页头高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section == 0){
        
        return CGSizeMake(0, 0);
    }
    return CGSizeMake(ScreenWidth - 2 * KWFloat(15), KHFloat(40));
}
#pragma mark ViewDelegate

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section != 0) {
        
        NSArray *arr = [FilterConditionModel getNeedSignStrFrom:self.dataDic isGetKey:NO];
        NSArray *tempArr = arr[indexPath.section-1];
        if (self.theNewMainDelegate && [self.theNewMainDelegate respondsToSelector:@selector(getDataInteraction:)]) {
            [self.theNewMainDelegate getDataInteraction:[tempArr objectAtIndex:indexPath.row]];
        }
    }
}
@end
