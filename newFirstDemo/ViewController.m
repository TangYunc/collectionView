//
//  ViewController.m
//  newFirstDemo
//
//  Created by tangyunchuan on 2018/7/16.
//  Copyright © 2018年 tangyunchuan. All rights reserved.
//

#import "ViewController.h"
#import "u.h"
#import "NewMainTableView.h"
#import "SDCycleScrollView.h"
#import "NewMainCollectionView.h"

@interface ViewController ()<SDCycleScrollViewDelegate,TheNewMainTableViewDelegate>
{
    NewMainTableView *_newMainTabelView;
    NewMainCollectionView *_newMainCollectionView;
}
@property (strong, nonatomic)SDCycleScrollView *cycleScrollView;
@property (assign, nonatomic)int heights;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self demo2];
    
    
}
- (void)demo2{
    [self setUpUI];
    [self setData];
}

- (void)setData{
    
    NSMutableDictionary *vauleKeytion = [NSMutableDictionary dictionary];
    [vauleKeytion setObject:[NSDictionary dictionaryWithObject:[NSArray arrayWithObjects:@"消息提醒", @"申请管理", @"申请管理", @"申请管理", @"申请管理", @"申请管理", @"申请管理", @"申请管理", @"申请管理", @"申请管理", @"申请管理", @"申请管理",nil] forKey:@"我的应用"] forKey:@"1"];
    [vauleKeytion setObject:[NSDictionary dictionaryWithObject:[NSArray arrayWithObjects:@"禁毒相关", @"禁毒法规",nil] forKey:@"禁毒支援"] forKey:@"3"];
    [vauleKeytion setObject:[NSDictionary dictionaryWithObject:[NSArray arrayWithObjects:@"管控信息", @"统计表格", @"重点查控" ,@"病残统计", @"出所概况",nil] forKey:@"数据管理"] forKey:@"2"];
    /*
    [vauleKeytion addEntriesFromDictionary:[NSDictionary dictionaryWithObject:[NSArray arrayWithObjects:@"消息提醒", @"申请管理", @"申请管理", @"申请管理", @"申请管理", @"申请管理", @"申请管理", @"申请管理", @"申请管理", @"申请管理", @"申请管理", @"申请管理",nil] forKey:@"我的应用"]];
    [vauleKeytion addEntriesFromDictionary:[NSDictionary dictionaryWithObject:[NSArray arrayWithObjects:@"禁毒相关", @"禁毒法规",nil] forKey:@"禁毒支援"]];
    [vauleKeytion addEntriesFromDictionary:[NSDictionary dictionaryWithObject:[NSArray arrayWithObjects:@"管控信息", @"统计表格", @"重点查控" ,@"病残统计", @"出所概况",nil] forKey:@"数据管理"]];
     */
    /*
    NSDictionary *data = @{@"我的应用":  @[@"消息提醒", @"申请管理", @"申请管理", @"申请管理", @"申请管理", @"申请管理", @"申请管理", @"申请管理", @"申请管理", @"申请管理", @"申请管理", @"申请管理"],
                           @"禁毒支援":  @[@"禁毒相关", @"禁毒法规"],
                           @"数据管理":  @[@"管控信息", @"统计表格", @"重点查控" ,@"病残统计", @"出所概况"]};
     */
    
    NSDictionary *cycleScrollDataDic = @{
                                         @"imageArray": @[@"http://www.nncc626.com/2018-06/06/c_129887579.htm",@"http://toupiao.www.gov.cn/100dudian/index.htm",@"http://www.nncc626.com/2018-05/10/c_129869171.htm",@"http://www.nncc626.com/2018-05/23/c_129879005.htm",@"http://www.nncc626.com/2018-05/30/c_129882973.htm"],
                                         @"titleArray": @[@"第二届中新禁毒合作双边会议在京举行",@"群众办事百项堵点疏解行动",@"第二届中菲禁毒合作双边会在杭州举行",@"大湄公河次区域禁毒合作谅解备忘录签约国会议召开",@"赵克志：坚决打赢新时代禁毒人民战争"],
                                         @"sliderUrlArray": @[@"http://www.nncc626.com/2018-06/06/c_129887579.htm",@"http://toupiao.www.gov.cn/100dudian/index.htm",@"http://www.nncc626.com/2018-05/10/c_129869171.htm",@"http://www.nncc626.com/2018-05/23/c_129879005.htm",@"http://www.nncc626.com/2018-05/30/c_129882973.htm"]};
    _newMainCollectionView.sliderDataDic = cycleScrollDataDic;
    _newMainCollectionView.dataDic = [vauleKeytion copy];
    [_newMainCollectionView reloadData];
//    _newMainTabelView.dataDic = [vauleKeytion copy];
//    [_newMainTabelView reloadData];
}
- (void)setUpUI{
    self.heights = iPhoneX? 120:49;
    //FIXME:适配iPhone X2018/07/24 将64改为NAVIGATION_BAR_HEIGHT
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - NAVIGATION_BAR_HEIGHT -self.heights - ScreenWidth) delegate:self placeholderImage: [UIImage imageNamed:@"placeholder"]];
    _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    
