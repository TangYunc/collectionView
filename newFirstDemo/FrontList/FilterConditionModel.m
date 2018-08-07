//
//  FilterConditionModel.m
//  WarmHomeGZ
//
//  Created by tangyunchuan on 2018/7/20.
//

#import "FilterConditionModel.h"

@implementation FilterConditionModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)setFromWhere:(NSString *)fromWhere{
    if (_fromWhere != fromWhere) {
        _fromWhere = fromWhere;
        
        if ([_fromWhere isEqualToString:@"HairDetHistoryListController"]) {
            //来自毛发检测
            self.statusTypeDic = @{@"0": @"已送检",
                                   @"1": @"已签收",
                                   @"2": @"阴性",
                                   @"3": @"阳性"
                                   };
            self.filterDic = @{@"1": @{@"检测状态": @"请选择检测状态"},
                               @"2": @{@"身份证号": @"请输入身份证号码"},
                               @"3": @{@"姓名": @"请输入姓名"},
                               @"4": @{@"开始时间": @"请选择开始时间"},
                               @"5": @{@"结束时间": @"请选择结束时间"}};
            self.isMultStatusToChoice = NO;
            self.statusTypeStr = @"type";
        } else if ([_fromWhere isEqualToString:@"AlloHistoryListController"]) {
            //来自异地尿检
            self.statusTypeDic = @{@"0": @"审核中",
                                   @"1": @"审核通过",
                                   @"2": @"审核拒绝"};
            self.filterDic = @{@"1": @{@"检测状态": @"请选择检测状态"},
                               @"2": @{@"身份证号": @"请输入身份证号码"},
                               @"3": @{@"姓名": @"请输入姓名"},
                               @"4": @{@"开始时间": @"请选择开始时间"},
                               @"5": @{@"结束时间": @"请选择结束时间"}};
            self.isMultStatusToChoice = NO;
            self.statusTypeStr = @"statusType";
        }else if ([_fromWhere isEqualToString:@"TaskAllController"] || [_fromWhere isEqualToString:@"TaskListController"]) {
            //来自出所链接
            self.statusTypeDic = nil;
            self.filterDic = @{@"1": @{@"身份证号": @"请输入身份证号码"},
                               @"2": @{@"姓名": @"请输入姓名"},
                               @"3": @{@"开始时间": @"请选择开始时间"},
                               @"4": @{@"结束时间": @"请选择结束时间"}};
            self.isMultStatusToChoice = NO;
            self.statusTypeStr = @"";
        }else if ([_fromWhere isEqualToString:@"PushHistoryListController"]){
            //来自消息推送提醒历史
            /*
            self.statusTypeDic = @{@"0": @{@"100004": @"社区戒毒报到登记"},
                                   @"1": @{@"100005": @"社区戒毒逾期未报到"},
                                   @"2": @{@"100006": @"社区戒毒定期检测"},
                                   @"3": @{@"100008": @"社区康复报到登记"},
                                   @"4": @{@"100009": @"社区康复逾期未报到"},
                                   @"5": @{@"100010": @"社区康复定期检测"},
                                   @"6": @{@"110001": @"社区戒毒严重违反协议"},
                                   @"7": @{@"110002": @"社区康复严重违反协议"},
                                   @"8": @{@"110003": @"社戒社康脱失逃跑"},
                                   @"9": @{@"110004": @"管控工作记录"},
                                   @"10": @{@"130001": @"强制隔离戒毒出所"},
                                   @"11": @{@"130002": @"强制隔离戒毒所所外就医"},
                                   @"12": @{@"140001": @"人员核查"},
                                   @"13": @{@"140002": @"毛发检测"},
                                   @"14": @{@"140004": @"社区戒毒社区康复工作统计"},
                                   @"15": @{@"140005": @"吸毒人员管控情况统计"},
                                   @"16": @{@"140006": @"清零工作统计"},
                                   @"17": @{@"150001": @"查获人员统计"},
                                   @"18": @{@"150002": @"脱失人员统计"},
                                   @"19": @{@"150003": @"报道提醒统计"},
                                   @"20": @{@"150004": @"尿检提醒统计"},
                                   @"21": @{@"150005": @"分级分类统计"},
                                   @"22": @{@"150006": @"入格提醒统计"},
                                   @"23": @{@"150007": @"出所提醒统计"},
                                   @"24": @{@"160001": @"警综系统法律文书（社区戒毒）"},
                                   @"25": @{@"160002": @"警综系统法律文书（社区康复）"},
                                   @"26": @{@"170001": @"工作提醒"}
                                   };*/
            self.statusTypeDic = @{@"100004": @"社区戒毒报到登记",
                                   @"100005": @"社区戒毒逾期未报到",
                                   @"100006": @"社区戒毒定期检测",
                                   @"100008": @"社区康复报到登记",
                                   @"100009": @"社区康复逾期未报到",
                                   @"100010": @"社区康复定期检测",
                                   @"110001": @"社区戒毒严重违反协议",
                                   @"110002": @"社区康复严重违反协议",
                                   @"110003": @"社戒社康脱失逃跑",
                                   @"110004": @"管控工作记录",
                                   @"130001": @"强制隔离戒毒出所",
                                   @"130002": @"强制隔离戒毒所所外就医",
                                   @"140001": @"人员核查",
                                   @"140002": @"毛发检测",
                                   @"140004": @"社区戒毒社区康复工作统计",
                                   @"140005": @"吸毒人员管控情况统计",
                                   @"140006": @"清零工作统计",
                                   @"150001": @"查获人员统计",
                                   @"150002": @"脱失人员统计",
                                   @"150003": @"报道提醒统计",
                                   @"150004": @"尿检提醒统计",
                                   @"150005": @"分级分类统计",
                                   @"150006": @"入格提醒统计",
                                   @"150007": @"出所提醒统计",
                                   @"160001": @"警综系统法律文书（社区戒毒）",
                                   @"160002": @"警综系统法律文书（社区康复）",
                                   @"170001": @"工作提醒"
                                   };
            self.filterDic = @{@"1": @{@"消息类型": @"请选择消息类型"},
                               @"2": @{@"开始时间": @"请选择开始时间"},
                               @"3": @{@"结束时间": @"请选择结束时间"}};
            self.isMultStatusToChoice = YES;
            self.statusTypeStr = @"notificationType";
        }
    }
}

