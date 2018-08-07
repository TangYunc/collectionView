//
//  NewMainSectionHeaderView.m
//  WarmHomeGZ
//
//  Created by tangyunchuan on 2018/8/1.
//

#import "NewMainSectionHeaderView.h"

@implementation NewMainSectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setUpSubviews];
    }
    return self;
}

- (void)setUpSubviews{
    
    //1.占位线
    _lineView = [[UIView alloc] initWithFrame:CGRectZero];
    _lineView.backgroundColor = [UIColor colorWithHexString:@"#31B3EF"];
    [self addSubview:_lineView];
    //2.占位标题
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.textColor = [UIColor colorWithHexString:@"#31B3EF"];
    _titleLabel.font = [UIFont systemFontOfSize:16.f];
    [self addSubview:_titleLabel];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat gapWidth = 18/2.0 * KWidth_ScaleW;
    //1.
    CGFloat lineViewGapFromLeft = (11 + 18)/2.0 * KWidth_ScaleW;
    CGFloat lineViewWidth = 3 * KWidth_ScaleW;
    CGFloat lineViewHeight = 45/2.0 * KWidth_ScaleH;
    CGFloat lineViewGapFromTop = (self.frame.size.height - lineViewHeight) / 2.0;
    _lineView.frame = CGRectMake(lineViewGapFromLeft, lineViewGapFromTop, lineViewWidth, lineViewHeight);
    //2.
    CGFloat titleLabelHeight = lineViewHeight;
    CGSize titleLblWidthSize = [_titleLabel sizeThatFits:CGSizeMake(MAXFLOAT,titleLabelHeight)];
    _titleLabel.frame = CGRectMake(_lineView.right + gapWidth,0, titleLblWidthSize.width, titleLabelHeight);
    _titleLabel.text = @"我的应用";
    [_titleLabel sizeToFit];
    _titleLabel.centerY = self.frame.size.height / 2.0;
    
    _titleLabel.text = self.title;
}
@end
