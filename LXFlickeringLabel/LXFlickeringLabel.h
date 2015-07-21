//
//  LXFlickeringLabel.h
//  LXFlickeringLabel
//
//  Created by gkoudai_xl on 15/7/20.
//  Copyright (c) 2015年 longxdragon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXFlickeringLabel : UILabel

@property (nonatomic, assign) CGFloat flickeringGap; // default is 0.05. Max is 1.0. Min is 0.0

@property (nonatomic, assign) CGFloat flickeringAnimationDuration; // default is 2.0

@end
