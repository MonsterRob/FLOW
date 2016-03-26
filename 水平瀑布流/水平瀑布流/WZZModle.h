//
//  WZZModle.h
//  水平瀑布流
//
//  Created by 王召洲 on 16/3/26.
//  Copyright © 2016年 王召洲. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WZZModle : NSObject
@property(assign,nonatomic) NSInteger w;
@property(assign,nonatomic) NSInteger h;
@property(strong,nonatomic) NSString *img;
@property(strong,nonatomic) NSString *price;
+(instancetype)modelWithDic:(NSDictionary *)dic;
@end
