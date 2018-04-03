//
//  CoolSectorCollectionViewCell.h
//  CoolSectorCollectionView
//
//  Created by ian on 2018/4/3.
//  Copyright © 2018年 Rengfou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoolSectorCollectionViewCell : UICollectionViewCell

@property (nonatomic) CGFloat perItemDistanceX;

- (void)configImageView:(NSString *)imgUrl;

@end
