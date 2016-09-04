//
//  CHTScrollItemBar.h
//  CHTGithubDemo
//
//  Created by mac on 16/8/7.
//  Copyright © 2016年 Roy Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHTScrollItemBar : UIControl

@property (nonatomic, strong) UIFont *textFont;
@property (nonatomic, strong) UIColor *textNormalColor;
@property (nonatomic, strong) UIColor *textSelectedColor;
@property (nonatomic, strong) UIColor *sliderColor;
@property (nonatomic, assign) NSInteger itemCountPerScreen;

- (instancetype)initWithFrame:(CGRect)frame itemTitles:(NSArray *)titles relevantScrollView:(UIScrollView *)relevantScrollView;

- (void)setupItemTitles:(NSArray *)itemTitles relevantScrollView:(UIScrollView *)relevantScrollView;

@end
