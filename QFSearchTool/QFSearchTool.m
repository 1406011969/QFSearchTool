//
//  QFSearchTool.m
//  XS_Robot
//
//  Created by cheng on 2019/5/21.
//  Copyright © 2019 xiangShang. All rights reserved.
//

#import "QFSearchTool.h"

#define Record_Count 10      /// 最多存储10条，自定义

@implementation QFSearchTool

#pragma mark - 添加新的搜索历史
+ (void)addSearchRecord:(NSString *)searchStr identify:(NSString *)identify {
    NSArray *array = [[NSUserDefaults standardUserDefaults] arrayForKey:identify];
    NSMutableArray *searchArray = [[NSMutableArray alloc] initWithArray:array];
    if (searchArray == nil) {
        searchArray = [[NSMutableArray alloc] init];
    } else if ([searchArray containsObject:searchStr]) {
        [searchArray removeObject:searchStr];
    } else if ([searchArray count] >= Record_Count) {
        [searchArray removeObjectsInRange:NSMakeRange(Record_Count - 1, [searchArray count] - Record_Count + 1)];
    }
    [searchArray insertObject:searchStr atIndex:0];
    [[NSUserDefaults standardUserDefaults] setObject:searchArray forKey:identify];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - 获取所有搜索记录
+ (NSArray *)getAllSearchHistoryWithIdentify:(NSString *)identify {
    NSArray *array = [[NSUserDefaults standardUserDefaults] arrayForKey:identify];
    return array;
}

#pragma mark - 清除所有搜索记录
+ (void)clearAllSearchHistoryWithIdentify:(NSString *)identify {
    [[NSUserDefaults standardUserDefaults] setObject:[[NSMutableArray alloc]init] forKey:identify];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - 删除某一条记录
+ (void)deleteHistoryWithIndex:(NSInteger)index identify:(NSString *)identify {
    NSArray *array = [[NSUserDefaults standardUserDefaults] arrayForKey:identify];
    NSMutableArray *searchArray = [[NSMutableArray alloc] initWithArray:array];
    if (index >=  searchArray.count) {
        return;
    }
    [searchArray removeObjectAtIndex:index];
    [[NSUserDefaults standardUserDefaults] setObject:searchArray forKey:identify];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


@end
