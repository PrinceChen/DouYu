//
//  AmuseViewModel.swift
//  DouYu
//
//  Created by prince.chen on 2017/3/3.
//  Copyright © 2017年 prince.chen. All rights reserved.
//

import UIKit

class AmuseViewModel {
    lazy var anchorGroups:[AnchorGroup] = [AnchorGroup]()
    
}

extension AmuseViewModel {
    func loadAmuseData(finishedCallback: @escaping() -> ()) {
        NetworkTools.requestData(type: .get, URLString: "http://capi.douyucdn.cn/api/v1/getHotRoom/2") { (result) in
            guard let resultDict = result as? [String : NSObject] else { return }
            
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else {return}
            
            for dict in dataArray {
                self.anchorGroups.append(AnchorGroup(dict: dict))
            }
            
            
            finishedCallback()
        }
    }
}
