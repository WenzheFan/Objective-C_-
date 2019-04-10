//
//  HappyNewYearView.m
//  西藏的雪
//
//  Created by apple on 2019/2/13.
//  Copyright © 2019年 apple. All rights reserved.
//

#import "HappyNewYearView.h"

@implementation HappyNewYearView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createBg];
        [self createLabel];
        [self createSnow];
        [self fireworksEmitterLayer];
    }
    
    return self;
}

/**
 设置背景---UIImageView
 */
- (void)createBg{
    UIImage *baImgae = [UIImage imageNamed:@"back.jpg"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:baImgae];
    imageView.contentMode = UIViewContentModeRedraw;
    imageView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    [self addSubview:imageView];
}
- (void)createLabel{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 50, self.bounds.size.width, 60)];
    label.text = @"大雪飘，虫草肥，雪白草绿湖水清";
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
}
- (void)createSnow{
    // 粒子发射器
    CAEmitterLayer *snowEmitterLayer = [CAEmitterLayer layer];
    
    // 发射器位置
    snowEmitterLayer.emitterPosition = CGPointMake(self.bounds.size.width/2, -20);
    
    // 发射器大小
    snowEmitterLayer.emitterSize = CGSizeMake(self.bounds.size.width * 1.5, 1);
    
    // 轨迹
    snowEmitterLayer.emitterMode = kCAEmitterLayerOutline;
    
    // 发射器的形状
    snowEmitterLayer.emitterShape = kCAEmitterLayerLine;
    
    // 雪花
    CAEmitterCell *snowcell = [CAEmitterCell emitterCell];
    
    // 雪花大小
    snowcell.scale = 0.2;
    // 雪花范围
    snowcell.scaleRange = 0.5;
    // 雪花速度变化因子
    snowcell.birthRate = 20.0;
    // 雪花动画生命周期
    snowcell.lifetime = 60;
    // 雪花速度
    snowcell.velocity = 10;
    // 雪花速度范围
    snowcell.velocityRange = 15;
    
    // 雪花动画 y方向加速度
    snowcell.yAcceleration = 2;
   
    // 雪花发射方向
    snowcell.emissionRange = 0.5 * M_PI;
    
    //自旋转
    snowcell.spinRange = 0.25 * M_PI;
    
    // 背景
    snowcell.contents = CFBridgingRelease([[UIImage imageNamed:@"huohua.png"] CGImage]);
    snowcell.color = [[UIColor colorWithRed:0.6 green:0.68 blue:0.732 alpha:1.0] CGColor];
    snowEmitterLayer.shadowOpacity = 1.0;
    
    snowEmitterLayer.shadowRadius = 0;
    snowEmitterLayer.shadowOffset  = CGSizeMake(0, 1);
    
    snowEmitterLayer.emitterCells = [NSArray arrayWithObjects:snowcell, nil];
    
    [self.layer addSublayer:snowEmitterLayer];
   
}
- (void)fireworksEmitterLayer{
//    烟花发射台
    CAEmitterLayer *fireworksEmitterLayer = [CAEmitterLayer layer];
    fireworksEmitterLayer.emitterPosition = CGPointMake(self.bounds.size.width/2.0,self.bounds.size.height - 200);
    fireworksEmitterLayer.emitterSize = CGSizeMake(self.bounds.size.width/2.0, 0);
    fireworksEmitterLayer.emitterMode = kCAEmitterLayerOutline;
    fireworksEmitterLayer.emitterShape = kCAEmitterLayerLine;
    
    fireworksEmitterLayer.renderMode = kCAEmitterLayerAdditive;
    fireworksEmitterLayer.seed = (arc4random()%100) +1;
//  火箭 --烟花
    CAEmitterCell *rocketCell = [CAEmitterCell emitterCell];
    rocketCell.birthRate = 5.0;
    rocketCell.emissionRange = 0.25 *M_PI;
    rocketCell.velocity = 300;
    rocketCell.velocityRange = 300;
    rocketCell.yAcceleration = 60;
    rocketCell.lifetime = 1.1;
    rocketCell.contents = CFBridgingRelease([[UIImage imageNamed:@"fire.png"] CGImage]);
    rocketCell.scale = 0.2;
    rocketCell.greenRange =1.0;
    rocketCell.redRange = 1.0;
    rocketCell.blueRange = 1.0;
    rocketCell.spinRange = M_PI;
    fireworksEmitterLayer.emitterCells = [NSArray arrayWithObject:rocketCell];
    
  // 爆破
    CAEmitterCell *burstCell = [CAEmitterCell emitterCell];
    burstCell.birthRate = 1.0;
    burstCell.velocity = 0;
    burstCell.scale = 3;
    burstCell.redSpeed = -1.5;
    burstCell.blueSpeed = 1.5;
    burstCell.greenSpeed = 1.0;
    burstCell.lifetime = 0.5;
    rocketCell.emitterCells = [NSArray arrayWithObject:burstCell];
    
    CAEmitterCell *sparkCell = [CAEmitterCell emitterCell];
    sparkCell.birthRate = 300;
    sparkCell.velocity = 100;
    
    sparkCell.emissionRange = 1.5 *M_PI;
    
    sparkCell.yAcceleration = 80 ;
    sparkCell.lifetime = 3;
    
    sparkCell.contents = CFBridgingRelease([[UIImage imageNamed:@"fire.png"] CGImage]);
    
    sparkCell.scale = 0.6;
    sparkCell.scaleSpeed = -0.2;
    
    sparkCell.redSpeed = -0.2;
    sparkCell.blueSpeed = 0.4;
    sparkCell.greenSpeed = -0.1;
    
    sparkCell.alphaSpeed = -0.5;
    
    sparkCell.spin = 2 * M_PI;
    sparkCell.spinRange = 2 * M_PI;
    
    burstCell.emitterCells = [NSArray arrayWithObject:sparkCell];
    
    [self.layer addSublayer:fireworksEmitterLayer];
}
@end
