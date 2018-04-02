//
//  CoolSectorCollectionLayoutAttributes.m
//  CoolSectorCollectionView
//
//  Created by ian on 2018/4/2.
//  Copyright © 2018年 Rengfou. All rights reserved.
//

#import "CoolSectorCollectionLayoutAttributes.h"

@implementation CoolSectorCollectionLayoutAttributes

- (id)copyWithZone:(NSZone *)zone
{
    CoolSectorCollectionLayoutAttributes *circular = [super copyWithZone:zone];
    circular.anchorPoint = self.anchorPoint;
    circular.angle = self.angle;
    return circular;
}

- (void)setAngle:(CGFloat)angle
{
    _angle = angle;
    self.zIndex = -(int)(angle * 1000000); // 正数右边压左边   负数左边压右边
    self.transform = CGAffineTransformMakeRotation(angle);
}

@end
