//
//  FilterConditionModel.h
//  WarmHomeGZ
//
//  Created by tangyunchuan on 2018/7/20.
//

#import <Foundation/Foundation.h>

@interface FilterConditionModel : NSObject

@property (nonatomic, copy) NSString *fromWhere;//判断是从哪个模块跳转过来的
@property (nonatomic, strong) NSDictionary *statusTypeDic;//检测状态字典
@property (nonatomic, strong) NSDictionary *filterDic;//筛选字典
@property (nonatomic, assign) BOOL isMultStatusToChoice;//是否有多个（五个以上）状态值需要选择
@property (nonatomic, copy) NSString *statusTypeStr;//筛选状态参数类型
    
@property (nonatomic, copy) NSString *userId;

@property (nonatomic, copy) NSString *currentPage;//当前页码（从0开始为第一页）
@property (nonatomic, copy) NSString *itemsPerPage;//每页件数

@property (nonatomic, copy) NSString *targetId;//身份证号码

@property (nonatomic, copy) NSString *targetName;//姓名

@property (nonatomic, copy) NSString *statusType;//检测状态：0审核中，1审核通过，2审核拒绝

@property (nonatomic, copy) NSString *startDate;//开始时间

@property (nonatomic, copy) NSString *endDate;//结束时间

+ (instancetype)shareFilterCondition;

- (void)reSetDatas;

/**
 遍历字典顺序获取key和value值的数组
 
 @param obj 要遍历的字典
 @param isGetKey 获取的数组是否是key值,YES为key,NO 为value
 @return 返回获取的数组
 */
+ (NSArray *)getNeedSignStrFrom:(id)obj isGetKey:(BOOL)isGetKey;
//时间转字符串
+ (NSString *)getDateStr:(NSDate *)date;
//字符串转时间戳
+ (NSString *)getTimeInterval:(NSString *)timeStr;
//时间戳转字符串
+ (NSString *)time_timestampToString:(NSInteger)timestamp;
//日期大小的比较
+ (int)compareDate:(NSString*)date01 withDate:(NSString*)date02;
@end

