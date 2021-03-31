# SwiftGuideView

[![Version](https://img.shields.io/cocoapods/v/SwiftGuideView.svg?style=flat)](http://cocoapods.org/pods/SwiftGuideView)
[![SPM](https://img.shields.io/badge/SPM-supported-DE5C43.svg?style=flat)](https://swift.org/package-manager/)
![Xcode 11.0+](https://img.shields.io/badge/Xcode-11.0%2B-blue.svg)
![iOS 11.0+](https://img.shields.io/badge/iOS-11.0%2B-blue.svg)
![Swift 5.0+](https://img.shields.io/badge/Swift-5.0%2B-orange.svg)

基于[SwiftPageView](https://github.com/jackiehu/SwiftPageView) 的启动引导页。在相应的页面调用静态方法并配置适配器即可。

```swift
            SwiftGuideView.showGuide(pageArray: ["1","2","3","4","5"], fromVC: self) { (c) in
                c.openButtonTitle = "进入APP"
                c.isDebug = true
            }
```

### API

```swift
    /// 启动引导
    /// - Parameters:
    ///   - pageArray: 图片名称数组
    ///   - fromVC: 从哪个页面启动
    ///   - deploy: 配置器
    public static func showGuide(pageArray : [String], fromVC : UIViewController, deploy : ConfigBlock)
```

### 适配器

```swift
public class GuideConfig {
    ///是否每次都展示
    public var isDebug : Bool = false
    /// 按钮标题
    public var openButtonTitle : String?
    /// 按钮字体颜色
    public var openButtonFont : UIFont = .systemFont(ofSize: 17)
    /// 按钮标题颜色
    public var openButtonTitleColor : UIColor = .white
    /// 按钮宽高
    public var openButtonSize : CGSize = .init(width: 190, height: 50)
    /// 按钮圆角
    public var openButtonRadius : CGFloat = 25
    /// 按钮背景色
    public var openButtonColor : UIColor = .orange
    /// 按钮 距离底部
    public var openButtonOffSetY : CGFloat = 50
    
    /// pageControl 未选中颜色
    public var pageControlInactiveColor = UIColor.white
    /// pageControl 选中颜色
    public var pageControlActiveColor = UIColor.red
    /// pageControl 距离底部
    public var pageControlOffSetY : CGFloat = 50
    
}
```

| ![](Image/1.png) | ![](Image/2.png) |
| ---------------- | ---------------- |
|                  |                  |



## 安装

### cocoapods

1.在 Podfile 中添加 `pod ‘SwiftGuideView’`

2.执行 `pod install 或 pod update`

3.导入 `import SwiftGuideView`

### Swift Package Manager

从 Xcode 11 开始，集成了 Swift Package Manager，使用起来非常方便。SwiftGuideView 也支持通过 Swift Package Manager 集成。

在 Xcode 的菜单栏中选择 `File > Swift Packages > Add Pacakage Dependency`，然后在搜索栏输入

`https://github.com/jackiehu/SwiftGuideView`，即可完成集成

### 手动集成

SwiftGuideView 也支持手动集成，只需把Sources文件夹中的SwiftGuideView文件夹拖进需要集成的项目即可



## 更多砖块工具加速APP开发

[![ReadMe Card](https://github-readme-stats.vercel.app/api/pin/?username=jackiehu&repo=SwiftBrick&theme=radical&locale=cn)](https://github.com/jackiehu/SwiftBrick)

[![ReadMe Card](https://github-readme-stats.vercel.app/api/pin/?username=jackiehu&repo=SwiftMediator&theme=radical&locale=cn)](https://github.com/jackiehu/SwiftMediator)

[![ReadMe Card](https://github-readme-stats.vercel.app/api/pin/?username=jackiehu&repo=SwiftShow&theme=radical&locale=cn)](https://github.com/jackiehu/SwiftShow)

[![ReadMe Card](https://github-readme-stats.vercel.app/api/pin/?username=jackiehu&repo=SwiftLog&theme=radical&locale=cn)](https://github.com/jackiehu/SwiftLog)

[![ReadMe Card](https://github-readme-stats.vercel.app/api/pin/?username=jackiehu&repo=SwiftyForm&theme=radical&locale=cn)](https://github.com/jackiehu/SwiftyForm)

[![ReadMe Card](https://github-readme-stats.vercel.app/api/pin/?username=jackiehu&repo=SwiftEmptyData&theme=radical&locale=cn)](https://github.com/jackiehu/SwiftEmptyData)

[![ReadMe Card](https://github-readme-stats.vercel.app/api/pin/?username=jackiehu&repo=SwiftPageView&theme=radical&locale=cn)](https://github.com/jackiehu/SwiftPageView)

[![ReadMe Card](https://github-readme-stats.vercel.app/api/pin/?username=jackiehu&repo=JHTabBarController&theme=radical&locale=cn)](https://github.com/jackiehu/JHTabBarController)

[![ReadMe Card](https://github-readme-stats.vercel.app/api/pin/?username=jackiehu&repo=SwiftMesh&theme=radical&locale=cn)](https://github.com/jackiehu/SwiftMesh)

[![ReadMe Card](https://github-readme-stats.vercel.app/api/pin/?username=jackiehu&repo=SwiftNotification&theme=radical&locale=cn)](https://github.com/jackiehu/SwiftNotification)

[![ReadMe Card](https://github-readme-stats.vercel.app/api/pin/?username=jackiehu&repo=SwiftButton&theme=radical&locale=cn)](https://github.com/jackiehu/SwiftButton)

[![ReadMe Card](https://github-readme-stats.vercel.app/api/pin/?username=jackiehu&repo=SwiftDatePicker&theme=radical&locale=cn)](https://github.com/jackiehu/SwiftDatePicker)
