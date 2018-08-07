//
//  FrontClassView.h
//  SingleModel
//
//  Created by Long on 2017/12/25.
//  Copyright © 2017年 zgjzd. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FrontClassViewDelegate <NSObject>
@optional
-(void)antiDrugInteractionColumn:(NSString *)column;

@end
@interface FrontClassView : UIView
@property (nonatomic, strong) id <FrontClassViewDelegate>delegate;
-(id)initWithCustomthefirstLevelNavigationSectionofthehomePage:(int)page setFrame:(CGRect)frame;

-(id)initWithCustomthefirstLevelNavigationSectionofthehomeDiction:(NSMutableDictionary *)keynary setFrame:(CGRect)frame;

@end
