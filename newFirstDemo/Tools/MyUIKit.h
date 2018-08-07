//
//  HFUIKit.h
//  ICanDoThis
//
//  Created by THF on 16/8/19.
//  Copyright © 2016年 thf. All rights reserved.
//


#pragma mark -
#pragma mark Base URL
#if DEBUG
//#define BASE_URL @"https://192.168.1.89:46888"//明朝测试 (本地内网环境)
#define BASE_URL @"https://101.254.233.218:8448"//明朝测试（外网环境）
//#define BASE_URL @"https://unis-ct.3322.org:46888"//南京测试
#else
#define BASE_URL @"https://113.108.173.202:46888"//正式
#endif


#define PGY_APPID @"e5d09c2323c3ef8ef6a1efac239e041c"

#pragma mark -
#pragma mark  用户配置相关的key

//个人信息
#define USERMODEL @"userModel"
#define USERAVATAR  @"userAvatar"

//手机信息
#define LATITUDE  @"latitude"
#define LONGITUDE @"longitude"
#define ADDRESS @"address"
#define USERID @"userId"
#define MODEL @"model"
#define BRAND @"brand"
#define DEVICEID @"deviceId"
#define MAC @"mac"

#define DATATYPEAPPLIICATION @"我的应用"
#define DATATYPEMANAGEMENT @"数据管理"
#define DATATYPEDRUGRESOURCES @"禁毒资源"

//上传照片
#define UploadUrl(ServerIP) [NSString stringWithFormat:@"http://%@:8081/guardsysweb/file/upload/", ServerIP]

#define GZ_DB @"GZDataBase"  //数据库名
#define TABLE_RECORDER @"tbl_recorder" //表名

//表名
#define t_schedule @"t_schedule"   //日程表
#define t_digestmd5 @"t_digestmd5" //MD5摘要表


//通知
#define kReceivePush       @"kReceivePush"
#define kWeatherLogin     @"kWeatherLogin"
#define kHideBottomBar   @"kHideBottomBar"
#define kDidLogin            @"kDidLogin"       
#define kMessageRefresh  @"kMessageRefresh"
#define kChangeSelectItem @"kChangeSelectItem"

#pragma mark -
#pragma mark - 判断版本

// 判断是否是iPhone X
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// 状态栏高度
#define STATUS_BAR_HEIGHT (iPhoneX ? 44.f : 20.f)
// 导航栏高度
#define NAVIGATION_BAR_HEIGHT (iPhoneX ? 88.f : 64.f)
// tabBar高度
#define TAB_BAR_HEIGHT (iPhoneX ? (49.f+34.f) : 49.f)
// home indicator
#define HOME_INDICATOR_HEIGHT (iPhoneX ? 34.f : 0.f)

#define VERSION_BRAND ([[UIDevice currentDevice] model])   //iphone

#define VERSION ([[UIDevice currentDevice] systemVersion])   //10.1

#define VERSION_NAME  ([[UIDevice currentDevice] systemName]) //iOS

#define VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#define TLog(_var) ({ NSString *name = @#_var; NSLog(@"%@: %@ -> %p : %@  %d", name, [_var class], _var, _var, (int)[_var retainCount]); })


#pragma mark -
#pragma mark - 颜色和字体
#define  random(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define randomColor random(arc4random_uniform(240),arc4random_uniform(240),arc4random_uniform(240))

#define UIColorFromHexWithAlpha(hexValue,a) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:a]
#define UIColorFromHex(hexValue) UIColorFromHexWithAlpha(hexValue,1.0)
#define UIColorFromRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define UIColorFromRGB(r,g,b) UIColorFromRGBA(r,g,b,1.0)

#define font(s) [UIFont systemFontOfSize:s+1]

#define font_bold(s) [UIFont boldSystemFontOfSize:s+1]

#pragma mark -
#pragma mark weakSelf
/**
 Synthsize a weak or strong reference.
 
 Example:
 @weakify(self)
 [self doSomething^{
 @strongify(self)
 if (!self) return;
 ...
 }];
 
 */
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

#pragma mark -
#pragma mark Frame Geometry

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define WIDTH(view) view.frame.size.width
#define HEIGHT(view) view.frame.size.height
#define LEFT(view) view.frame.origin.x
#define TOP(view) view.frame.origin.y
#define BOTTOM(view) (view.frame.origin.y + view.frame.size.height)
#define RIGHT(view) (view.frame.origin.x + view.frame.size.width)

//屏幕比例
#define KWidth_ScaleW ScreenWidth/375.0f
#define KWidth_ScaleH ScreenHeight/667.0f

#define KWFloat(a) a * KWidth_ScaleW
#define KHFloat(a) a * KWidth_ScaleH
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self
#pragma mark - 
#pragma mark Runtime set Property

#ifndef YYSYNTH_DYNAMIC_PROPERTY_OBJECT
#define YYSYNTH_DYNAMIC_PROPERTY_OBJECT(_getter_, _setter_, _association_, _type_) \
- (void)_setter_ : (_type_)object { \
[self willChangeValueForKey:@#_getter_]; \
objc_setAssociatedObject(self, _cmd, object, OBJC_ASSOCIATION_ ## _association_); \
[self didChangeValueForKey:@#_getter_]; \
} \
- (_type_)_getter_ { \
return objc_getAssociatedObject(self, @selector(_setter_:)); \
}
#endif









#pragma mark -
#pragma mark 来自SDWebImage

#define dispatch_main_sync_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_sync(dispatch_get_main_queue(), block);\
}

#define dispatch_main_async_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}


#pragma mark -
#pragma mark 获取图片路径
#define HFAppImageFile(url) [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:[url lastPathComponent]]



#define k_gray_127 UIColorFromRGBA(127, 127, 127, 1)
#define k_gray_200 UIColorFromRGBA(200, 200, 200, 1)

#define k_white_242 UIColorFromRGBA(242, 242, 242, 1)
#define k_white_255 UIColorFromRGBA(255, 255, 255, 1)
#define k_white_252 UIColorFromRGBA(252, 252, 252, 1)

#define k_black_0       UIColorFromRGBA(0, 0, 0, 1)
#define k_black_51      UIColorFromRGBA(51, 51, 51, 1)

#define k_black_0_trans60 UIColorFromRGBA(0, 0, 0, 0.6)

#define k_red_255 UIColorFromRGBA(255, 0, 0, 1)
#define k_blue_229 UIColorFromRGBA(48, 169, 229, 1)
#define k_green_ UIColorFromRGBA(0, 255, 0, 1)

