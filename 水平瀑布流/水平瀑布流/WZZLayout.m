//
//  WZZLayout.m
//  水平瀑布流
//
//  Created by 王召洲 on 16/3/26.
//  Copyright © 2016年 王召洲. All rights reserved.
//

#import "WZZLayout.h"

@interface WZZLayout ()
@property(strong,nonatomic) NSMutableDictionary *xDic;
@property(assign,nonatomic) CGFloat cellHeight;

@end

@implementation WZZLayout
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.rows=3;
        self.rowMargin=2;
        self.columnMargin=2;
    }
    return self;
}
-(void)prepareLayout
{
    self.xDic=[NSMutableDictionary dictionary];
    CGFloat availableHeight=self.collectionView.bounds.size.height-(self.rows-1)*self.rowMargin;
    self.cellHeight=availableHeight/self.rows;
}
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    for (int i=0; i<self.rows; i++) {
        self.xDic[@(i)]=@0;
    }
    static int time=0;
    NSLog(@"执行了%d次",++time);
    NSMutableArray *attrArr=[NSMutableArray array];
    NSInteger cellNum=[self.collectionView numberOfItemsInSection:0];
    for(int i=0;i<cellNum;i++)
    {
        NSIndexPath *path=[NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attr=[self layoutAttributesForItemAtIndexPath:path];
        [attrArr addObject:attr];
    }
    return attrArr;
}
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    __block int minXrow=0;
    [self.xDic enumerateKeysAndObjectsUsingBlock:^(NSNumber *rowIndex,NSNumber *rowValue, BOOL * _Nonnull stop) {
        if ([self.xDic[@(minXrow)] floatValue] > [self.xDic[rowIndex] floatValue]) {
            minXrow=[rowIndex intValue];
        }
    }];
    CGFloat cellX=[self.xDic[@(minXrow)] floatValue];
    CGFloat cellY=(self.cellHeight+self.rowMargin)*minXrow;
    CGFloat cellW=[self.delegate layout:self andcellHeight:self.cellHeight angIndexPath:indexPath];
    self.xDic[@(minXrow)]=@(cellX+cellW+self.columnMargin);
    UICollectionViewLayoutAttributes *attr=[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attr.frame=CGRectMake(cellX, cellY, cellW, self.cellHeight);
    return attr;
}
-(CGSize)collectionViewContentSize
{
    __block int maxXrow=0;
    [self.xDic enumerateKeysAndObjectsUsingBlock:^(NSNumber *rowIndex,NSNumber *rowValue, BOOL * _Nonnull stop) {
        if ([self.xDic[@(maxXrow)] floatValue] <[self.xDic[rowIndex] floatValue]) {
            maxXrow=[rowIndex intValue];
        }
    }];
    CGFloat collectionWidth = [self.xDic[@(maxXrow)] floatValue];
    
    return
    CGSizeMake(collectionWidth, self.collectionView.bounds.size.height);
}
@end
