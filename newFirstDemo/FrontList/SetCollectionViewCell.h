//
//  SetCollectionViewCell.h
//  SingleModel
//
//  Created by Long on 2018/1/2.
//  Copyright © 2018年 zgjzd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) UIImageView *thumbnailImageView;
@property (strong, nonatomic) UILabel *infoLabel;

@property (copy, nonatomic) NSString *infoStr;
@property (copy, nonatomic) NSString *thumbnailImageStr;
@end
