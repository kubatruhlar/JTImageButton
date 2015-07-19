[![Version](https://img.shields.io/cocoapods/v/JTImageButton.svg)](http://cocoapods.org/pods/JTImageButton)
[![License](https://img.shields.io/cocoapods/l/JTImageButton.svg)](http://cocoapods.org/pods/JTImageButton)
[![Platform](https://img.shields.io/cocoapods/p/JTImageButton.svg)](http://cocoapods.org/pods/JTImageButton)

# JTImageButton
With the regular `UIButton` you are able to set title and also image for that button but that content **WILL NOT** be centered horizontally (only title will). 

**JTImageButton** is a `UIButton` subclass that makes **TITLE+IMAGE** work easier. Your image and title together **WILL BE** centered horizontally. You will be also able to resize provided image and change it’s color easier, so basically all you have to provide is a text as a title and image (**NO MORE** image asset editing to get an image that you want in a button).

<h3 align="center">
  <img src="https://github.com/kubatru/JTImageButton/blob/master/Screens/img_example.png" alt="Example"/>
</h3>

## Installation
There are two ways to add the **JTImageButton** library to your project. Add it as a regular library or install it through **CocoaPods**.

`pod 'JTImageButton'`

You may also quick try the example project with

`pod try JTImageButton`

**Library requires target iOS 7.0 and above**

## Usage and Customization

Create UIButton in your `.xib/storyboard` with `IBOutlet` and set class to `JTImageButton` (Also button type should be `Custom`) OR `initWithFrame` if you need it programatically.

Use `- (void)createTitle:withIcon:font:iconHeight:iconOffsetY:`

Or to keep *original image size* use `- (void)createTitle:withIcon:font:iconOffsetY:`

### Standard example:
```objective-c
[self.btn createTitle:@"DONE" 
          withIcon:[UIImage imageNamed:@"icon_tick"] 
          font:nil 
          iconHeight:JTImageButtonIconHeightDefault 
          iconOffsetY:JTImageButtonIconOffsetYNone];
```


### Icon height logic:

`iconHeight` < `original image` -> **scaled**

`iconHeight` >= `original image` -> **original image**

`iconHeight` == `0` OR `JTImageButtonIconHeightDefault` -> **scaled by title**


### Another properties:
```objective-c
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, assign) UIColor *iconColor;
@property (nonatomic, strong) UIColor *bgColor;
@property (nonatomic, strong) UIColor *borderColor;

@property (nonatomic, assign) JTImageButtonPadding padding; // Small/Medium/Big/None
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, assign) CGFloat borderWidth;

@property (nonatomic, assign) JTImageButtonIconSide iconSide; // Left/Right
@property (nonatomic, assign) CGFloat highlightAlpha;
@property (nonatomic, assign) CGFloat disableAlpha;
@property (nonatomic, assign) BOOL touchEffectEnabled;
```

<h3 align="center">
  <img src="https://github.com/kubatru/JTImageButton/blob/master/Screens/with_effect.gif" alt=“With simple effect“ width="320"/>
</h3>

## Changelog

### v1.0.2 - 05.31.15
- [**NEW**] Enable and selected states added
- [**NEW**] Basic touchEffect added

### v1.0.1 - 05.30.15
- [**UPDATE**] Another little refactoring
- [**UPDATE**] README updated

### v1.0.1 - 05.28.15
- [**UPDATE**] Little refactoring

### v1.0.0 - 05.13.15
- [**NEW**] Initial commit

## Author
This library is open-sourced by [Jakub Truhlar](http://kubatruhlar.cz).
    
## License
The MIT License (MIT)
Copyright © 2015 Jakub Truhlar
