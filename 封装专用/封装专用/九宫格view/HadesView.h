//
//  HadesView.h
//  DZZiOS
//
//  Created by 王浩祯 on 2018/5/24.
//

#import <UIKit/UIKit.h>
#import "HadesViewModel.h"

@interface HadesView : UIView
//九宫格view 每个格子可以放一个控件 控件包括label btn imageview
/*
    九宫格自定义view 九个格子任意放置 label btn imageview 一个格子一个
    version v1.0.0 alpha
 
    初始化控件个数输入属性 label 个数
                        btn 个数
                        imageview个数
 
    九宫格内左上角的格子为坐标原点 格式为 x轴坐标y轴坐标
            九宫格坐标分别为   11  12  13
                            21  22  23
                            31  32  33
 
    设置label控件的位置

    设置哦btn的位置
 
    设置imageview的位置

 */
//btn点击事件
@property (nonatomic,copy) void(^btnClickBlock)(NSInteger i);
//iamgeView点击事件
@property (nonatomic,copy) void(^imageViewClickBlock)(NSInteger i);
//子控件
@property (nonatomic, strong) HadesViewModel *model;
@property (nonatomic,strong) UILabel *hadesViewLabel;
@property (nonatomic,strong) UIButton *hadesViewButton;
@property (nonatomic,strong) UIImageView *hadesViewImageview;

/*初始化设置label btn imageview的位置  label为1 btn为2 imageview为3 空为0 从左上角开始
 🌰： 100      输入 100002300；
      002
      300
*/

-(instancetype)initWithViewFrame:(CGRect)viewFrame NineNumberFrame:(NSString *)nineNumberStr LabelTitle:(NSArray *)labelTitleArr btnTitle:(NSArray *)btnTitleArr imageViewTitleAndImage:(NSArray *)imageArr;




//设置btn点击事件

//设置控件在格子中的边距，目前居中
+(void)setMargins:(CGFloat)marginsFloat;












@end

