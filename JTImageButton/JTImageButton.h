//
//  JTImageButton.h
//  JTImageButton
//
//  Created by Jakub Truhlar on 10.05.15.
//  Copyright (c) 2015 Jakub Truhlar. All rights reserved.
//

#import <UIKit/UIKit.h>

static CGFloat JTImageButtonIconHeightDefault = 0.0;
static CGFloat JTImageButtonIconOffsetYNone = 0.0;

@interface JTImageButton : UIButton

typedef enum {
    JTImageButtonPaddingNone = 0,
    JTImageButtonPaddingSmall,
    JTImageButtonPaddingMedium,
    JTImageButtonPaddingBig
} JTImageButtonPadding;

typedef enum {
    JTImageButtonIconSideLeft = 0,
    JTImageButtonIconSideRight
} JTImageButtonIconSide;

/**
 The title color of the button represented as a UIColor. The default title color is orange.
 */
@property (nonatomic, strong) UIColor *titleColor;

/**
 Icon should be overlayed with color. The default iconColor is nil. Final image quality could be different.
 */
@property (nonatomic, assign) UIColor *iconColor;

/**
 The background color of the button repreented as a UIColor. The default title color is clear.
 */
@property (nonatomic, strong) UIColor *bgColor;

/**
 Horizontal padding between title and icon. The default cornerRadius is JTImageButtonPaddingSmall.
 */
@property (nonatomic, assign) JTImageButtonPadding padding;

/**
 The float value of corner radius. The default cornerRadius is 3.0f.
 */
@property (nonatomic, assign) CGFloat cornerRadius;

/**
 The border color of the button represented as a UIColor. The default border color is orange.
 */
@property (nonatomic, strong) UIColor *borderColor;

/**
 The border width of the button represented as a float. The default border width is 1.0f.
 */
@property (nonatomic, assign) CGFloat borderWidth;

/**
 The side where the icon is displeyed within title. The default iconSide is JTImageButtonIconSideLeft.
 */
@property (nonatomic, assign) JTImageButtonIconSide iconSide;

/**
 The alpha of the button when highlighted. The default highlightAlpha is 0.7f.
 */
@property (nonatomic, assign) CGFloat highlightAlpha;

/**
 The alpha of the button when disabled. The default disableAlpha is 0.5f.
 */
@property (nonatomic, assign) CGFloat disableAlpha;

/**
 The effect of the button when touched. The default touchEffectEnabled is NO.
 */
@property (nonatomic, assign) BOOL touchEffectEnabled;

/**
 Title of the button - Default: @""
 Icon of the button (nil for text centered horizontally) - Default: nil
 TitleFont of the title also taken for vertical alignment of the icon within the title - Default: System, 25.0f
 IconHeight if you wish to resize your UIImage (Keeping aspect ratio) - Final image quality could be different - Default: JTImageButtonIconHeightDefault (Scaled by title to be +/- the same height)
 IconOffsetY if you need to move icon vertically, negative values allowed. Default: JTImageButtonIconOffsetYNone
 */
- (void)createTitle:(NSString *)titleText withIcon:(UIImage *)iconImage font:(UIFont *)titleFont iconHeight:(CGFloat)iconHeight iconOffsetY:(CGFloat)iconOffsetY;

/**
 Without IconHeight if you wish to let icon image as is (Original size)
 */
- (void)createTitle:(NSString *)titleText withIcon:(UIImage *)iconImage font:(UIFont *)titleFont iconOffsetY:(CGFloat)iconOffsetY;

@end
