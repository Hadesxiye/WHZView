//
//  HadesView.m
//  DZZiOS
//
//  Created by 王浩祯 on 2018/5/24.
//

#import "HadesView.h"
#import "HadesViewModel.h"

#define hadesViewWidth self.bounds.size.width
#define hadesViewHeight self.bounds.size.height

@implementation HadesView
{
    CGFloat _margins;
    NSInteger _labelTag;
    NSInteger _btnTag;
    NSInteger _imageViewTag;
}

-(instancetype)initWithViewFrame:(CGRect)viewFrame NineNumberFrame:(NSString *)nineNumberStr LabelTitle:(NSArray *)labelTitleArr btnTitle:(NSArray *)btnTitleArr imageViewTitleAndImage:(NSArray *)imageArr{
    
    
    if (self = [super initWithFrame:viewFrame]) {
        
        _labelTag = 0;
        _btnTag = 0;
        _imageViewTag = 0;
        
        //对简易布局设置做转换 并创建对应组件
        [self nineNumberConvert:nineNumberStr :labelTitleArr :btnTitleArr :imageArr];
        
        }
    return  self;
}

+(void)setMargins:(CGFloat)marginsFloat{
    
}

-(void)nineNumberConvert:(NSString *)nineNumberStr :(NSArray *)labelTitleArr :(NSArray *)btnTitleArr :(NSArray *)imageArr {
    if (nineNumberStr.length==9) {
        //整形判断
        if ([self isPureInt:nineNumberStr]) {
            for (NSInteger i = 0; i < 9; i++) {
                NSString *tempChar = [nineNumberStr substringWithRange:NSMakeRange(i, 1)];
            
                switch (tempChar.integerValue) {
                    //空区域
                    case 0:
                        //无操作
                        break;
                    //label
                    case 1:
                        [self createLabelWithPositionFlag:i Title:labelTitleArr];
                        break;
                    //btn
                    case 2:
                        [self createBtnWithPositionFlag:i Title:btnTitleArr];
                        break;
                    //imageView
                    case 3:
                        [self createImageViewWithPositionFlag:i TitleAndImage:imageArr];
                        break;
                    //非法数值
                    default:
                        NSLog(@"输入非法格式frame!请输入仅含0123的9位字符串");
                        return;
                        break;
                }
            }
        }
    }
}
#pragma mark - ❀==============❂ 点击事件block ❂==============❀
- (void)btnCLick:(id)sender{
    
    UIButton *button = (UIButton *)sender;
    if (self.btnClickBlock) {
        self.btnClickBlock(button.tag);
    }
    
}

-(void)imageViewClick:(id)sender{

    UITapGestureRecognizer *tap = (UITapGestureRecognizer*)sender;
    UIImageView* imageView = (UIImageView *)tap.view;
    NSUInteger tagTemp = imageView.tag;
    if (self.imageViewClickBlock) {
        self.imageViewClickBlock(tagTemp);
    }

}


//创建label
-(void)createLabelWithPositionFlag:(NSInteger)positionFlag Title:(NSArray *)titleArr{
    UILabel* _label = [UILabel new];
    _label.tag = _labelTag + 100;
    _label.frame = CGRectMake( positionFlag % 3 * hadesViewWidth/3 , positionFlag / 3 * hadesViewHeight/3 , hadesViewWidth/3 , hadesViewHeight/3 );
    NSLog(@"%@",NSStringFromCGRect(_label.frame));
    _label.text = [NSString stringWithFormat:@"%@",titleArr[_labelTag]];
    [self addSubview:_label];
    
    _labelTag = _labelTag + 1;
    
}

//创建btn
-(void)createBtnWithPositionFlag:(NSInteger)positionFlag Title:(NSArray *)titleArr{
    UIButton* _btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btn.tag = _btnTag + 200;
    _btn.frame = CGRectMake( positionFlag % 3 * hadesViewWidth/3 , positionFlag / 3 * hadesViewHeight/3 , hadesViewWidth/3 , hadesViewHeight/3 );
    NSLog(@"%@",NSStringFromCGRect(_btn.frame));
    [_btn setTitle:[NSString stringWithFormat:@"%@",titleArr[_btnTag]] forState:UIControlStateNormal];
    [self addSubview:_btn];
    [_btn addTarget:self action:@selector(btnCLick:) forControlEvents:UIControlEventTouchUpInside];
    
    _btnTag = _btnTag + 1 ;
    
}

//创建imageView
-(void)createImageViewWithPositionFlag:(NSInteger)positionFlag TitleAndImage:(NSArray *)imageArr{
    UIImageView* _imageView = [UIImageView new];
    _imageView.backgroundColor = [UIColor blueColor];
    _imageView.frame = CGRectMake( positionFlag % 3 * hadesViewWidth/3 , positionFlag / 3 * hadesViewHeight/3 , hadesViewWidth/3 , hadesViewHeight/3 );
    NSLog(@"%@",NSStringFromCGRect(_imageView.frame));
    [_imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",imageArr[_imageViewTag]]]];
    _imageView.userInteractionEnabled = YES;
    [self addSubview:_imageView];
    
    _imageView.tag = _imageViewTag + 300;
    
    //初始化一个手势
    UITapGestureRecognizer *imageViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewClick:)];
    NSLog(@"手势--%p", imageViewTap);
    //为图片添加手势
    [_imageView addGestureRecognizer:imageViewTap];
    
    imageViewTap.view.tag = _imageViewTag + 300;

    _imageViewTag = _imageViewTag + 1;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"----------%@ \n  %@", _imageView, _imageView.gestureRecognizers);
    });
}

//整形判断
- (BOOL)isPureInt:(NSString *)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}


// 步骤4 在`layoutSubviews`方法中设置子控件的`frame`（在该方法中一定要调用`[super layoutSubviews]`方法）
- (void)layoutSubviews
{
    [super layoutSubviews];

}

// 步骤6 在该`setter`方法中取出模型属性，给对应的子控件赋值
- (void)setModel:(HadesViewModel *)model
{
    _model = model;
    
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"触摸---");
}

@end
