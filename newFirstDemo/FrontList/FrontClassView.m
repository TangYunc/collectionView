//
//  FrontClassView.m
//  SingleModel
//
//  Created by Long on 2017/12/25.
//  Copyright © 2017年 zgjzd. All rights reserved.
//

#import "FrontClassView.h"
#import "ClickBtn.h"
#import "LayoutHeadView.h"
@interface FrontClassView ()<UIScrollViewDelegate,clickCodeDelegate,LayoutHeadViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollClass;
@property (nonatomic, strong) ClickBtn *clickView;
@property (nonatomic, strong) NSMutableDictionary *contentNary;
@end

@implementation FrontClassView


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

-(id)initWithCustomthefirstLevelNavigationSectionofthehomePage:(int)page setFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self loadingMainViewSection:page];
    return self;
}

-(id)initWithCustomthefirstLevelNavigationSectionofthehomeDiction:(NSMutableDictionary *)keynary setFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    _contentNary = [NSMutableDictionary dictionary];
    _contentNary = keynary;
    [self loadingMainViewSection:(int)keynary.count];
    return self;
}

-(void)loadingMainViewSection:(int)page
{
    _clickView = [[ClickBtn alloc]initWithCodeList:[_contentNary allKeys] drawRect:CGRectMake(0, 0, self.frame.size.width, 70)];
    _clickView.delegate = self;
    [self addSubview:_clickView];
    
    _scrollClass = [[UIScrollView alloc]initWithFrame:CGRectMake(self.frame.origin.x, 70, self.frame.size.width, self.frame.size.height-70)];
    _scrollClass.backgroundColor = [UIColor grayColor];
    _scrollClass.delegate = self;
    [self addSubview:_scrollClass];
    _scrollClass.showsVerticalScrollIndicator = NO;
    _scrollClass.showsHorizontalScrollIndicator = NO;
    _scrollClass.bounces = NO;
    _scrollClass.pagingEnabled = YES;
    _scrollClass.directionalLockEnabled = YES;
    _scrollClass.contentSize = CGSizeMake(self.frame.size.width*page, self.frame.size.height-70);
        
    for (int a = 0; a < page; a ++) {
        LayoutHeadView *headView = [[LayoutHeadView alloc]initWithFrame:CGRectMake(self.frame.origin.x + a*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height-70)];
        headView.delegate = self;
//        [headView starItemArray:[_contentNary objectForKey:[_contentNary allKeys][a]]];
        headView.backgroundColor = UIColor.whiteColor;
        headView.userInteractionEnabled = YES;
        [_scrollClass addSubview:headView];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWith = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWith/2)/pageWith)+1;
    [_clickView setupthePlan:page];
}

-(void)proxyflowUnification:(int)code
{
    [_scrollClass setContentOffset:CGPointMake(code*self.frame.size.width, 0) animated:NO];
}

-(void)getDataInteraction:(NSString *)infos
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(antiDrugInteractionColumn:)]) {
        [self.delegate antiDrugInteractionColumn:infos];
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
