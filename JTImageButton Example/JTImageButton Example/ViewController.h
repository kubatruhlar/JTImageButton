//
//  ViewController.h
//  JTImageButton Example
//
//  Created by Jakub Truhlar on 13.05.15.
//  Copyright (c) 2015 Jakub Truhlar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTImageButton.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet JTImageButton *btnTick;
@property (weak, nonatomic) IBOutlet JTImageButton *btnCross;
@property (weak, nonatomic) IBOutlet JTImageButton *btnMagnifier;
@property (weak, nonatomic) IBOutlet JTImageButton *btnFour;
@property (weak, nonatomic) IBOutlet JTImageButton *btnFive;

@end