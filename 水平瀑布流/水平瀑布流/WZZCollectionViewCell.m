//
//  WZZCollectionViewCell.m
//  水平瀑布流
//
//  Created by 王召洲 on 16/3/26.
//  Copyright © 2016年 王召洲. All rights reserved.
//

#import "WZZCollectionViewCell.h"
#import "UIImageView+WebCache.h"
@interface WZZCollectionViewCell ()
@property(weak,nonatomic) UIImageView *imgView;
@end
@implementation WZZCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imgView=[[UIImageView alloc]init];
        [self.contentView addSubview:imgView];
        self.imgView=imgView;
    }
    return self;
}
-(void)layoutSubviews
{
    self.imgView.frame=self.bounds;
}
-(void)setModle:(WZZModle *)modle
{
    _modle=modle;
    
    NSURL *url=[NSURL URLWithString:modle.img];
    [self.imgView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"pic.png"]];
    
}
@end
