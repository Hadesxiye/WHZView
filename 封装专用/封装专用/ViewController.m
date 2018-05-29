//
//  ViewController.m
//  封装专用
//
//  Created by 王浩祯 on 2018/5/25.
//  Copyright © 2018年 王浩祯. All rights reserved.
//

#import "ViewController.h"
#import "HadesView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray* labelArr = [NSArray arrayWithObjects:@"第一个label",@"第二个label", nil];
    NSArray* btnArr = [NSArray arrayWithObjects:@"第一个btn",@"第二个btn", nil];
    NSArray* imageArr = [NSArray arrayWithObjects:@"01.jpg", nil];
    
    HadesView* view = [[HadesView alloc]initWithViewFrame:CGRectMake(0, 10, 200, 200) NineNumberFrame:@"123000021" LabelTitle:labelArr btnTitle:btnArr imageViewTitleAndImage:imageArr];
    
    //设置btn的点击事件
    view.btnClickBlock = ^(NSInteger i) {
        NSLog(@"点击了第%ld个btn",i - 200);
    };
    
    view.imageViewClickBlock = ^(NSInteger i) {
        NSLog(@"点击了第%ld张图片",i - 300);
    };
    
    
    [self.view addSubview:view];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
