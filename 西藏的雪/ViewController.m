//
//  ViewController.m
//  西藏的雪
//
//  Created by apple on 2019/2/13.
//  Copyright © 2019年 apple. All rights reserved.
//

#import "ViewController.h"
#import "HappyNewYearView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HappyNewYearView *view = [[HappyNewYearView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.view addSubview:view];
    
    // Do any additional setup after loading the view, typically from a nib.
}


@end
