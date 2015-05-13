# JTImageButton
With the regular UIButton you are able to set title and also image for that button but that content *WILL NOT* be centered horizontally (only title will). 

**JTImageButton** is a UIButton subclass that makes title+image work easier. Your image and title together WILL BE centered horizontally. You will be also able to resize provided image and change it’s color easier, so basically all you have to provide is a text as a title and image (*NO MORE* image asset editing to get an image that you want in a button).

<h3 align="center">
  <img src="https://github.com/kubatru/JTImageButton/blob/master/Screens/img_example.png" alt=“Example”/>
</h3>

## Installation
There are two ways to add the JTImageButton library to your project. Add it as a regular library or install it through CocoaPods.

`pod 'JTImageButton'`

**Library require iOS 7.0 and above target**

## Usage and Customization

Create UIButton in your `.xib/storyboard` with `IBOutlet` and set class to `JTImageButton` (Also button type should be `Custom`) OR `initWithFrame` if you need it programatically.

Use `-(void)createTitle:withIcon:font:iconHeight:iconOffsetY:`

Or to keep *original image size* use `-(void)createTitle:withIcon:font:iconOffsetY:`

**Standard example:**
```objective-c
[self.btn createTitle:@“DONE” 
          withIcon:[UIImage imageNamed:@"icon_tick"] 
          font:nil 
          iconHeight:JTImageButtonIconHeightDefault 
          iconOffsetY:JTImageButtonIconOffsetYNone];
```

**Another properties**
```objective-c
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, assign) UIColor *iconColor;
@property (nonatomic, strong) UIColor *bgColor;

// Small/Medium/Big/None
@property (nonatomic, assign) JTImageButtonPadding padding;
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, assign) CGFloat borderWidth;

// Left/Right
@property (nonatomic, assign) JTImageButtonIconSide iconSide;
@property (nonatomic, assign) CGFloat highlightAlpha;
```

## Changelog
### v1.0.0 - 05.13.15
- [**NEW**] Initial commit

## Author
This library is open-sourced by [Jakub Truhlar](http://kubatruhlar.cz).
    
## License
The MIT License (MIT)
Copyright © 2015 Jakub Truhlar