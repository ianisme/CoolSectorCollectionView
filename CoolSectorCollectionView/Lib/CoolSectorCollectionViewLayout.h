//
//  CoolSectorCollectionViewLayout.h
//  CoolSectorCollectionView
//
//  Created by ian on 2018/4/2.
//  Copyright © 2018年 Rengfou. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CoolSectorConstant.h"
#import "CoolSectorCollectionLayoutAttributes.h"

@interface CoolSectorCollectionViewLayout : UICollectionViewLayout

// 半径
@property (nonatomic, assign) CGFloat radius;
// 大小
@property (nonatomic, assign) CGSize itemSize;

@property (nonatomic) CGFloat angle;

@property (nonatomic) CGFloat anglePerItem;

@property (nonatomic) CGFloat angleAtExtreme;

@property (nonatomic, strong) NSArray <CoolSectorCollectionLayoutAttributes *> *attributesList;

@end
