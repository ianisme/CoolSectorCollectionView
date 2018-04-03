//
//  CoolSectorCollectionView.h
//  CoolSectorCollectionView
//
//  Created by ian on 2018/4/3.
//  Copyright © 2018年 Rengfou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoolSectorCollectionLayoutAttributes.h"
#import "CoolSectorCollectionViewLayout.h"
#import "CoolSectorCollectionViewCell.h"
#import "CoolSectorPageControl.h"

@interface CoolSectorCollectionView : UIView

@property (nonatomic, copy) void(^itemViewClickBlock)(NSUInteger index);

- (void)loadViewPageCircleViewUrls:(NSArray<NSString *> *)urls;

- (void)initPageCircleView;

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) CoolSectorCollectionViewLayout *layout;

@end
