//
//  BaseViewModel.swift
//  DouYu
//
//  Created by prince.chen on 2017/3/3.
//  Copyright © 2017年 prince.chen. All rights reserved.
//

import UIKit

class BaseViewModel {
    lazy var anchorGroups:[AnchorGroup] = [AnchorGroup]()

}

extension BaseViewModel {
    func loadAnchorData(URLString: String, parameters: [String: Any]? = nil, finishedCallback: @escaping () -> ()) {
        
        NetworkTools.requestData(type: .get, URLString: URLString) { (result) in
            guard let resultDict = result as? [String : Any] else { return }
            
            guard let dataArray = resultDict["data"] as? [[String : Any]] else {return}
            
            for dict in dataArray {
                self.anchorGroups.append(AnchorGroup(dict: dict))
            }
            
            
            finishedCallback()
        }

    }
}
