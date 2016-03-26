//
//  WZZModle.m
//  水平瀑布流
//
//  Created by 王召洲 on 16/3/26.
//  Copyright © 2016年 王召洲. All rights reserved.
//

#import "WZZModle.h"

@implementation WZZModle
- (instancetype)initWithDic:(NSDictionary *)dic;
{
    self = [super init];
    if (self) {
        self.w=[dic[@"w"] integerValue];
        self.h=[dic[@"h"] integerValue];
        self.img=dic[@"img"];
        self.price=dic[@"price"];
    }
    return self;
}
+(instancetype)modelWithDic:(NSDictionary *)dic
{
    return [[self alloc]initWithDic:dic];
}
@end
