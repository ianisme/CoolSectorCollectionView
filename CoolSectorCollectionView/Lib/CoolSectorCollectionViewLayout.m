//
//  CoolSectorCollectionViewLayout.m
//  CoolSectorCollectionView
//
//  Created by ian on 2018/4/2.
//  Copyright © 2018年 Rengfou. All rights reserved.
//

#import "CoolSectorCollectionViewLayout.h"

@implementation CoolSectorCollectionViewLayout

- (instancetype)init {
    if (self = [super init]) {
        [self initial];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initial];
    }
    return self;
}

- (void)initial {
    self.itemSize = CGSizeMake(ItemWidth, ItemHieght);
    CGFloat hudu = M_PI/(180/7.0f);
    self.radius = self.itemSize.width / hudu;
}

- (CGFloat)angleAtExtreme
{
    NSInteger numberOfItem = [self.collectionView numberOfItemsInSection:0];
    if (numberOfItem > 0) {
        return -(numberOfItem-1)*1.0f*self.anglePerItem;
    } else {
        return 0.0f;
    }
}

- (CGFloat)angle
{
    CGFloat tempAngle = self.angleAtExtreme*self.collectionView.contentOffset.x/([self collectionViewContentSize].width - self.collectionView.bounds.size.width);
    return tempAngle;
}

- (CGFloat)anglePerItem
{
    CGFloat tempAnglePerItem = atan(self.itemSize.width/self.radius);
    return tempAnglePerItem;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

+ (Class)layoutAttributesClass {
    return [CoolSectorCollectionLayoutAttributes class];
}

- (CGSize)collectionViewContentSize {
    NSInteger numberOfItem = [self.collectionView numberOfItemsInSection:0];
    return CGSizeMake(numberOfItem * ItemWidth , self.collectionView.bounds.size.height);
}

- (void)setRadius:(CGFloat)radius
{
    _radius = radius;
    [self invalidateLayout];
}

- (void)prepareLayout {
    [super prepareLayout];
    
    CGFloat centerX = self.collectionView.contentOffset.x + CGRectGetWidth(self.collectionView.bounds) * .5f;
    CGFloat anchorPointY = ((self.itemSize.height/2.0) + self.radius)/self.itemSize.height;
    
    // 1
    CGFloat theta = atan2(self.collectionView.bounds.size.width/2.0f, self.radius + (self.itemSize.height/2.0f) - self.collectionView.bounds.size.height/2.0f);
    
    // 2
    NSUInteger startIndex = 0;
    NSUInteger endIndex = [self.collectionView numberOfItemsInSection:0] - 1;
    // 3
    if (self.angle < -theta) {
        startIndex = (int)(floor((-theta - self.angle)/self.anglePerItem));
    }
    // 4
    endIndex = MIN(endIndex, (int)(ceil((theta-self.angle)/self.anglePerItem)));
    
    // 5
    if (endIndex < startIndex) {
        endIndex = 0;
        startIndex = 0;
    }
    
    NSMutableArray *mAttributesList = [@[] mutableCopy];
    for (NSUInteger i = startIndex; i <= endIndex; i ++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        CoolSectorCollectionLayoutAttributes *attributes = [CoolSectorCollectionLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attributes.size = self.itemSize;
        attributes.center = CGPointMake(centerX, CGRectGetMidY(self.collectionView.bounds));
        attributes.angle = self.angle + self.anglePerItem*(i*1.0f);
        attributes.anchorPoint = CGPointMake(0.5f, anchorPointY);
        [mAttributesList addObject:attributes];
    }
    self.attributesList = [mAttributesList copy];
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.attributesList;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.attributesList[indexPath.row];
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGPoint finalContentOffset = proposedContentOffset;
    CGFloat factor = -self.angleAtExtreme/([self collectionViewContentSize].width - CGRectGetWidth(self.collectionView.bounds));
    CGFloat proposedAngle = proposedContentOffset.x * factor;
    CGFloat ratio = proposedAngle/self.anglePerItem;
    NSUInteger multiplier = 0;
    if (velocity.x > 0) {
        multiplier = ceil(ratio); // 如果参数是小数 则求最小的整数但不小于本身
    } else if (velocity.x < 0) {
        multiplier = floor(ratio); // 如果参数是小数 则求最大的整数但不大于本身
    } else {
        multiplier = round(ratio); // 如果参数是小数 则求本身的四舍五入
    }
    finalContentOffset.x = multiplier*self.anglePerItem/factor;
    // NSLog(@"%f",finalContentOffset.x);
    
    //    NSLog(@"%ld",multiplier);
    return finalContentOffset;
}

@end
