import UIKit
import SwiftPageView
import SnapKit
public class SwiftGuideView: UIViewController {
    
    public typealias ConfigBlock = ((_ config : GuideConfig) -> Void)
    
    var pageArray : [String]?{
        didSet{
            guard let array = pageArray else {
                return
            }
            pageView.reloadData()
            pageControl.numberOfPages = array.count
        }
    }
    
    var config : GuideConfig?{
        didSet{
            guard let model = config else {
                return
            }
            
            pageControl.pageIndicatorTintColor = model.pageControlInactiveColor
            pageControl.currentPageIndicatorTintColor = model.pageControlActiveColor

            openButton.titleLabel?.font = model.openButtonFont
            openButton.setTitle(model.openButtonTitle, for: .normal)
            openButton.setTitleColor(model.openButtonTitleColor, for: .normal)
            openButton.layer.cornerRadius = model.openButtonRadius
            openButton.backgroundColor = model.openButtonColor

            view.layoutIfNeeded()
        }
    }
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.hidesForSinglePage = false
        pageControl.contentMode = .center
        return pageControl
    }()
    
    lazy var pageView: PageView = {
        let pageView = PageView(frame: UIScreen.main.bounds)
        pageView.dataSource = self
        pageView.delegate = self
        pageView.isInfinite = false
        pageView.itemSize =  UIScreen.main.bounds.size
        return pageView
    }()
    
    
    lazy var openButton: UIButton = {
        let btn = UIButton()
        btn.clipsToBounds = true
        btn.isHidden = true
        btn.addTarget(self, action: #selector(disMissGuide), for: .touchUpInside)
        return btn
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(pageView)
        view.addSubview(pageControl)
        view.addSubview(openButton)
        
        pageView.snp.makeConstraints { (m) in
            m.edges.equalToSuperview()
        }
        
        pageControl.snp.remakeConstraints { (m) in
            m.left.right.equalToSuperview()
            m.height.equalTo(40)
            m.bottom.equalToSuperview().offset(-(config?.pageControlOffSetY ?? 50))
        }
        
        openButton.snp.remakeConstraints { (m) in
            m.centerX.equalToSuperview()
            m.size.equalTo(config?.openButtonSize ?? .init(width: 200, height: 50))
            m.bottom.equalToSuperview().offset(-(config?.openButtonOffSetY ?? 50))
        }
    }

}

extension SwiftGuideView:  PageViewDataSource, PageViewDelegate {
    
    public func numberOfItems(in pageView: PageView) -> Int {
        guard let array = pageArray else {
            return 0
        }
        return array.count
    }
    
    public func pageView(_ pageView: PageView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = pageView.dequeueReusableCell(PageCell.self, indexPath: indexPath)
        if let name = pageArray?[indexPath.row] {
            cell.imageView.image = UIImage(named: name)
        }
        return cell
    }
    
    public func pageView(_ pageView: PageView, didScrollToItemAt index: Int) {

        guard let array = pageArray else {
            return
        }
        
        if index + 1 >= array.count{
            openButton.isHidden = false
            pageControl.isHidden = true
        }else{
            openButton.isHidden = true
            pageControl.isHidden = false
        }
        
        pageControl.currentPage = index
        
    }

}

extension SwiftGuideView {
    
    /// 启动引导
    /// - Parameters:
    ///   - pageArray: 图片名称数组
    ///   - fromVC: 从哪个页面启动
    ///   - deploy: 配置器
    public static func showGuide(pageArray : [String], fromVC : UIViewController, deploy : ConfigBlock){
        let model = GuideConfig()
        deploy(model)
        
        if !(UserDefaults.standard.bool(forKey: "everLaunched")) || model.isDebug == true {
            UserDefaults.standard.set(true, forKey:"everLaunched")

            let vc = SwiftGuideView()
            vc.config = model
            vc.pageArray = pageArray
            
            vc.modalPresentationStyle = .fullScreen
            fromVC.present(vc, animated: false) { }
        }
    }
    
    @objc func disMissGuide(){
        dismiss(animated: false) { }
    }
}

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
