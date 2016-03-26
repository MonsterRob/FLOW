//
//  ViewController.m
//  水平瀑布流
//
//  Created by 王召洲 on 16/3/26.
//  Copyright © 2016年 王召洲. All rights reserved.
//

#import "ViewController.h"
#import "WZZCollectionViewCell.h"
#import "WZZLayout.h"
#import "WZZModle.h"
@interface ViewController ()<WZZLayoutDelegate,UICollectionViewDataSource>
@property(strong,nonatomic) NSMutableArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loaddata];
    WZZLayout *layout=[[WZZLayout alloc]init];
    layout.delegate=self;
    UICollectionView *collectionView=[[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.dataSource=self;
    [collectionView registerClass:[WZZCollectionViewCell class] forCellWithReuseIdentifier:@"water"];
    [self.view addSubview:collectionView];
    
}

-(void)loaddata
{
    self.dataSource=[NSMutableArray array];
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"water" ofType:@"plist"];
    NSArray *arr=[[NSArray alloc]initWithContentsOfFile:filepath];
    for (NSDictionary *dic in arr) {
        WZZModle *modle = [WZZModle modelWithDic:dic];
        [self.dataSource addObject:modle];
    }
}
-(CGFloat)layout:(WZZLayout *)layout andcellHeight:(CGFloat)height angIndexPath:(NSIndexPath *)indexpath
{
    WZZModle *modle = self.dataSource[indexpath.row];
    return height*(modle.w*1.0/modle.h);
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WZZCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"water" forIndexPath:indexPath];
    WZZModle *modle=self.dataSource[indexPath.row];
    cell.modle=modle;
    return cell;
    
}
@end
