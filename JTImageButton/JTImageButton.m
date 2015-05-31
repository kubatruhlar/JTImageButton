//
//  JTImageButton.m
//  JTImageButton
//
//  Created by Jakub Truhlar on 10.05.15.
//  Copyright (c) 2015 Jakub Truhlar. All rights reserved.
//

#import "JTImageButton.h"

@interface JTImageButton()

@property (nonatomic, strong) NSString *titleText;
@property (nonatomic, strong) UIImage *iconImage;
@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, assign) CGFloat iconHeight;
@property (nonatomic, assign) CGFloat iconOffsetY;

@end

#define kDefaultFontSize 25.0
#define kFlatGreenColor [UIColor colorWithRed:46/255.0f green:204/255.0f blue:113/255.0f alpha:1.0f]

@implementation JTImageButton

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if ((self = [super initWithCoder:aDecoder])) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if ((self = [super initWithFrame:frame])) {
        [self initialize];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    if (highlighted) {
        self.alpha = _highlightAlpha;
    } else {
        self.alpha = 1.0;
    }
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    if (selected) {
        self.alpha = _highlightAlpha;
    } else {
        self.alpha = 1.0;
    }
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    
    if (enabled) {
        self.alpha = 1.0;
    } else {
        self.alpha = _disableAlpha;
    }
}

- (void)createTitle:(NSString *)titleText withIcon:(UIImage *)iconImage font:(UIFont *)titleFont iconHeight:(CGFloat)iconHeight iconOffsetY:(CGFloat)iconOffsetY {
    
    self.titleText = titleText;
    self.iconImage = iconImage;
    self.titleFont = titleFont;
    self.iconHeight = iconHeight;
    self.iconOffsetY = iconOffsetY;
    
    self.borderWidth = 1.0;
    self.cornerRadius = 3.0;
    
    [self initialize];
}

- (void)createTitle:(NSString *)titleText withIcon:(UIImage *)iconImage font:(UIFont *)titleFont iconOffsetY:(CGFloat)iconOffsetY {
    
    [self createTitle:titleText withIcon:iconImage font:titleFont iconHeight:iconImage.size.height iconOffsetY:iconOffsetY];
}

- (void)initialize {
    [self defaultSetup];
    
    // Basics
    [self setTitleColor:_titleColor forState:UIControlStateNormal];
    [self.titleLabel setFont:_titleFont];
    [self setBackgroundColor:_bgColor];
    [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    
    // Borders
    [self.layer setCornerRadius:_cornerRadius];
    [self.layer setMasksToBounds:true];
    [self.layer setBorderWidth:_borderWidth];
    [self.layer setBorderColor:_borderColor.CGColor];
    
    // Icon overlay
    if (_iconColor && _iconImage) {
        _iconImage = [self overlayImage:_iconImage withColor:_iconColor];
    }
    
    // Create whole title
    [self setAttributedTitle:[self createStringWithImage:_iconImage string:_titleText color:_titleColor iconPosition:_iconSide padding:_padding andIconOffsetY:_iconOffsetY] forState:UIControlStateNormal];
    [self setNeedsLayout];
    
    [self layoutIfNeeded];
    
    // Simple effect
    UIControlEvents applyEffectEvents = UIControlEventTouchDown | UIControlEventTouchDragInside | UIControlEventTouchDragEnter;
    [self removeTarget:self action:@selector(applyTouchEffect) forControlEvents:applyEffectEvents];
    [self addTarget:self action:@selector(applyTouchEffect) forControlEvents:applyEffectEvents];
    
    UIControlEvents dismissEffectEvents = UIControlEventTouchUpInside | UIControlEventTouchUpOutside | UIControlEventTouchDragOutside | UIControlEventTouchDragExit | UIControlEventTouchCancel;
    [self removeTarget:self action:@selector(dismissTouchEffect) forControlEvents:dismissEffectEvents];
    [self addTarget:self action:@selector(dismissTouchEffect) forControlEvents:dismissEffectEvents];
}

#pragma mark - Touch effect
- (void)applyTouchEffect {
    if (_touchEffectEnabled) {
        [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.transform = CGAffineTransformMakeScale(1.05, 1.05);
        } completion:nil];
    }
}

