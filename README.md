[![Pub.dev package](https://img.shields.io/badge/pub.dev-scroll__positioned-blue)](https://pub.dev/packages/scroll_positioned)
[![GitHub repository](https://img.shields.io/badge/GitHub-ScrollPositioned--flutter-blue?logo=github)](https://github.com/DrafaKiller/ScrollPositioned-flutter)

# Scroll Positioned

Allows you to position widgets fixed along with a scroll. It can be positioned relative to the parent widget, or the absolute position.´
Best used with a Scrollable, like a ListView, but can be used on its own.

This uses the widgets `Positioned` and `Stack`, if there isn't a stack it will create one for you.

For the absolute position, this uses the widget `Transform.translate`.

## Features

* Fix a widget in a scrollable widget.
* Works in horizontal and vertical scrollable.
* Set the position relative to the top, left, right or bottom.
* Set the size.
* Use `ScrollPositioned.extend` to extend the widget relative to the parent widget.
* Use `ScrollPositioned.absolute` to set the position to the absolute position.

## Getting started

Install it using pub:
```
dart pub add scroll_positioned
```

And import the package:
```dart
import 'package:scroll_positioned/scroll_positioned.dart';
```

## Usage

To have the widget fixed where it is, all you need to do is:

```dart
ScrollPositioned(
  child: ... ,
);
```

Set the position relative to the `top`, `left`, `right` or `bottom` of the parent widget:

```dart
ScrollPositioned(
  top: 50,
  left: 0,
  right: 0,

  child: ... ,
);
```

Set the size of the widget with `width` and `height`, or use `ScrollPosition.extend` to extend relative to the parent widget:

```dart
ScrollPositioned(
  width: 100,
  height: 100,

  child: ... ,
);

ScrollPositioned.extend(
  child: ... ,
);
```

Position the widget to the absolute position, `bottom` and `right` cannot be set:

```dart 
ScrollPositioned.absolute(
  top: 100,
  left: 100,

  child: ... ,
);
```

For flexibility, a scroll controller can be passed, if not then it will try to find one:
```dart
final scrollController = ScrollController();
ScrollPositioned(
  controller: scrollController,
  child: ... ,
);
```

In some cases, when using `ScrollPositioned.absolute`, if the children of the parent change sizes, making the widget move position, the absolute position will not update unless it's built again, one frame after.

## Examples

<br>

<p align="center">
  <img src="https://user-images.githubusercontent.com/42767829/172643871-f366b2a8-731a-4f1f-98cb-87eead37fe8a.gif" width=200>
  <img src="https://user-images.githubusercontent.com/42767829/172622987-8503d003-8c15-496a-b654-40c520441c15.gif" width=200>
  <img src="https://user-images.githubusercontent.com/42767829/172634476-7bcdf257-bb36-4530-8912-8f0d4a9dbee3.gif" width=200>
</p>