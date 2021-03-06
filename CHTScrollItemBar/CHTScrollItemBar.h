//
//  CHTScrollItemBar.h
//  CHTGithubDemo
//
//  Created by mac on 16/8/7.
//  Copyright © 2016年 Roy Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CHTScrollItemBar;

@protocol CHTScrollItemBarDelegate <NSObject>

@optional

- (void)scrollItemBar:(CHTScrollItemBar *)scrollItemBar didScrollToIndex:(NSInteger)index;

@end

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
 *  底部横线的颜色的颜色
 */
@property (nonatomic, strong) UIColor *bottomLineColor;

/**
 *  屏幕内显示几个按钮
 */
@property (nonatomic, assign) NSInteger itemCountPerScreen;

/**
 *  是否能够滑动
 */
@property (nonatomic, assign, getter=isScrollEnable) BOOL scrollEnable;

/**
 *  当前index
 */
@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, weak) id <CHTScrollItemBarDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame
                   itemTitles:(NSArray *)titles
           relevantScrollView:(UIScrollView *)relevantScrollView;

- (void)setupItemTitles:(NSArray *)itemTitles
     relevantScrollView:(UIScrollView *)relevantScrollView;

@end