- (void)dismissTouchEffect {
    if (_touchEffectEnabled) {
        [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.transform = CGAffineTransformMakeScale(1.0, 1.0);
        } completion:nil];
    }
}

#pragma mark - Default setup
- (void)defaultSetup {
    if (!_titleColor) { _titleColor = kFlatGreenColor;}
    if (!_bgColor) { _bgColor = [UIColor clearColor];}
    if (!_padding) { _padding = JTImageButtonPaddingSmall;}
    if (!_cornerRadius) { _cornerRadius = 0.0;}
    if (!_borderColor) { _borderColor = kFlatGreenColor;}
    if (!_borderWidth) { _borderWidth = 0.0;}
    if (!_iconSide) { _iconSide = JTImageButtonIconSideLeft;}
    
    if (!_highlightAlpha) { _highlightAlpha = 0.7;}
    if (!_disableAlpha) { _disableAlpha = 0.5;}
    if (!_touchEffectEnabled) { _touchEffectEnabled = false;}
}

#pragma mark - JTImageButton logic
- (NSAttributedString *)createStringWithImage:(UIImage *)image string:(NSString *)string color:(UIColor *)color iconPosition:(JTImageButtonIconSide)iconSide padding:(CGFloat)padding andIconOffsetY:(CGFloat)iconOffsetY {
    
    NSMutableAttributedString *finalString;
    
    if (iconSide == JTImageButtonIconSideRight) {
        //Right
        finalString = [NSMutableAttributedString new];
        
        NSDictionary *attributes = @{NSForegroundColorAttributeName : color};
        NSAttributedString *aString;
        
        if (padding == JTImageButtonPaddingSmall) {
            aString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ ", string] attributes:attributes];
        } else if (padding == JTImageButtonPaddingMedium){
            aString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@  ", string] attributes:attributes];
        } else if (padding == JTImageButtonPaddingBig){
            aString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@   ", string] attributes:attributes];
        } else {
            aString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@", string] attributes:attributes];
        }
        
        [finalString appendAttributedString:aString];
        
        NSTextAttachment *attachment = [NSTextAttachment new];
        attachment.image = image;
        attachment.bounds = CGRectMake(0, iconOffsetY, attachment.image.size.width, attachment.image.size.height);
        
        NSAttributedString *attachmentString = [NSAttributedString attributedStringWithAttachment:attachment];
        [finalString appendAttributedString:attachmentString];
        
    } else {
        // Left
        NSTextAttachment *attachment = [NSTextAttachment new];
        attachment.image = image;
        
        attachment.bounds = CGRectMake(0, iconOffsetY, attachment.image.size.width, attachment.image.size.height);
        NSAttributedString *attachmentString = [NSAttributedString attributedStringWithAttachment:attachment];
        
        finalString = [[NSMutableAttributedString alloc] initWithAttributedString:attachmentString];
        
        NSDictionary *attributes = @{NSForegroundColorAttributeName : color};
        NSAttributedString *aString;
        
        if (padding == JTImageButtonPaddingSmall && _iconImage) {
            aString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@" %@", string] attributes:attributes];
        } else if (padding == JTImageButtonPaddingMedium && _iconImage){
            aString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"  %@", string] attributes:attributes];
        } else if (padding == JTImageButtonPaddingBig && _iconImage){
            aString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"   %@", string] attributes:attributes];
        } else {
            aString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@", string] attributes:attributes];
        }
        
        [finalString appendAttributedString:aString];
    }
    
    return finalString;
}

