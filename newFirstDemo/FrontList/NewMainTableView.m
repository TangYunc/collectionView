//
//  NewMainTableView.m
//  WarmHomeGZ
//
//  Created by tangyunchuan on 2018/8/1.
//

#import "NewMainTableView.h"
#import "NewMainCell.h"
#import "NewMainSectionHeaderView.h"
#import "FilterConditionModel.h"

@interface NewMainTableView ()<UITableViewDelegate,UITableViewDataSource,NewMainCellDelegate,UIScrollViewDelegate>

@end

@implementation NewMainTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.backgroundColor = UIColorFromRGBA(245, 245, 245, 1.0);
        
    }
    return self;
}


#pragma mark -- UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dataDic.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"CellId";
    NewMainCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[NewMainCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.delegate = self;
    NSArray *arr = [FilterConditionModel getNeedSignStrFrom:self.dataDic isGetKey:NO];
    cell.dataArr = arr[indexPath.section];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return KHFloat(40);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (self.dataDic.count == 0) {
        return nil;
    }else{
        
        UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(KWFloat(15), 0, ScreenWidth - 2 * KWFloat(15), KHFloat(40))];
        titleView.backgroundColor = [UIColor colorWithHexString:@"#F5F5F5"];
        NewMainSectionHeaderView *sectionHeaderView = [[NewMainSectionHeaderView alloc] initWithFrame:titleView.frame];
        NSArray *arr = [FilterConditionModel getNeedSignStrFrom:self.dataDic isGetKey:YES];
        sectionHeaderView.title = arr[section];
        [titleView addSubview:sectionHeaderView];
        sectionHeaderView.layer.cornerRadius = 5;
        sectionHeaderView.clipsToBounds = YES;
        return titleView;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *arr = [FilterConditionModel getNeedSignStrFrom:self.dataDic isGetKey:NO];
    NSArray *subViews = arr[indexPath.section];
    NSInteger lineNum = (subViews.count % 4 == 0 ? subViews.count / 4 : (subViews.count / 4 + 1));
    CGFloat cellHeight = lineNum * 123;
    
    NSLog(@"第%ld组- 有%ld行--有%lu个子视图----%f",(long)indexPath.section, (long)lineNum, (unsigned long)subViews.count, cellHeight);
    return cellHeight  + KHFloat(15);
}

#pragma mark --
-(void)antiDrugInteractionColumn:(NSString *)column{
    
    if (self.theNewMainDelegate && [self.theNewMainDelegate respondsToSelector:@selector(antiDrugInteractionColumn:)]) {
        [self.theNewMainDelegate antiDrugInteractionColumn:column];
    }
}

#pragma mark - scrollView滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (self.theNewMainDelegate && [self.theNewMainDelegate respondsToSelector:@selector(getCurrentScrollView:)]) {
        [self.theNewMainDelegate getCurrentScrollView:scrollView];
    }
}

@end
