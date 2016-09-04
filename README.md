# CHTScrollItemBar

上下联动的scrollView，用于多个界面的展示

![] (https://github.com/ChanRoy/CHTScrollItemBar/blob/master/CHTScrollItemBar.gif)

## 简介

*上下联动的scrollView，用于多个界面的展示。*

*将下方展示内容的scrollview交给用户自定义，增强控件的灵活性*

*具体效果如上图*

## 使用

### 初始化（两种方法）

 + 方法一：

*直接初始化*

     - (instancetype)initWithFrame:(CGRect)frame
                        itemTitles:(NSArray *)titles  //上方控制按钮的title数组
                relevantScrollView:(UIScrollView *)relevantScrollView;  //下方相关联的scrollview

 + 方法二：

*先初始化，后再赋值数组及关联scrollView*

     - (instancetype)initWithFrame:(CGRect)frame；
     - (void)setupItemTitles:(NSArray *)itemTitles
          relevantScrollView:(UIScrollView *)relevantScrollView;
          
### 属性

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
     
## Demo
     
     //初始化按钮
     NSArray *titles = @[@"小明",@"小红",@"小刚",@"小雪",@"小鱼",@"小江"];
     //初始化下方的scrollView
     UIScrollView *relevantScrollView =
                        [[UIScrollView alloc]initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, SCREEN_HEIGHT - 40)];
     relevantScrollView.pagingEnabled = YES;
     relevantScrollView.showsHorizontalScrollIndicator = NO;
     relevantScrollView.contentSize = 
                        CGSizeMake(SCREEN_WIDTH * titles.count, CGRectGetHeight(relevantScrollView.frame));
     relevantScrollView.bounces = NO;
     [self.view addSubview:relevantScrollView];
    
     //为scrollview添加内容
     for (NSInteger i = 0; i < titles.count; i ++) {
        
        UIView *view = [[UIView alloc]initWithFrame:
                              CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, CGRectGetHeight(relevantScrollView.frame))];
        view.backgroundColor = RandomColor;
        [relevantScrollView addSubview:view];
     }
    
     //使用
     CHTScrollItemBar *itemBar = 
                      [[CHTScrollItemBar alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
     [itemBar setupItemTitles:titles relevantScrollView:relevantScrollView];
     itemBar.textFont = [UIFont systemFontOfSize:15.0f];
     itemBar.textNormalColor = [UIColor grayColor];
     itemBar.textSelectedColor = [UIColor purpleColor];
     itemBar.sliderColor = [UIColor blueColor];
     [self.view addSubview:itemBar];


