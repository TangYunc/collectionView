//
//  NewMainCell.m
//  WarmHomeGZ
//
//  Created by tangyunchuan on 2018/8/1.
//

#import "NewMainCell.h"
#import "LayoutHeadView.h"

@interface NewMainCell ()<LayoutHeadViewDelegate>
{
    
    LayoutHeadView *_headView;
    UIView *_gapBottomView;
}

@end

@implementation NewMainCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.backgroundColor = UIColor.clearColor;
        //初始化子视图
        [self setUpSubViews];
//        self.clipsToBounds = YES;
    }
    return self;
}

- (void)setUpSubViews{
    
    _headView = [[LayoutHeadView alloc]initWithFrame:CGRectZero];
    _headView.delegate = self;
    _headView.backgroundColor = UIColor.whiteColor;
    _headView.userInteractionEnabled = YES;
    [self.contentView addSubview:_headView];
    
    _gapBottomView = [[UIView alloc] initWithFrame:CGRectZero];
    _gapBottomView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_gapBottomView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _headView.frame = CGRectMake(KWFloat(15), 0, self.frame.size.width - 2 * KWFloat(15), self.frame.size.height);
    _headView.arrayList = self.dataArr;
//    [_headView starItemArray:self.dataArr];
    _gapBottomView.frame = CGRectMake(0, _headView.bottom, self.frame.size.width, KHFloat(15));
}

#pragma mark - LayoutHeadViewDelegate
-(void)getDataInteraction:(NSString *)infos
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(antiDrugInteractionColumn:)]) {
        [self.delegate antiDrugInteractionColumn:infos];
    }
}
@end
