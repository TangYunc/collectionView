//
//  u.m
//  newFirstDemo
//
//  Created by tangyunchuan on 2018/7/25.
//  Copyright © 2018年 tangyunchuan. All rights reserved.
//

#import "u.h"
#import <objc/runtime.h>

@implementation u
+ (void)sjt_exchangeSelector:(SEL)oldSel andNewSelector:(SEL)newSel {
    Method oldMethod =  class_getInstanceMethod([self class], oldSel);
    Method newMethod  = class_getInstanceMethod([self class], newSel);
    // 改变两个方法的具体指针指向
    method_exchangeImplementations(oldMethod, newMethod);
}

+ (void)load {
    // 该方法会在加载这个类的时候执行（APP启动时会加载，只执行一次）
    // 此处交换descriptionWithLocale:与自己写的my_descriptionWithLocale:的方法指针
    [self sjt_exchangeSelector:@selector(descriptionWithLocale:) andNewSelector:@selector(my_descriptionWithLocale:)];
}

- (NSString *)my_descriptionWithLocale:(id)locale {
    NSString *desc = [self my_descriptionWithLocale:locale];
    desc = [self replaceUnicode:desc];
    return desc;
}

- (NSString *)replaceUnicode:(NSString *)unicodeStr {
    NSString *tempStr1 = [unicodeStr stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString* returnStr = [NSPropertyListSerialization propertyListFromData:tempData
                                                           mutabilityOption:NSPropertyListImmutable
                                                                     format:NULL
                                                           errorDescription:NULL];
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];
}
@end
