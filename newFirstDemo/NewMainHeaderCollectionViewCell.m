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
@property (assign, nonatomic)int heights;

@end

@implementation NewMainHeaderCollectionViewCell
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage: [UIImage imageNamed:@"placeholder"]];
        _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        self.heights = iPhoneX? 120:49;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _cycleScrollView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight - NAVIGATION_BAR_HEIGHT -self.heights - ScreenWidth);
}
@end
