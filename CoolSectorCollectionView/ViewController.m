//
//  ViewController.m
//  CoolSectorCollectionView
//
//  Created by ian on 2018/4/2.
//  Copyright © 2018年 Rengfou. All rights reserved.
//

#import "ViewController.h"
#import "CoolSectorCollectionView.h"
#import "CoolSectorCustomeCollectionView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)normalAction:(id)sender {
    CoolSectorCollectionView *view = [[CoolSectorCollectionView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:view];
    [view loadViewPageCircleViewUrls:@[@"https://raw.githubusercontent.com/ianisme/CoolSectorCollectionView/master/1.png",@"https://raw.githubusercontent.com/ianisme/CoolSectorCollectionView/master/2.png",@"https://raw.githubusercontent.com/ianisme/CoolSectorCollectionView/master/3.png"]];
}

- (IBAction)customAction:(id)sender {
    CoolSectorCustomeCollectionView *view = [[CoolSectorCustomeCollectionView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:view];
    
    NSDictionary *dic1 = @{@"imgUrl" : @"https://raw.githubusercontent.com/ianisme/CoolSectorCollectionView/master/1.png",
                           @"title":@"标题一",
                           @"subtitle":@"我有一只小毛驴我从来也不骑...",
                           @"logoImgUrl":@"https://raw.githubusercontent.com/ianisme/CoolSectorCollectionView/master/1.png"
                           };
    NSDictionary *dic2 = @{@"imgUrl" : @"https://raw.githubusercontent.com/ianisme/CoolSectorCollectionView/master/2.png",
                           @"title":@"标题二",
                           @"subtitle":@"我有两只小毛驴我从来也不骑...",
                           @"logoImgUrl":@"https://raw.githubusercontent.com/ianisme/CoolSectorCollectionView/master/2.png"
                           };
    NSDictionary *dic3 = @{@"imgUrl" : @"https://raw.githubusercontent.com/ianisme/CoolSectorCollectionView/master/3.png",
                           @"title":@"标题三",
                           @"subtitle":@"我有三只小毛驴我从来也不骑...",
                           @"logoImgUrl":@"https://raw.githubusercontent.com/ianisme/CoolSectorCollectionView/master/3.png"
                           };
    
    [view loadViewPageCircleViewDatas:@[dic1, dic2, dic3]];
    // @[@{@"imgUrl":@"", @"title":@"", @"subtitle":@"", @"logoImgUrl":@""}]
//    - (void)loadViewPageCircleViewDatas:(NSArray<NSDictionary *> *)dataArray;
}


@end
