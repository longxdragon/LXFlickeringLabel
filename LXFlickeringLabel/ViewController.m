//
//  ViewController.m
//  LXFlickeringLabel
//
//  Created by gkoudai_xl on 15/7/20.
//  Copyright (c) 2015年 longxdragon. All rights reserved.
//

#import "ViewController.h"
#import "LXFlickeringLabel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet LXFlickeringLabel *flickeringLabelOne;
@property (weak, nonatomic) IBOutlet LXFlickeringLabel *flickeringLabelTwo;
@property (weak, nonatomic) IBOutlet LXFlickeringLabel *flickeringLabelThree;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.flickeringLabelOne.flickeringGap = 0.2;
    
    self.flickeringLabelThree.flickeringGap = 0.1;
    self.flickeringLabelThree.flickeringAnimationDuration = 3.f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
