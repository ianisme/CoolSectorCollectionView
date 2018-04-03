//
//  CoolSectorCustomeCollectionView.h
//  CoolSectorCollectionView
//
//  Created by ian on 2018/4/3.
//  Copyright © 2018年 Rengfou. All rights reserved.
//

#import "CoolSectorCollectionView.h"

@interface CoolSectorCustomeCollectionView : CoolSectorCollectionView

// @[@{@"imgUrl":@"", @"title":@"", @"subtitle":@"", @"logoImgUrl":@""}]
- (void)loadViewPageCircleViewDatas:(NSArray<NSDictionary *> *)dataArray;

@end
