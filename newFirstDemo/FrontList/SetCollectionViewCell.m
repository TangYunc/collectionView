//
//  SetCollectionViewCell.m
//  SingleModel
//
//  Created by Long on 2018/1/2.
//  Copyright © 2018年 zgjzd. All rights reserved.
//

#import "SetCollectionViewCell.h"

@implementation SetCollectionViewCell

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _thumbnailImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _thumbnailImageView.backgroundColor = [UIColor clearColor];
        [self addSubview:_thumbnailImageView];

        _infoLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _infoLabel.textColor = [UIColor blackColor];
        _infoLabel.textAlignment = NSTextAlignmentCenter;
        _infoLabel.numberOfLines = 1;
        [self addSubview:_infoLabel];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _thumbnailImageView.frame = CGRectMake(self.frame.size.width/3, KHFloat(20), 45, 45);
    _thumbnailImageView.image = [UIImage imageNamed:self.thumbnailImageStr];
    _infoLabel.frame = CGRectMake(0, _thumbnailImageView.bottom + KHFloat(5), self.frame.size.width, 30);
    _infoLabel.text = self.infoStr;
    [_thumbnailImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.bottom.mas_equalTo(_infoLabel.mas_top).offset(-5);
        make.width.height.mas_equalTo(self.mas_width).multipliedBy(0.4);
    }];
}
@end
