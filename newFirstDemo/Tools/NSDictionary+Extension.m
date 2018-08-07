//
//  NSDictionary+Extension.m
//  newFirstDemo
//
//  Created by tangyunchuan on 2018/8/3.
//  Copyright © 2018年 tangyunchuan. All rights reserved.
//

#import "NSDictionary+Extension.h"
#import "NSArray+Extension.h"

@implementation NSDictionary (Extension)

- (NSString *)formatDictionary:(NSDictionary *)dict formatString:(NSString *)formatString {
    if (formatString == nil ||formatString.length == 0) {
        formatString = @"\t";
    }
    NSArray *temps = dict.allKeys;
    NSArray *allKeys = [temps sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return dict[obj1]>dict[obj2];
    }];
    NSMutableString *string = [NSMutableString string];
    [string appendString:@"{\n"];
    for(int i = 0;i <allKeys.count;i++){
        id key = allKeys[i];
        id value = dict[key];
        [string appendFormat:@"%@%@ = ",formatString,key];
        NSString *dictFormatString = [NSString stringWithFormat:@"%@%@",formatString,formatString];
        if ([value isKindOfClass:[NSDictionary class]]) {
            [string appendFormat:@"%@%@\n",formatString,[self formatDictionary:value formatString:dictFormatString]];
        }else if ([value isKindOfClass:[NSArray class]]) {
            [string appendFormat:@"%@%@\n",formatString,[value formatArray:value formatString:dictFormatString]];
        }else{
            [string appendFormat:@"%@\n",value];
        }
    }
    [string appendFormat:@"%@};",[formatString substringFromIndex:1]];
    return string;
}
- (NSString *)description {
    return [self formatDictionary:self formatString:nil];
}

@end
