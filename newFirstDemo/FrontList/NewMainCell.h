//
//  NewMainCell.h
//  WarmHomeGZ
//
//  Created by tangyunchuan on 2018/8/1.
//

#import <UIKit/UIKit.h>

@class NewMainCellDelegate;

@protocol NewMainCellDelegate <NSObject>

@optional
-(void)antiDrugInteractionColumn:(NSString *)column;

@end

@interface NewMainCell : UITableViewCell

@property (nonatomic, weak) id <NewMainCellDelegate> delegate;
@property (nonatomic, strong) NSArray *dataArr;
@end
