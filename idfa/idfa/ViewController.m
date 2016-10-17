//
//  ViewController.m
//  idfa
//
//  Created by mengyijie on 16/10/17.
//  Copyright © 2016年 mengyijie. All rights reserved.
//

#import "ViewController.h"
#import "Tools.h"
#import "MYJLabel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MYJLabel *label = [[MYJLabel alloc]init];
    label.frame = CGRectMake(50, 200, 260, 50);
    label.font = [UIFont systemFontOfSize:13];
    label.backgroundColor = [UIColor redColor];
    label.text = [Tools KeychainIdfa];
    [self.view addSubview:label];
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(50, 280, 280, 30)];
    label1.text = @"长按上面的红色区域可以复制idfa";
    [self.view addSubview:label1];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
