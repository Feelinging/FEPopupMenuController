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

then, you can using `FEPopupMenuItem` initialize `FEPopupMenuController` , support **text** or **text&icon**

``` 
    FEPopupMenuItem *item = [[FEPopupMenuItem alloc] initWithTitle:@"title" iconImage:image action:^{ NSLog(@"selected item1..."); }];
    FEPopupMenuController *popupMenuController = [[FEPopupMenuController alloc] initWithItems:@[item]];
```

Suggest : The title can not be longer than four characters.

### Cocoapods

comming soon...

### Licence

MIT