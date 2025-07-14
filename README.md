## FusePopup

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](http://cocoapods.org/pods/FusePopup)
[![Platform](https://img.shields.io/badge/platform-%20iOS11.0+%20-lightgrey.svg)](http://cocoapods.org/pods/FusePopup)
[![Version](https://img.shields.io/badge/pod-v2.0.0-brightgreen.svg)](http://cocoapods.org/pods/FusePopup)
<a href="https://swift.org/package-manager/"><img src="https://img.shields.io/badge/SPM-supported-DE5C43.svg?style=flat"></a>

FusePopup can help you pop up custom views easily. It supports custom pop-up animations, layout positions, mask effects, keyboard monitoring,  etc. it API simple and easy to use.  

### Version 2.0

FusePopup 2.0 版本进行了全新的设计和重构。1.0 版本中的某些方法和属性已不再兼容。请谨慎升级。
新版本使用更加简洁、更易扩展维护、更稳定。如果您想了解更多，请下载Demo.

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

### Swift Package Manager

[Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

#### In Xcode:
- File > Swift Packages > Add Package Dependency
- Add `https://github.com/snail-z/FusePopup.git`
- Select "Up to Next Major" with "2.0.0"

#### Package.swift:

```swift
dependencies: [
    .package(url: "https://github.com/snail-z/FusePopup.git", .upToNextMajor(from: "2.0.0"))
]
```
Then run swift build to fetch and integrate the package.

#### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate FusePopup into your project manually.

## Usage

* 若要展示一个弹窗视图，自定义的弹窗视图必须遵守 PopupPresentable 协议：

  ```swift
  import FusePopup
  
  class ExampleView: UIView {}
  
  extension ExampleView: PopupPresentable {
      
      func preferredPopupSize(in container: UIView) -> CGSize {
          return CGSize(width: 300, height: 300)
      }
  }
  ```

- PopupConfiguration

  ```swift
    public struct PopupConfiguration {
        
        /// 遮罩样式 / Cover style
        public enum CoverStyle {
            case none
            case color(UIColor)
            case blur(UIBlurEffect.Style)
        }
        
        /// 遮罩视图样式，默认为黑色半透明 / Cover view style, defaults to semi-transparent black
        public var coverStyle: CoverStyle = .color(.black.withAlphaComponent(0.5))
        
        /// 弹窗最终出现的位置 / Final popup placement
        public enum Placement {
            case top, left, bottom, right, center
        }
        
        /// 弹窗视图的展示位置，默认为 center / Popup placement, defaults to center
        public var placement: Placement = .center
    
        /// 对最终展示位置进行偏移调整 / Offset for placement adjustment
        public var placementOffset: CGFloat = .zero
        
        /// 是否点击遮罩时自动关闭，默认 true / Dismiss on mask tap, default is true
        public var dismissOnMaskTap: Bool = true
        
        /// 自动消失时间，0 表示不自动消失 / Auto dismiss delay, 0 means no auto dismiss
        public var autoDismissDelay: TimeInterval = 0
        
        /// 动画类型 / Animation type
        public enum AnimationType: Equatable {
            case slide(_ direction: PopupSlideAnimator.Direction)
            case scale(_ scale: CGFloat = 0.85)
            case fade
            case none
            
            indirect case selectBy(enter: AnimationType, exit: AnimationType)
        }
        
        /// 动画类型 / Animation type
        public var animationType: AnimationType = .none
        
        /// 自定义动画 / Custom animator
        public var animator: PopupAnimatable?
        
        /// 内部触发关闭时回调 (用于替换默认关闭行为) / Callback when auto dismiss is triggered (override default)
        public var onAutoDismiss: ((UIView) -> ())?//UIView is contentView.
        
        /// 弹窗即将展示时回调 / Callback before popup presents
        public var onWillPresent: ((UIView) -> ())?
        
        /// 弹窗已经展示时回调 / Callback after popup presented
        public var onDidPresent: ((UIView) -> ())?
        
        /// 弹窗即将关闭时回调 / Callback before popup dismisses
        public var onWillDismiss: ((UIView) -> ())?
    
        /// 弹窗已经关闭时回调 / Callback after popup dismissed
        public var onDidDismiss: ((UIView) -> ())?
    }

* 自定义弹出视图的位置、动画、蒙层等

  ```swift
  var config = PopupConfiguration()
  config.coverStyle = .color(.black.withAlphaComponent(0.7))
  config.placement = .center
  config.dismissOnMaskTap = true
  config.animationType = .selectBy(enter: .slide(.top), exit: .slide(.bottom))
  PopupPresenter.show(exampleView, in: self.view, config: config)
  ```

​	 See demo for more usage.


## Author

snail-z, haozhang0770@163.com

## License

FusePopup is available under the MIT license. See the LICENSE file for more info.
