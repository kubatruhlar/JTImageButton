//
//  ViewController.m
//  JTImageButton Example
//
//  Created by Jakub Truhlar on 13.05.15.
//  Copyright (c) 2015 Jakub Truhlar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:true];
    
    // Some colors
    UIColor *flatGreenColor = [UIColor colorWithRed:46/255.0f green:204/255.0f blue:113/255.0f alpha:1.0f];
    UIColor *flatRedColor = [UIColor colorWithRed:231/255.0f green:76/255.0f blue:60/255.0f alpha:1.0f];
    UIColor *flatBlueColor = [UIColor colorWithRed:52/255.0f green:152/255.0f blue:219/255.0f alpha:1.0f];
    UIColor *flatPurpleColor = [UIColor colorWithRed:155.0f/255.0f green:89.0f/255.0f blue:182.0f/255.0f alpha:1.0];
    UIColor *flatOrangeColor = [UIColor colorWithRed:230.0f/255.0f green:126.0f/255.0f blue:34.0f/255.0f alpha:1.0];
    
    // JTImageButton with storyboard
    // Example one
    [self.btnTick createTitle:@"Centered" withIcon:[UIImage imageNamed:@"icon_tick"] font:nil iconHeight:JTImageButtonIconHeightDefault iconOffsetY:JTImageButtonIconOffsetYNone];
    self.btnTick.iconColor = flatGreenColor;
    
    // Example two
    [self.btnCross createTitle:@"Bigger icon" withIcon:[UIImage imageNamed:@"icon_cross"] font:[UIFont systemFontOfSize:15.0] iconHeight:35.0 iconOffsetY:-20.0];
    self.btnCross.titleColor = flatRedColor;
    self.btnCross.iconColor = flatRedColor;
    self.btnCross.padding = JTImageButtonPaddingMedium;
    self.btnCross.cornerRadius = 6.0;
    self.btnCross.borderWidth = 2.0;
    self.btnCross.borderColor = flatRedColor;
    self.btnCross.iconSide = JTImageButtonIconSideRight;
    
    // Example three
    [self.btnMagnifier createTitle:@"Padding" withIcon:[UIImage imageNamed:@"icon_magnifier"] font:nil iconHeight:JTImageButtonIconHeightDefault iconOffsetY:JTImageButtonIconOffsetYNone];
    self.btnMagnifier.bgColor = flatBlueColor;
    self.btnMagnifier.padding = JTImageButtonPaddingBig;
    self.btnMagnifier.borderWidth = 0.0;
    self.btnMagnifier.cornerRadius = self.btnCross.frame.size.height / 2;
    self.btnMagnifier.iconColor = [UIColor whiteColor];
    self.btnMagnifier.titleColor = [UIColor whiteColor];
    self.btnMagnifier.highlightAlpha = 0.8;
    
    // Example four
    [self.btnFour createTitle:@"Disabled" withIcon:[UIImage imageNamed:@"icon_magnifier"] font:[UIFont systemFontOfSize:21.0] iconHeight:JTImageButtonIconHeightDefault iconOffsetY:JTImageButtonIconOffsetYNone];
    self.btnFour.titleColor = flatPurpleColor;
    self.btnFour.iconColor = flatPurpleColor;
    self.btnFour.padding = JTImageButtonPaddingSmall;
    self.btnFour.borderColor = flatPurpleColor;
    self.btnFour.iconSide = JTImageButtonIconSideLeft;
    self.btnFour.enabled = false;
    
    // Example five
    [self.btnFive createTitle:@"WITH EFFECT" withIcon:[UIImage imageNamed:@"icon_tick"] font:[UIFont systemFontOfSize:21.0] iconHeight:JTImageButtonIconHeightDefault iconOffsetY:1.0];
    self.btnFive.titleColor = flatOrangeColor;
    self.btnFive.iconColor = flatOrangeColor;
    self.btnFive.padding = JTImageButtonPaddingSmall;
    self.btnFive.borderColor = flatOrangeColor;
    self.btnFive.iconSide = JTImageButtonIconSideLeft;
    self.btnFive.touchEffectEnabled = true;
    
    // JTImageButton programatically
//    JTImageButton *btn = [[JTImageButton alloc] initWithFrame:CGRectMake(10, 50, 300, 50)];
//    [btn createTitle:@"DONE" withIcon:[UIImage imageNamed:@"icon_tick"] font:[UIFont systemFontOfSize:21.0] iconHeight:JTImageButtonIconHeightDefault iconOffsetY:1.0];
//    btn.titleColor = flatOrangeColor;
//    btn.iconColor = flatOrangeColor;
//    btn.padding = JTImageButtonPaddingSmall;
//    btn.borderColor = flatOrangeColor;
//    btn.iconSide = JTImageButtonIconSideLeft;
//    [self.view addSubview:btn];
}

@end
