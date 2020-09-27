import UIKit
import SnapKit
import SwiftPageView
import JXPageControl

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
    
    lazy var pageControl: JXPageControlJump = {
        let pageControl = JXPageControlJump()
        // JXPageControlType: default property
        pageControl.currentPage = 0
        pageControl.progress = 0.0
        pageControl.hidesForSinglePage = false
        pageControl.contentAlignment = JXPageControlAlignment(.center,
                                                              .center)
        pageControl.contentMode = .center
        pageControl.isInactiveHollow = false
        pageControl.isActiveHollow = false
        pageControl.isAnimation  = true
        return pageControl
    }()
    
    lazy var pageView: PageView = {
        let pageView = PageView()
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
        
        pageControl.snp.makeConstraints { (m) in
            m.left.right.equalToSuperview()
            m.height.equalTo(40)
            m.bottom.equalToSuperview().offset(-50)
        }
        
        openButton.snp.makeConstraints { (m) in
            m.centerX.equalToSuperview()
            m.height.equalTo(50)
            m.width.equalTo(190)
            m.bottom.equalToSuperview().offset(-50)
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
    
    public func pageViewDidScroll(_ pageView: PageView, scrollProgress: CGFloat) {
        pageControl.progress = scrollProgress
    }
    
    public func pageView(_ pageView: PageView, willScrollToItemAt index: Int) {
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
    }
    
}

extension SwiftGuideView {
    
    /// 启动引导
    /// - Parameters:
    ///   - pageArray: 图片名称数组
    ///   - fromVC: 从哪个页面启动
    ///   - deploy: 配置器
    public static func showGuide(pageArray : [String], fromVC : UIViewController, deploy : ConfigBlock){
        if (!(UserDefaults.standard.bool(forKey: "everLaunched"))) {
            UserDefaults.standard.set(true, forKey:"everLaunched")
            let model = GuideConfig()
            deploy(model)
            
            let vc = SwiftGuideView()
            
            vc.pageControl.inactiveColor = model.pageControlInactiveColor
            vc.pageControl.activeColor = model.pageControlActiveColor
            vc.pageControl.inactiveSize = model.pageControlInactiveSize
            vc.pageControl.activeSize = model.pageControlActiveSize
            vc.pageControl.columnSpacing = model.pageControlColumnSpacing
            
            vc.openButton.titleLabel?.font = model.openButtonFont
            vc.openButton.setTitle(model.openButtonTitle, for: .normal)
            vc.openButton.setTitleColor(model.openButtonTitleColor, for: .normal)
            vc.openButton.layer.cornerRadius = model.openButtonRadius
            vc.openButton.backgroundColor = model.openButtonColor
            
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
    
    /// pageControl 未选中颜色
    public var pageControlInactiveColor = UIColor.white
    /// pageControl 选中颜色
    public var pageControlActiveColor = UIColor.red
    /// pageControl 未选中大小
    public var pageControlInactiveSize = CGSize(width: 10, height: 10)
    /// pageControl 选中大小
    public var pageControlActiveSize = CGSize(width: 20, height: 10)
    /// pageControl 间距
    public var pageControlColumnSpacing : CGFloat = 10
}
