# FEPopupMenuController

A simple, elegant pop-up menu view

![screenshot](https://raw.github.com/Feelinging/FEPopupMenuController/master/screenshot.png)

### Features

- easy to use
- easy to customization
- iOS7+

### Useage

first thing, import the main header file

``` 
#import "FEPopupMenuController.h"
```

then, you can using `FEPopupMenuItem` initialize `FEPopupMenuController` , support **text** or **text&icon** (icon size 15x15 point)

``` 
FEPopupMenuItem *item = [[FEPopupMenuItem alloc] initWithTitle:@"title" iconImage:image action:^{
    NSLog(@"selected item1...");
}];
FEPopupMenuController *popupMenuController = [[FEPopupMenuController alloc] initWithItems:@[item]];
```

Suggest : The title can not be longer than four characters. and item not too much.

show time

``` 
[popupMenuController showInViewController:self atPosition:CGPointMake(100,100);
```

dismiss

```
[popupMenuController dismiss];
```

### Other

you can customize everything

- ##### change title color of each item
  
  You can set `titleColor` to change the title color of each FEPopupMenuItem, respectively.
  
- ##### Screen Rotation
  
  You can call the `moveContentViewToPosition` method to change the location of the nemu in real time.(see demo)

#### more...

```
/**
 *  When selected a item will automatic dismiss the FEPopupMenuController, default is YES.
 */
@property (nonatomic, assign) BOOL automaticDismiss;

/**
 *  the content view width, default is 130.
 */
@property (nonatomic, assign) CGFloat contentViewWidth;

/**
 *  the content view position, default is (0,0)
 */
@property (nonatomic, assign) CGPoint contentViewPosition;

/**
 *  the content view background color, default is white
 */
@property (nonatomic, strong) UIColor *contentViewBackgroundColor;

/**
 *  the content view corner radius, default is 8.0
 */
@property (nonatomic, assign) CGFloat contentViewCornerRadius;

/**
 *  arrow view x position , default is 70% of contentViewWidth
 */
@property (nonatomic, assign) CGFloat arrowX;

/**
 *  arrow of top on content view show or hidden, default is NO (hidden)
 */
@property (nonatomic, assign) BOOL isShowArrow;

```

### CocoaPods

```
pod 'FEPopupMenuController'
```

### Licence

MIT
