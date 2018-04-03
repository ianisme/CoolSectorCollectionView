//
//  CoolSectorCustomCollectionViewCell.m
//  CoolSectorCollectionView
//
//  Created by ian on 2018/4/3.
//  Copyright © 2018年 Rengfou. All rights reserved.
//

#import "CoolSectorCustomCollectionViewCell.h"
#import <Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface CoolSectorCustomCollectionViewCell()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIImageView *logoImageView;

@end

@implementation CoolSectorCustomCollectionViewCell


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
    self.backgroundColor = [UIColor whiteColor];
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    //    UIView *conView = [[UIView alloc] init];
    //    [self.contentView addSubview:conView];
    //    conView.backgroundColor = [UIColor whiteColor];
    //    [conView mas_makeConstraints:^(MASConstraintMaker *make) {
    //       make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(2, 2, 2, 2)));
    //    }];
    
    self.contentView.layer.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.85].CGColor;
    self.contentView.layer.shadowOpacity = 0.3f;
    self.contentView.layer.shadowOffset = CGSizeMake(0,2);
    self.contentView.layer.shadowRadius = 4.0f;
    
    _imageView = [[UIImageView alloc] init];
    _imageView.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:_imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).with.offset(12.0f);
        make.right.equalTo(self.contentView).with.offset(-12.0f);
        make.height.mas_equalTo((self.contentView.bounds.size.width-24) * (192/256.0f));
    }];
    
    
    _logoImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_logoImageView];
    _logoImageView.backgroundColor = [UIColor whiteColor];
    [_logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.left.equalTo(self.contentView);
        make.height.mas_equalTo(self.contentView.bounds.size.width*(60/280.0f));
    }];
    
    _lineView = [[UIView alloc] init];
    [self.contentView addSubview:_lineView];
    _lineView.backgroundColor = [UIColor blackColor];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(18.0f);
        make.right.equalTo(self.contentView).with.offset(-18.0f);
        make.bottom.equalTo(self.logoImageView.mas_top);
        make.height.mas_equalTo(0.5f);
    }];
    
    _titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_titleLabel];
    _titleLabel.font = [UIFont systemFontOfSize:18.0f];
    _titleLabel.textColor = [UIColor redColor];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(18.0f);
        make.right.equalTo(self.contentView).with.offset(-18.0f);
        make.top.equalTo(self.imageView.mas_bottom).with.offset(16.0f);
        make.height.mas_equalTo(28.0f);
    }];
    
    _subtitleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_subtitleLabel];
    _subtitleLabel.font = [UIFont systemFontOfSize:12.0f];
    _subtitleLabel.textColor = [UIColor grayColor];
    [_subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(18.0f);
        make.right.equalTo(self.contentView).with.offset(-18.0f);
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(6.0f);
        make.bottom.equalTo(self.lineView.mas_top).with.offset(-12.0f);
    }];
    _subtitleLabel.numberOfLines = 0;
    
    self.layer.allowsEdgeAntialiasing = YES;
    self.contentView.layer.allowsEdgeAntialiasing = YES;
    _imageView.layer.allowsEdgeAntialiasing = YES;
    _logoImageView.layer.allowsEdgeAntialiasing = YES;
}

- (void)configDataImgUrl:(NSString *)imgUrl title:(NSString *)title subtitle:(NSString *)subtitle logoImgUrl:(NSString *)logoImgUrl
{
    [_imageView sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:nil];
    [_logoImageView sd_setImageWithURL:[NSURL URLWithString:logoImgUrl] placeholderImage:nil];
    _titleLabel.text = title;
    [self setLabelSpace:_subtitleLabel withValue:subtitle withFont:[UIFont systemFontOfSize:12.0f]];
}

-(void)setLabelSpace:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font
{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = 6; //设置行间距
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    //设置字间距 NSKernAttributeName:@1.5f
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@0.0f
                          };
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str attributes:dic];
    label.attributedText = attributeStr;
}

@end
