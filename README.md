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

- ##### change title color of each item
  
  You can set `titleColor` to change the title color of each FEPopupMenuItem, respectively.
  
- ##### Screen Rotation
  
  You can call the `moveContentViewToPosition` method to change the location of the nemu in real time.(see demo)

### Cocoapods

```
pod 'FEPopupMenuController'
```

### Licence

MIT