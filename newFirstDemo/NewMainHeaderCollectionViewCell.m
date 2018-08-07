//
//  NewMainHeaderCollectionViewCell.m
//  newFirstDemo
//
//  Created by tangyunchuan on 2018/8/7.
//  Copyright © 2018年 tangyunchuan. All rights reserved.
//

#import "NewMainHeaderCollectionViewCell.h"
#import "SDCycleScrollView.h"

@interface NewMainHeaderCollectionViewCell ()<SDCycleScrollViewDelegate>

@property (strong, nonatomic)SDCycleScrollView *cycleScrollView;


@end

@implementation NewMainHeaderCollectionViewCell
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:frame delegate:self placeholderImage: [UIImage imageNamed:@"placeholder"]];
        _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        [self.contentView addSubview:_cycleScrollView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _cycleScrollView.frame = self.frame;
    _cycleScrollView.imageURLStringsGroup = self.sliderDataDic[@"imageArray"];
    _cycleScrollView.titlesGroup = self.sliderDataDic[@"titleArray"];;
}
@end
