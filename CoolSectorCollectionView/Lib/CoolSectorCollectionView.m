//
//  CoolSectorCollectionView.m
//  CoolSectorCollectionView
//
//  Created by ian on 2018/4/3.
//  Copyright © 2018年 Rengfou. All rights reserved.
//

#import "CoolSectorCollectionView.h"

@interface CoolSectorCollectionView()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) CoolSectorPageControl *control;

@end

@implementation CoolSectorCollectionView

- (void)loadViewPageCircleViewUrls:(NSArray<NSString *> *)urls;
{
    _dataArray = urls;
    [self initPageCircleView];
    [self.collectionView registerClass:[CoolSectorCollectionViewCell class] forCellWithReuseIdentifier:@"cell_reused_identifier"];
}

- (void)initPageCircleView
{
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5f];
    
    CoolSectorCollectionViewLayout *layout = [[CoolSectorCollectionViewLayout alloc] init];
    _layout = layout;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, ItemHieght + 20) collectionViewLayout:_layout];
    [self addSubview:collectionView];
    collectionView.decelerationRate = UIScrollViewDecelerationRateFast;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.clipsToBounds = YES;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.backgroundColor = [UIColor clearColor];
    _collectionView = collectionView;
    CGPoint centerPoint = self.center;
    centerPoint.y -= 20;
    _collectionView.center = centerPoint;
    
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:closeButton];
    closeButton.frame = CGRectMake(self.bounds.size.width/2.0f - 32/2.0f, _collectionView.frame.origin.y + _collectionView.frame.size.height + 42, 32, 32);
    closeButton.clipsToBounds = YES;
    closeButton.layer.cornerRadius = 16.0f;
    closeButton.backgroundColor = [UIColor redColor];
    [closeButton addTarget:self action:@selector(closeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [closeButton setTitle:@" X " forState:UIControlStateNormal];
    
    CoolSectorPageControl *control = [[CoolSectorPageControl alloc] initWithFrame:CGRectMake(0, _collectionView.frame.origin.y + _collectionView.frame.size.height + 12.0f, self.bounds.size.width, 8)];
    control.pageIndicatorTintColor = [UIColor blueColor];
    control.currentPageIndicatorTintColor = [UIColor greenColor];
    control.numberOfPages = _dataArray.count;
    [self addSubview:control];
    _control = control;
}

- (void)closeButtonClick:(id)sender
{
    [self removeFromSuperview];
}

- (NSArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSArray array];
    }
    return _dataArray;
}

#pragma mark - UICollectionViewDelegate UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CoolSectorCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell_reused_identifier" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    
    NSInteger numberOfItem = [self.collectionView numberOfItemsInSection:0];
    
    CGFloat factor = -self.layout.angleAtExtreme/(numberOfItem * ItemWidth - CGRectGetWidth(self.collectionView.bounds));
    cell.perItemDistanceX = (self.layout.anglePerItem/factor);
    
    [cell configImageView:_dataArray[indexPath.row]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.itemViewClickBlock) {
        self.itemViewClickBlock(indexPath.row);
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger numberOfItem = [self.collectionView numberOfItemsInSection:0];
    
    CGFloat factor = -self.layout.angleAtExtreme/(numberOfItem * ItemWidth - CGRectGetWidth(self.collectionView.bounds));
    CGFloat x = scrollView.contentOffset.x;
    NSUInteger multiplier = round(x/(self.layout.anglePerItem/factor));
    
    NSInteger page = multiplier;
    
    if(page != _control.currentPage)
    {
        _control.currentPage = page;
    };
}

@end
