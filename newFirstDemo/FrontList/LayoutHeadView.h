//
//  LayoutHeadView.h
//  SingleModel
//
//  Created by Long on 2017/12/26.
//  Copyright © 2017年 zgjzd. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LayoutHeadViewDelegate <NSObject>
@optional
-(void)getDataInteraction:(NSString *)infos;

@end

@interface LayoutHeadView : UIView
@property (nonatomic, strong) id <LayoutHeadViewDelegate> delegate;
-(void)starItemArray:(NSArray *)array;
@property (nonatomic, strong) NSArray *arrayList;
@end
