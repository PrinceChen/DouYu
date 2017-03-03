//
//  FunnyViewController.swift
//  DouYu
//
//  Created by prince.chen on 2017/3/3.
//  Copyright © 2017年 prince.chen. All rights reserved.
//

import UIKit

private let kTopMargin: CGFloat = 10

class FunnyViewController: BaseMenuViewController {

    
     fileprivate lazy var funnyVM: FunnyViewModel = FunnyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension FunnyViewController {
    
    override func loadData() {
        
        baseVM = funnyVM
        funnyVM.loadFunnyData {
            self.collectionView.reloadData()
            
            var tempGroups = self.funnyVM.anchorGroups
            tempGroups.removeFirst()
            self.menuView.groups = tempGroups
        }
    }
}

//// MARK: another 
//class FunnyViewController: BaseAnchorViewController {
//    fileprivate lazy var funnyVM: FunnyViewModel = FunnyViewModel()
//
//}
//
//extension FunnyViewController {
//    override func setupUI() {
//        super.setupUI()
//        
//        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.headerReferenceSize = CGSize.zero
//        collectionView.contentInset = UIEdgeInsets(top: kTopMargin, left: 0, bottom: 0, right: 0)
//    }
//}
//
//extension FunnyViewController {
//
//    override func loadData() {
//
//        baseVM = funnyVM
//        funnyVM.loadFunnyData {
//            self.collectionView.reloadData()
//        }
//    }
//}
