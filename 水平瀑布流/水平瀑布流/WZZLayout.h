//
//  WZZLayout.h
//  水平瀑布流
//
//  Created by 王召洲 on 16/3/26.
//  Copyright © 2016年 王召洲. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WZZLayout;

@protocol WZZLayoutDelegate <NSObject>

-(CGFloat)layout:(WZZLayout*)layout andcellHeight:(CGFloat)height angIndexPath:(NSIndexPath*)indexpath;

@end

@interface WZZLayout : UICollectionViewLayout
@property(assign,nonatomic) NSInteger rows;
@property(assign,nonatomic) NSInteger rowMargin;
@property(assign,nonatomic) NSInteger columnMargin;
@property(weak,nonatomic) id <WZZLayoutDelegate > delegate;
@end
