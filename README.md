# SwiftGuideView

基于SwiftPageView](https://github.com/jackiehu/SwiftPageView)的启动引导页。在相应的页面调用静态方法并配置适配器即可。

```swift
            SwiftGuideView.showGuide(pageArray: ["1","2","3","4","5"], fromVC: self) { (c) in
                c.openButtonTitle = "进入APP"
                c.isDebug = true
            }
```

API

```swift
    /// 启动引导
    /// - Parameters:
    ///   - pageArray: 图片名称数组
    ///   - fromVC: 从哪个页面启动
    ///   - deploy: 配置器
    public static func showGuide(pageArray : [String], fromVC : UIViewController, deploy : ConfigBlock)
```

适配器

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

| ![](1.png) | ![](2.png) |
| ---------- | ---------- |
|            |            |



### 安装支持

#### cocoapods导入

```ruby
pod 'SwiftGuideView'
```

#### SPM导入

`https://github.com/jackiehu/SwiftGuideView`

#### 手动导入