+ (instancetype)shareFilterCondition
{
    static FilterConditionModel *model = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        model = [[FilterConditionModel alloc] init];
    });
    return model;
}

- (void)reSetDatas{
    self.fromWhere = nil;
//    self.statusTypeStr = nil;
    self.isMultStatusToChoice = nil;
    self.targetId = nil;
    self.targetName = nil;
    self.startDate = nil;
    self.statusType = nil;
    self.endDate = nil;
}

/**
 遍历字典顺序获取key和value值的数组
 
 @param obj 要遍历的字典
 @param isGetKey 获取的数组是否是key值,YES为key,NO 为value
 @return 返回获取的数组
 */
+ (NSArray *)getNeedSignStrFrom:(id)obj isGetKey:(BOOL)isGetKey{
    NSDictionary *dict = obj;
    NSArray *keysArray = [dict allKeys];//获取所有键存到数组
    NSArray *sortedArray = [keysArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2 options:NSNumericSearch];//由于allKeys返回的是无序数组，这里我们要排列它们的顺序
    }];
    NSMutableArray *mArr = [NSMutableArray array];
    for (NSString *key in sortedArray) {
        NSDictionary *valueDic = [dict objectForKey: key];
        if (isGetKey) {
            //获取key
            for (NSString *tempStr in valueDic.allKeys) {
                [mArr addObject:tempStr];
            }
        }else{
            //获取value
            for (NSString *tempStr in valueDic.allValues) {
                [mArr addObject:tempStr];
            }
        }
        
    }//遍历整理后的数组，通过objectForKey来获取相应的Value值
    return [mArr copy];
}
//时间转字符串
+ (NSString *)getDateStr:(NSDate *)date{
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式：zzz表示时区
    [dateFormatter setDateFormat:@"yyyy年/MM月d日EEE"];
    //NSDate转NSString
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}

//字符串转时间戳
+ (NSString *)getTimeInterval:(NSString *)timeStr{
    NSString *tempStr = [NSString stringWithFormat:@"%@ %@", timeStr, @"08:00:00"];
    //设置转换格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
    //NSString转NSDate
    NSDate *date = [formatter dateFromString:tempStr];
    
    NSTimeInterval time = [date timeIntervalSince1970] * 1000;// *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeSp = [NSString stringWithFormat:@"%.0f", time];
    
    return timeSp;
}

//时间戳转字符串
+ (NSString *)time_timestampToString:(NSInteger)timestamp{
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    
    [dateFormat setDateFormat:@"yyyy年MM月dd日"];
    
    NSString* string=[dateFormat stringFromDate:confromTimesp];
    
    return string;
    
}
//日期大小的比较
+ (int)compareDate:(NSString*)date01 withDate:(NSString*)date02{
    int ci;
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *dt1 = [[NSDate alloc] init];
    NSDate *dt2 = [[NSDate alloc] init];
    dt1 = [df dateFromString:date01];
    dt2 = [df dateFromString:date02];
    NSComparisonResult result = [dt1 compare:dt2];
    switch (result)
    {
            //date02比date01大
        case NSOrderedAscending: ci=1; break;
            //date02比date01小
        case NSOrderedDescending: ci=-1; break;
            //date02=date01
        case NSOrderedSame: ci=0; break;
        default: NSLog(@"erorr dates %@, %@", dt2, dt1); break;
    }
    return ci;
}
@end

