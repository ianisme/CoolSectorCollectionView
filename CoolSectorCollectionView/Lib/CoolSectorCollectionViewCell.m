//
//  CoolSectorCollectionViewCell.m
//  CoolSectorCollectionView
//
//  Created by ian on 2018/4/3.
//  Copyright © 2018年 Rengfou. All rights reserved.
//

#import "CoolSectorCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "CoolSectorCollectionLayoutAttributes.h"
#import "CoolSectorConstant.h"

@interface CoolSectorCollectionViewCell()

@property (nonatomic, strong) UIImageView *myContentImageView;

@end

@implementation CoolSectorCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatView];
    }
    return self;
}

- (void)creatView
{
    UIImageView *myContentView = [[UIImageView alloc] init];
    myContentView.backgroundColor = [UIColor greenColor];
    myContentView.frame = self.contentView.frame;
    [self.contentView addSubview:myContentView];
    _myContentImageView = myContentView;
    myContentView.layer.allowsEdgeAntialiasing = YES;// 去锯齿
}

- (void)configImageView:(NSString *)imgUrl
{
    [_myContentImageView sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    [super applyLayoutAttributes:layoutAttributes];
    CoolSectorCollectionLayoutAttributes *circularlayoutAttributes = (CoolSectorCollectionLayoutAttributes *)layoutAttributes;
    self.layer.anchorPoint = circularlayoutAttributes.anchorPoint;
    // NSLog(@"%f", circularlayoutAttributes.anchorPoint.x);
    CGPoint center = self.center;
    center.y += (circularlayoutAttributes.anchorPoint.y - 0.5)*self.bounds.size.height;
    self.center = center;
    
    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
    CGRect frame=[self convertRect:self.bounds toView:window];
    
    CGFloat criticalValue = (window.bounds.size.width - ItemWidth)*0.5;
    
    //    if (self.tag == 0) {
    //        NSLog(@"%f",frame.origin.x);
    //        NSLog(@"ss:%f",self.perItemDistanceX);
    //    }
    
    //NSLog(@"%@",NSStringFromCGRect(frame));
    
    if ((frame.origin.x) < -self.perItemDistanceX*5/6.0f || frame.origin.x > self.perItemDistanceX*5/6.0f + criticalValue) {
        if ((frame.origin.x) < -self.perItemDistanceX*5/6.0f) {
            self.alpha = 1-60.0f*(-frame.origin.x - self.perItemDistanceX*5/6.0f)/self.perItemDistanceX*1/6.0f;
            // self.contentView.alpha = 0;
        } else {
            // NSLog(@"%f",1 - 60 *(frame.origin.x - (self.perItemDistanceX*5/6+ criticalValue))/self.perItemDistanceX*1/6);
            self.alpha = 1-60.0f*(frame.origin.x - (self.perItemDistanceX*5/6.0f+ criticalValue))/self.perItemDistanceX*1/6.0f;
            //  self.contentView.alpha = 0;
        }
    } else {
        self.contentView.alpha = 1;
    }
    
}


@end
