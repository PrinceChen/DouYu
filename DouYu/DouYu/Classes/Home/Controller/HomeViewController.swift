//
//  HomeViewController.swift
//  DouYu
//
//  Created by prince.chen on 2017/3/1.
//  Copyright © 2017年 prince.chen. All rights reserved.
//

import UIKit


private let kTitleViewH: CGFloat = 40

class HomeViewController: UIViewController {
    
    fileprivate lazy var pageTitleView: PageTitleView = {
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐", "手游", "娱乐", "游戏", "趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
//        titleView.backgroundColor = .orange
        return titleView
    }()
    
    fileprivate lazy var pageContentView: PageContentView = {
        
        let contentH = kScreenH - kStatusBarH - kNavigationBarH - kTitleViewH
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH, width: kScreenW, height: contentH)
        
        var childVcs = [UIViewController]()
        
        for _ in 0 ..< 5 {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childVcs.append(vc)
        }
        
        
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self)
        
        return contentView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}


// MARK: - set UI
extension HomeViewController {
    fileprivate func setupUI() {
        automaticallyAdjustsScrollViewInsets = false
        
        setupNavigationBar()
        
        view.addSubview(pageTitleView)
        
        view.addSubview(pageContentView)
        pageContentView.backgroundColor = .purple
    }
    
    private func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "homeLogoIcon")
        
        let size = CGSize(width: 35, height: 35)

        let historyItem = UIBarButtonItem(imageName: "viewHistoryIcon", highlightedImageName: "viewHistoryIconHL", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "scanIcon", highlightedImageName: "scanIconHL", size: size)
        let searchItem = UIBarButtonItem(imageName: "searchBtnIcon", highlightedImageName: "searchBtnIconHL", size: size)

        
        navigationItem.rightBarButtonItems = [searchItem, qrcodeItem, historyItem]
        
    }
    
}









