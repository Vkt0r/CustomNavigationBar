
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat
            )](http://mit-license.org)
[![Language](http://img.shields.io/badge/language-swift-orange.svg?style=flat
             )](https://developer.apple.com/swift)
[![Platform](http://img.shields.io/badge/platform-ios-lightgrey.svg?style=flat
             )](https://developer.apple.com/resources/)

# CustomNavigationBar
An `UINavigationBar` extension which allows you to change its appearance dynamically in Swift.

## Getting Started

There's this very interesting library called [LTNavigationBar](https://github.com/ltebean/LTNavigationBar) by [Leo](https://github.com/ltebean) which has become very popular amongst iOS developers, but it has written in Objective-C.

I've chosen to write it in `Swift` as it can be highly optimized by the compiler. The two demo projects are written in `Swift` to demonstrate how it works.

## Purpose
The main purpose of this library is change the appearance of an `UINavigationBar` dynamically 😅


## Examples
#### 1. Changing the background color:
![LTNavigationbar](https://raw.githubusercontent.com/ltebean/LTNavigationBar/master/images/demo.gif)


#### 2. Making navigation bar scroll along with a scroll view:
![LTNavigationbar](https://raw.githubusercontent.com/ltebean/LTNavigationBar/master/images/demo2.gif)

## Usage

The extension includes four methods that helps to change `UINavigationBar` appearance dynamically:
```swift
func _setBackgroundColor(color: UIColor)
func setTranslationY(translation: CGFloat)
func setAlphaElements(alpha: CGFloat)
func reset() 
```

It's recommended that in the `viewWillDisappear`, you should call this method to avoid any side effects:
```swift
override func viewWillDisappear(animated: Bool) {
   super.viewWillDisappear(animated)
   self.navigationController?.navigationBar.reset()
}
```

You can see the two demo projects for know how to use it.

