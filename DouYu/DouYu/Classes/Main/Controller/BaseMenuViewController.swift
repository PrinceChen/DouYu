//
//  BaseMenuViewController.swift
//  DouYu
//
//  Created by prince.chen on 2017/3/3.
//  Copyright © 2017年 prince.chen. All rights reserved.
//

import UIKit

private let kMenuViewH: CGFloat = 200


class BaseMenuViewController: BaseAnchorViewController {

//    fileprivate lazy var amuseVM: AmuseViewModel = AmuseViewModel()
    lazy var menuView: AmuseMenuView = {
        let menuView = AmuseMenuView.amuseMenuView()
        menuView.frame = CGRect(x: 0, y: -kMenuViewH, width: kScreenW, height: kMenuViewH)
        
        return menuView
    }()
}

extension BaseMenuViewController {
    override func setupUI() {
        super.setupUI()
        
        collectionView.addSubview(menuView)
        
        collectionView.contentInset = UIEdgeInsets(top: kMenuViewH, left: 0, bottom: 0, right: 0)
        
        
    }
}

//extension BaseMenuViewController {
//    
//    override func loadData() {
//        
//        baseVM.loadAmuseData {
//            self.collectionView.reloadData()
//            
//            var tempGroups = self.amuseVM.anchorGroups
//            tempGroups.removeFirst()
//            self.menuView.groups = tempGroups
//        }
//    }
//}