#pragma mark - Working with image icon
- (UIImage *)overlayImage:(UIImage *)source withColor:(UIColor *)color {
    
    UIGraphicsBeginImageContextWithOptions(source.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [color setFill];
    
    CGContextTranslateCTM(context, 0, source.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGContextSetBlendMode(context, kCGBlendModeColorBurn);
    CGRect rect = CGRectMake(0, 0, source.size.width, source.size.height);
    CGContextDrawImage(context, rect, source.CGImage);
    
    CGContextSetBlendMode(context, kCGBlendModeSourceIn);
    CGContextAddRect(context, rect);
    CGContextDrawPath(context,kCGPathFill);
    
    UIImage *coloredImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return coloredImage;
}

- (UIImage *)scaleImage:(UIImage *)image proportionallyToHeight:(CGFloat)height {
    
    CGFloat finalScale = image.size.height / height;
    UIImage *scaledImage = [UIImage imageWithCGImage:[image CGImage] scale:(image.scale * finalScale) orientation:(image.imageOrientation)];
    return scaledImage;
}

#pragma mark - Setters
- (void)setTitleText:(NSString *)titleText {
    _titleText = titleText;
    if (!_titleText) {
        _titleText = @"";
    }
}

- (void)setIconImage:(UIImage *)iconImage {
    _iconImage = iconImage;
}

- (void)setTitleFont:(UIFont *)titleFont {
    _titleFont = titleFont;
    if (!_titleFont) {
        _titleFont = [UIFont systemFontOfSize:kDefaultFontSize];
    }
}

- (void)setIconHeight:(CGFloat)iconHeight {
    
    // Get early frame
    [self.titleLabel setFont:_titleFont];
    [self layoutIfNeeded];
    
    if (iconHeight == JTImageButtonIconHeightDefault) {
        _iconHeight = MIN(fabs([_titleFont pointSize]), _iconImage.size.height);
    } else {
        _iconHeight = MIN(iconHeight, _iconImage.size.height);
    }
    
    if (!_iconImage) {
        return;
    }
    if (_iconImage.size.height > _iconHeight) {
        _iconImage = [self scaleImage:_iconImage proportionallyToHeight:_iconHeight];
    }
}

- (void)setIconOffsetY:(CGFloat)iconOffsetY {
    _iconOffsetY = iconOffsetY;
    
    if (!_iconImage) {
        return;
    }
    
    // A heavy calculation
    CGFloat titleLabelAndFontSizeDiff = self.titleLabel.frame.size.height - [_titleFont pointSize];
    _iconOffsetY = (-1 * ((([_titleFont pointSize] + (titleLabelAndFontSizeDiff / 2)) - _iconHeight) / 2)) - titleLabelAndFontSizeDiff / 2 + iconOffsetY;
    // Correction for icon that is no longer resizing (It is in it's MAXIMUM)
    if ([_titleFont pointSize] > _iconHeight) {
        _iconOffsetY = (-1 * ((([_titleFont pointSize] + (titleLabelAndFontSizeDiff / 2)) - _iconHeight) / 2)) - titleLabelAndFontSizeDiff / 2 + ([_titleFont pointSize] - _iconHeight) + iconOffsetY;
    }
    
    [self initialize];
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    [self initialize];
}

- (void)setBgColor:(UIColor *)bgColor {
    _bgColor = bgColor;
    [self initialize];
}

- (void)setPadding:(JTImageButtonPadding)padding {
    _padding = padding;
    [self initialize];
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = fabs(cornerRadius);
    [self initialize];
}

- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    [self initialize];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = fabs(borderWidth);
    [self initialize];
}

- (void)setIconSide:(JTImageButtonIconSide)iconSide {
    _iconSide = iconSide;
    [self initialize];
}

- (void)setIconColor:(UIColor *)iconColor {
    _iconColor = iconColor;
    [self initialize];
}

- (void)setHighlightAlpha:(CGFloat)highlightAlpha {
    _highlightAlpha = fabs(highlightAlpha);
    [self initialize];
}

- (void)setDisableAlpha:(CGFloat)disableAlpha {
    _disableAlpha = fabs(disableAlpha);
    [self initialize];
}

- (void)setTouchEffectEnabled:(BOOL)touchEffectEnabled {
    _touchEffectEnabled = touchEffectEnabled;
    [self initialize];
}

@end