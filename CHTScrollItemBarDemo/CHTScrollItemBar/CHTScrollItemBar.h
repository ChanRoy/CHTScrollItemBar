//
//  CHTScrollItemBar.h
//  CHTGithubDemo
//
//  Created by mac on 16/8/7.
//  Copyright © 2016年 Roy Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHTScrollItemBar : UIControl

/**
 *  按钮的字体
 */
@property (nonatomic, strong) UIFont *textFont;
/**
 *  按钮的正常颜色
 */
@property (nonatomic, strong) UIColor *textNormalColor;
/**
 *  按钮的选中颜色
 */
@property (nonatomic, strong) UIColor *textSelectedColor;
/**
 *  滑块的颜色
 */
@property (nonatomic, strong) UIColor *sliderColor;
/**
 *  屏幕内显示几个按钮
 */
@property (nonatomic, assign) NSInteger itemCountPerScreen;

- (instancetype)initWithFrame:(CGRect)frame
                   itemTitles:(NSArray *)titles
           relevantScrollView:(UIScrollView *)relevantScrollView;

- (void)setupItemTitles:(NSArray *)itemTitles
     relevantScrollView:(UIScrollView *)relevantScrollView;

@end
