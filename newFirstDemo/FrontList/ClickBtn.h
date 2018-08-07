//
//  ClickBtn.h
//  SingleModel
//
//  Created by Long on 2017/12/25.
//  Copyright © 2017年 zgjzd. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol clickCodeDelegate <NSObject>

@optional
-(void)proxyflowUnification:(int)code;

@end

@interface ClickBtn : UIView

@property (nonatomic,strong) id <clickCodeDelegate> delegate;

@property (nonatomic,strong) NSArray *titlesArray;
-(id)initWithCodeList:(NSArray *)arr drawRect:(CGRect)frame;

-(void)setupthePlan:(int)page;

@end
