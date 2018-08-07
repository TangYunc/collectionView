//
//  NewMainTableView.h
//  WarmHomeGZ
//
//  Created by tangyunchuan on 2018/8/1.
//

#import <UIKit/UIKit.h>

@class NewMainTableView;

@protocol TheNewMainTableViewDelegate <NSObject>

@optional
-(void)antiDrugInteractionColumn:(NSString *)column;

- (void)getCurrentScrollView: (UIScrollView *)currentScrollView;

@end

@interface NewMainTableView : UITableView

@property (nonatomic, weak) id <TheNewMainTableViewDelegate> theNewMainDelegate;

@property (nonatomic, strong) NSDictionary *dataDic;
@end
