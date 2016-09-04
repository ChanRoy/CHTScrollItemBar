//
//  CHTScrollItemBar.m
//  CHTGithubDemo
//
//  Created by mac on 16/8/7.
//  Copyright © 2016年 Roy Chan. All rights reserved.
//

#import "CHTScrollItemBar.h"

#define ITEM_COUNT  4 //default count of items in a screen
#define BUTTON_START_TAG    100
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height

static NSString *const kContentOffset = @"contentOffset";

@interface CHTScrollItemBar ()<UIScrollViewDelegate>

@property (nonatomic, strong) NSArray *itemTitles;
@property (nonatomic, strong) UIScrollView *relevantScrollView;

@end

@implementation CHTScrollItemBar{
    
    UIScrollView *_scrollView;
    UIView *_sliderView;
    CGFloat _itemWidth;
}

#pragma mark - lefe cycle
- (void)dealloc{
    
    [_relevantScrollView removeObserver:self forKeyPath:kContentOffset];
}

- (instancetype)initWithFrame:(CGRect)frame itemTitles:(NSArray *)titles relevantScrollView:(UIScrollView *)relevantScrollView{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initialize];
        
        self.itemTitles = titles;
        self.relevantScrollView = relevantScrollView;
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

- (void)setupItemTitles:(NSArray *)itemTitles relevantScrollView:(UIScrollView *)relevantScrollView{
    
    self.itemTitles = itemTitles;
    self.relevantScrollView = relevantScrollView;
}

- (void)initialize{
    
    self.backgroundColor = [UIColor colorWithRed:255 / 255.0 green:255 / 255.0 blue:255 / 255.0 alpha:1];
    
    _itemCountPerScreen = ITEM_COUNT;
    _itemWidth = SCREEN_WIDTH / _itemCountPerScreen;
    _textNormalColor = [UIColor blackColor];
    _textSelectedColor = [UIColor redColor];
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator   = NO;
    _scrollView.pagingEnabled = NO;
    _scrollView.bounces = NO;
    _scrollView.backgroundColor = [UIColor clearColor];
    [self addSubview:_scrollView];
    
}

- (void)changeButtonState:(UIButton *)itemBtn{
    
    for (UIView *btn in _scrollView.subviews) {
        if ([btn isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton *)btn;
            button.selected = NO;
        }
    }
    itemBtn.selected = YES;
}

- (void)layoutItems{
    
    if (_itemTitles.count < _itemCountPerScreen) {
        self.itemCountPerScreen = _itemTitles.count;
    }
    
    for (UIView *view in _scrollView.subviews) {
        
        [view removeFromSuperview];
    }
    
    for (NSInteger i = 0; i < _itemTitles.count; i ++) {
        
        UIButton *itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        itemBtn.frame = CGRectMake(i * _itemWidth, 0, _itemWidth, CGRectGetHeight(_scrollView.frame) - 2);
        itemBtn.tag = BUTTON_START_TAG + i;
        itemBtn.backgroundColor = [UIColor clearColor];
        [itemBtn setTitle:_itemTitles[i] forState:UIControlStateNormal];
        [itemBtn setTitleColor:_textNormalColor forState:UIControlStateNormal];
        [itemBtn setTitleColor:_textSelectedColor forState:UIControlStateSelected];
        [itemBtn addTarget:self action:@selector(itemBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_scrollView addSubview:itemBtn];
        
        if (i == 0) {
            itemBtn.selected = YES;
        }
    }
    
    _sliderView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(_scrollView.frame) - 2, _itemWidth, 2)];
    _sliderView.backgroundColor = [UIColor colorWithRed:247.0 / 255.0 green:186.0 / 255.0 blue:26.0 / 255.0 alpha:0.6];
    [_scrollView addSubview:_sliderView];
    
    _scrollView.contentSize = CGSizeMake(CGRectGetWidth(_scrollView.frame) / _itemCountPerScreen * _itemTitles.count, CGRectGetHeight(_scrollView.frame));
}

#pragma mark - set methods
- (void)setItemTitles:(NSArray *)itemTitles{
    
    if (_itemTitles == itemTitles) {
        return;
    }
    _itemTitles = itemTitles;
    
    [self layoutItems];
}

