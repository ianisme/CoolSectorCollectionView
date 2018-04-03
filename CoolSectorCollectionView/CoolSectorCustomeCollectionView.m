//
//  CoolSectorCustomeCollectionView.m
//  CoolSectorCollectionView
//
//  Created by ian on 2018/4/3.
//  Copyright © 2018年 Rengfou. All rights reserved.
//

#import "CoolSectorCustomeCollectionView.h"
#import "CoolSectorCustomCollectionViewCell.h"

@implementation CoolSectorCustomeCollectionView

- (void)loadViewPageCircleViewDatas:(NSArray<NSDictionary *> *)dataArray
{
    self.dataArray = dataArray;
    [self initPageCircleView];
    [self.collectionView registerClass:[CoolSectorCustomCollectionViewCell class] forCellWithReuseIdentifier:@"cell_reused_identifier"];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CoolSectorCustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell_reused_identifier" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    
    NSInteger numberOfItem = [self.collectionView numberOfItemsInSection:0];
    
    CGFloat factor = -self.layout.angleAtExtreme/(numberOfItem * ItemWidth - CGRectGetWidth(self.collectionView.bounds));
    cell.perItemDistanceX = (self.layout.anglePerItem/factor);
    
    // cell.tag = indexPath.row;
    NSDictionary *dic = self.dataArray[indexPath.row];
    [cell configDataImgUrl:dic[@"imgUrl"] title:dic[@"title"] subtitle:dic[@"subtitle"] logoImgUrl:dic[@"logoImgUrl"]];
    return cell;
}

@end
