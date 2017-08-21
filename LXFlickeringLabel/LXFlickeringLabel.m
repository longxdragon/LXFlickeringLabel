//
//  LXFlickeringLabel.m
//  LXFlickeringLabel
//
//  Created by gkoudai_xl on 15/7/20.
//  Copyright (c) 2015年 longxdragon. All rights reserved.
//

#import "LXFlickeringLabel.h"

@interface LXFlickeringLabel () <CAAnimationDelegate>

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation LXFlickeringLabel

- (id)init {
    if (self = [super init]) {
        [self setUp];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setUp];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    _flickeringGap               = 0.05f;
    _flickeringAnimationDuration = 2.0f;
    
    [self reloadData];
}

- (void)reloadData
{
    // 创建CAGradientLayer
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.frame = self.bounds;
    
    // 设置梯度颜色
    self.gradientLayer.colors = @[(__bridge id)[[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor,
                                  (__bridge id)[UIColor whiteColor].CGColor,
                                  (__bridge id)[[UIColor clearColor] colorWithAlphaComponent:0.5].CGColor];
    // 设置梯度颜色的位置
    self.gradientLayer.locations = @[@(0), @(_flickeringGap), @(_flickeringGap*2)];
    
    // 这是颜色渐变的方向
    self.gradientLayer.startPoint = CGPointMake(0, 0);
    self.gradientLayer.endPoint = CGPointMake(1, 0);
    
    // 设置为mask，iOS8之后，也可以设置self.maskView
    self.layer.mask = self.gradientLayer;
    
    // 做动画
    [self doAnimation];
}

- (void)doAnimation {
    [self.gradientLayer removeAnimationForKey:@"slide"];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"locations"];
    animation.fromValue = @[@(0), @(_flickeringGap), @(_flickeringGap*2)];
    animation.toValue   = @[@(1-_flickeringGap*2), @(1-_flickeringGap), @(1)];
    animation.duration  = _flickeringAnimationDuration;
    animation.removedOnCompletion = YES;
    animation.delegate = self;
    [self.gradientLayer addAnimation:animation forKey:@"slide"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        [self doAnimation];
    }
}

#pragma mark - Public

- (void)setFlickeringGap:(CGFloat)flickeringGap {
    _flickeringGap = flickeringGap;
    [self reloadData];
}

- (void)setFlickeringAnimationDuration:(CGFloat)flickeringAnimationDuration {
    _flickeringAnimationDuration = flickeringAnimationDuration;
    [self reloadData];
}

@end
