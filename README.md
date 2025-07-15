## FusePopup

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](http://cocoapods.org/pods/FusePopup)
[![Platform](https://img.shields.io/badge/platform-%20iOS11.0+%20-lightgrey.svg)](http://cocoapods.org/pods/FusePopup)
[![Version](https://img.shields.io/badge/pod-v2.0.0-brightgreen.svg)](http://cocoapods.org/pods/FusePopup)
<a href="https://swift.org/package-manager/"><img src="https://img.shields.io/badge/SPM-supported-DE5C43.svg?style=flat"></a>

FusePopup makes it easy to present custom popup views in your iOS app. It supports customizable animations, flexible placement, mask effects, keyboard handling, and more. The API is clean, simple, and developer-friendly.

### Version 2.0

FusePopup 2.0 is a complete redesign and refactor of the original version. Some APIs from 1.0 are no longer compatible, so please upgrade carefully.

The new version is more concise, extensible, and stable. Check out the demo project for details.

## Requirements

- iOS 11.0+ / Mac OS X 10.13+ / tvOS 10.0+
- Xcode 10.0+
- Swift 5.0+

## Installation

### CocoaPods
FusePopup is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
platform :ios, '11.0'
use_frameworks!

target 'You Project' do
    pod 'FusePopup', '~> 2.0'
end
```

Then run `pod install`

### Swift Package Manager

[Swift Package Manager](https://swift.org/package-manager/) makes it easy to add FusePopup to your project.

#### Using Xcode:
- File > Swift Packages > Add Package Dependency
- Add `https://github.com/snail-z/FusePopup.git`
- Select "Up to Next Major" with "2.0.0"

#### Using Package.swift:

```swift
dependencies: [
    .package(url: "https://github.com/snail-z/FusePopup.git", .upToNextMajor(from: "2.0.0"))
]
```
Run swift build to fetch and integrate the package..

#### Manual Integration

If you prefer not to use either of the aforementioned dependency managers, you can integrate FusePopup into your project manually.

## Usage

- To present a custom popup, your view must conform to the `PopupPresentable` protocol:

  ```swift
  import FusePopup
  
  class ExampleView: UIView {}
  
  extension ExampleView: PopupPresentable {
      
      func preferredPopupSize(in container: UIView) -> CGSize {
          return CGSize(width: 300, height: 300)
      }
  }
  ```

- You can fully customize placement, animation, mask style, and more:

  ```swift
  var config = PopupConfiguration()
  config.coverStyle = .color(.black.withAlphaComponent(0.7))
  config.placement = .center
  config.dismissOnMaskTap = true
  config.animationType = .selectBy(enter: .slide(.top), exit: .slide(.bottom))
  
  PopupPresenter.show(exampleView, in: self.view, config: config)
  
- PopupConfiguration Options

  ```swift
  public struct PopupConfiguration {
  
      /// Mask style
      public enum CoverStyle {
          case none
          case color(UIColor)
          case blur(UIBlurEffect.Style)
      }
  
      /// Mask appearance (default: semi-transparent black)
      public var coverStyle: CoverStyle = .color(.black.withAlphaComponent(0.5))
  
      /// Popup placement
      public enum Placement {
          case top, left, bottom, right, center
      }
  
      /// Popup position (default: center)
      public var placement: Placement = .center
  
      /// Offset adjustment for placement
      public var placementOffset: CGFloat = .zero
  
      /// Dismiss on mask tap (default: true)
      public var dismissOnMaskTap: Bool = true
  
      /// Auto dismiss delay (0 means never auto dismiss)
      public var autoDismissDelay: TimeInterval = 0
  
      /// Animation type
      public enum AnimationType: Equatable {
          case slide(_ direction: PopupSlideAnimator.Direction)
          case scale(_ scale: CGFloat = 0.85)
          case fade
          case none
  
          indirect case selectBy(enter: AnimationType, exit: AnimationType)
      }
  
      /// Animation type
      public var animationType: AnimationType = .none
  
      /// Custom animator
      public var animator: PopupAnimatable?
  
      /// Callbacks
      public var onAutoDismiss: ((UIView) -> ())?
      public var onWillPresent: ((UIView) -> ())?
      public var onDidPresent: ((UIView) -> ())?
      public var onWillDismiss: ((UIView) -> ())?
      public var onDidDismiss: ((UIView) -> ())?
  }
  ```

​	 For more advanced usage, see the demo project.


## Author

snail-z, haozhang0770@163.com

## License

FusePopup is available under the MIT license. See the LICENSE file for more info.