- (void)setRelevantScrollView:(UIScrollView *)relevantScrollView{
    
    if (_relevantScrollView == relevantScrollView) {
        return;
    }
    _relevantScrollView = relevantScrollView;
    
    [_relevantScrollView addObserver:self forKeyPath:kContentOffset options:NSKeyValueObservingOptionNew context:nil];
}

- (void)setItemCountPerScreen:(NSInteger)itemCountPerScreen{
    
    if (_itemCountPerScreen == itemCountPerScreen) {
        return;
    }
    _itemCountPerScreen = itemCountPerScreen;
    _itemWidth = SCREEN_WIDTH / _itemCountPerScreen;
    
    [self layoutItems];
}

- (void)setTextFont:(UIFont *)textFont{
    
    if (_textFont == textFont) {
        return;
    }
    _textFont = textFont;
    
    for (UIView *view in _scrollView.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)view;
            btn.titleLabel.font = _textFont;
        }
    }
}

- (void)setTextNormalColor:(UIColor *)textNormalColor{
    
    if (_textNormalColor == textNormalColor) {
        return;
    }
    _textNormalColor = textNormalColor;
    for (UIView *view in _scrollView.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)view;
            [btn setTitleColor:_textNormalColor forState:UIControlStateNormal];
        }
    }
}

- (void)setTextSelectedColor:(UIColor *)textSelectedColor{
    
    if (_textSelectedColor == textSelectedColor) {
        return;
    }
    _textSelectedColor = textSelectedColor;
    for (UIView *view in _scrollView.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)view;
            [btn setTitleColor:_textSelectedColor forState:UIControlStateSelected];
        }
    }
}

- (void)setSliderColor:(UIColor *)sliderColor{
    
    if (_sliderColor == sliderColor) {
        return;
    }
    _sliderColor = sliderColor;
    _sliderView.backgroundColor = sliderColor;
}

#pragma mark - button event
- (void)itemBtnClick:(UIButton *)itemBtn{

    [self changeButtonState:itemBtn];
    
    [UIView animateWithDuration:0.25f animations:^{
      
        CGRect tempFrame = _sliderView.frame;
        tempFrame.origin.x = CGRectGetMinX(itemBtn.frame);
        _sliderView.frame = tempFrame;
    }];
    
    [_relevantScrollView setContentOffset:CGPointMake(SCREEN_WIDTH * (itemBtn.tag - BUTTON_START_TAG), 0) animated:YES];
    
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    if (object == _relevantScrollView && [keyPath isEqualToString:kContentOffset]) {
        
        CGPoint offset = [change[NSKeyValueChangeNewKey] CGPointValue];
        
        if (offset.x < 0 || offset.x > CGRectGetWidth(_relevantScrollView.frame) * (_itemTitles.count - 1)) {
            return;
        }
        CGFloat xOffset = offset.x / CGRectGetWidth(_relevantScrollView.frame) * _itemWidth;
        
        CGRect tempFrame = _sliderView.frame;
        tempFrame.origin.x = xOffset;
        _sliderView.frame = tempFrame;
        
        if (CGRectGetMinX(_sliderView.frame) < _scrollView.contentOffset.x) {
            
            [_scrollView scrollRectToVisible:CGRectMake(xOffset, 0, CGRectGetWidth(_scrollView.frame), CGRectGetHeight(_scrollView.frame)) animated:YES];
        }else if (CGRectGetMaxX(_sliderView.frame) - SCREEN_WIDTH > _scrollView.contentOffset.x){
            
            [_scrollView scrollRectToVisible:CGRectMake(CGRectGetMaxX(_sliderView.frame) - SCREEN_WIDTH, 0, CGRectGetWidth(_scrollView.frame), CGRectGetHeight(_scrollView.frame)) animated:YES];
        }
        
        if (_relevantScrollView.dragging) {
            
            NSInteger selectIndex = round(offset.x / SCREEN_WIDTH);
            UIButton *btn = [_scrollView viewWithTag:selectIndex + BUTTON_START_TAG];
            [self changeButtonState:btn];
        }
        
    }
    else{
        
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