//    _newMainTabelView = [[NewMainTableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - TAB_BAR_HEIGHT) style:UITableViewStylePlain];
//    _newMainTabelView.theNewMainDelegate = self;
//    [self.view addSubview:_newMainTabelView];
//    _newMainTabelView.tableHeaderView = _cycleScrollView;
//    _newMainTabelView.tableFooterView = [[UIView alloc] init];
    
    _newMainCollectionView = [[NewMainCollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - TAB_BAR_HEIGHT)];
    [self.view addSubview:_newMainCollectionView];
    
}
- (void)demo{
    // Do any additional setup after loading the view, typically from a nib.
    //    NSArray *roleArray = [NSArray arrayWithObjects:@"",@"康复人员",@"禁毒办",@"乡镇街道",@"司法部门",@"卫生部门",@"检测机构", @"康复家属",@"",@"",@"网格成员",@"衔接团队",@"巡诊医生",@"未知",@"未知",@"未知",nil];
    //    NSLog(@"%lu",(unsigned long)roleArray.count);
    
    NSDictionary *filterDic = @{@"检测状态": @"请选择检测状态",
                                @"身份证号": @"请输入身份证号码",
                                @"姓名": @"请输入姓名",
                                @"开始时间": @"请选择开始时间",
                                @"结束时间": @"请选择结束时间"};
    
    NSDictionary *filterDic2 = @{@"1": @{@"检测状态": @"请选择检测状态"},
                                 @"2": @{@"身份证号": @"请输入身份证号码"},
                                 @"3": @{@"姓名": @"请输入姓名",},
                                 @"4": @{@"开始时间": @"请选择开始时间"},
                                 @"5": @{@"结束时间": @"请选择结束时间"}};
    NSArray *keyArr = [self getNeedSignStrFrom:filterDic2 isGetKey:YES];
    NSArray *valueArr = [self getNeedSignStrFrom:filterDic2 isGetKey:NO];
    NSLog(@"%@---%@", keyArr, valueArr);
}

/**
 遍历字典顺序获取key和value值的数组

 @param obj 要遍历的字典
 @param isGetKey 获取的数组是否是key值,YES为key,NO 为value
 @return 返回获取的数组
 */
- (NSArray *)getNeedSignStrFrom:(id)obj isGetKey:(BOOL)isGetKey{
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

/*
-(NSString *)getNeedSignStrFrom:(id)obj{
    NSDictionary *dict = obj;
    NSArray *arrPrimary = dict.allKeys;
    
    NSArray *arrKey = [arrPrimary sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
        NSComparisonResult result = [obj1 compare:obj2];
        return result==NSOrderedDescending;//NSOrderedAscending 倒序
    }];
    
    NSString*str =@"";
    
    for (NSString *s in arrKey) {
        id value = dict[s];
        if([value isKindOfClass:[NSDictionary class]]) {
            value = [self getNeedSignStrFrom:value];
        }
        if([str length] !=0) {
            
            str = [str stringByAppendingString:@","];
            
        }
        
        str = [str stringByAppendingFormat:@"%@:%@",s,value];
        
    }
    NSLog(@"str:%@",str);
    
    return str;
}

-(NSString*)stringWithDict:(NSDictionary*)dict{
    
    NSArray*keys = [dict allKeys];
    
    NSArray*sortedArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1,id obj2) {
        return[obj1 compare:obj2 options:NSNumericSearch];//正序
    }];
    
    NSString*str =@"";
    
    for(NSString*categoryId in sortedArray) {
        
        id value = [dict objectForKey:categoryId];
        
        if([value isKindOfClass:[NSDictionary class]]) {
            
            value = [self stringWithDict:value];
            
        }
        
        if([str length] !=0) {
            
            str = [str stringByAppendingString:@","];
            
        }
        
        str = [str stringByAppendingFormat:@"%@:%@",categoryId,value];
        
    }
    NSLog(@"str:%@",str);
    return str;
}

*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
