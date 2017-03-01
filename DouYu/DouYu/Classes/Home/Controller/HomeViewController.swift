//
//  HomeViewController.swift
//  DouYu
//
//  Created by prince.chen on 2017/3/1.
//  Copyright © 2017年 prince.chen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

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
        setupNavigationBar()
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









