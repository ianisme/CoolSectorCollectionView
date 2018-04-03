//
//  CoolSectorPageControl.m
//  CoolSectorCollectionView
//
//  Created by ian on 2018/4/3.
//  Copyright © 2018年 Rengfou. All rights reserved.
//

#import "CoolSectorPageControl.h"

@implementation CoolSectorPageControl

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (void)setCurrentPage:(NSInteger)currentPage
{
    [super setCurrentPage:currentPage];
    
    for (int i=0; i<[self.subviews count]; i++) {
        //圆点
        UIView* dot = [self.subviews objectAtIndex:i];
        //添加imageView
        if ([dot.subviews count] == 0) {
            UIImageView * view = [[UIImageView alloc]initWithFrame:dot.bounds];
            CGRect frame = view.frame;
            frame.size.width = 9.0f;
            frame.size.height = 3.0f;
            view.frame = frame;
            view.layer.cornerRadius = 1.5f;
            [dot addSubview:view];
            
        }; //配置imageView
        UIImageView * view = dot.subviews[0];
        if (i==self.currentPage) {
            //            view.image = [UIImage imageNamed:@""];
            view.backgroundColor = [UIColor whiteColor];
            dot.backgroundColor = [UIColor clearColor];
        }else {
            //            view.image = [UIImage imageNamed:@""];
            view.backgroundColor = [UIColor colorWithWhite:1 alpha:0.2];
            dot.backgroundColor = [UIColor clearColor];
        }
    }
}

@end
