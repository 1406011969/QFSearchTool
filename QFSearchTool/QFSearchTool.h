//
//  QFSearchTool.h
//  XS_Robot
//
//  Created by cheng on 2019/5/21.
//  Copyright © 2019 xiangShang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QFSearchTool : NSObject

@property (nonatomic, strong) NSMutableArray *SearchDataArray;


/// 添加搜索历史
+ (void)addSearchRecord:(NSString *)searchStr identify:(NSString *)identify;

/// 获取所有的搜索历史
+ (NSArray *)getAllSearchHistoryWithIdentify:(NSString *)identify;

/// 清空搜索历史
+ (void)clearAllSearchHistoryWithIdentify:(NSString *)identify;

/// 删除某一条记录
+ (void)deleteHistoryWithIndex:(NSInteger)index identify:(NSString *)identify;


@end

NS_ASSUME_NONNULL_END
