//
//  RecommendViewModel.swift
//  DouYu
//
//  Created by prince.chen on 2017/3/2.
//  Copyright © 2017年 prince.chen. All rights reserved.
//

import UIKit

class RecommendViewModel {

    lazy var anchorGroups: [AnchorGroup] = [AnchorGroup]()
    fileprivate lazy var bigDataGroup: AnchorGroup = AnchorGroup()
    fileprivate lazy var prettyGroup: AnchorGroup = AnchorGroup()

}


extension RecommendViewModel {
    func requestData(_ finishiedCallback: @escaping () -> ()) {
        let parameters = ["limit" : "4", "offset": "0", "time": NSDate.getCurrentTime() as NSString]
        
        let disGroup = DispatchGroup.init()
        
        disGroup.enter()
        
        // 1. 请求推荐数据
        NetworkTools.requestData(type: .get, URLString: "http://capi.douyucdn.cn/api/v1/getbigDataRoom", parameters: ["time": NSDate.getCurrentTime() as NSString]) { (result) in
            guard let resultDict = result as? [String: NSObject] else {
                return
            }
            
            guard let dataArray = resultDict["data"] as? [[String: NSObject]] else { return }
            
            
            self.bigDataGroup.tag_name = "最热"
            self.bigDataGroup.icon_name = "home_header_hot"
            
            for dict in dataArray {
                let anchor = AnchorModel(dict: dict)
                self.bigDataGroup.anchors.append(anchor)
            }
            
            
            disGroup.leave()
            print("1的数据都请求到")
        }
        
        // 2.请求颜值数据
        disGroup.enter()

        NetworkTools.requestData(type: .get, URLString: "http://capi.douyucdn.cn/api/v1/getVerticalRoom", parameters: parameters) { (result) in
            
            guard let resultDict = result as? [String: NSObject] else {
                return
            }
            
            guard let dataArray = resultDict["data"] as? [[String: NSObject]] else { return }
            
            
            self.prettyGroup.tag_name = "颜值"
            self.prettyGroup.icon_name = "home_header_phone"
            
            for dict in dataArray {
                let anchor = AnchorModel(dict: dict)
                self.prettyGroup.anchors.append(anchor)
            }
            
            disGroup.leave()
            print("2的数据都请求到")
        }
        
        // 3.请求后面部分游戏数据
        //"http://capi.douyucdn.cn/api/v1/getHotCate?limit=4&offset=0&time"
        print(NSDate.getCurrentTime())
        
        disGroup.enter()

        NetworkTools.requestData(type: .get, URLString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: parameters) { (result) in
//            print(result)
            
            guard let resultDict = result as? [String: NSObject] else {
                return
            }
            
            guard let dataArray = resultDict["data"] as? [[String: NSObject]] else { return }
            
            for dict in dataArray {
                let group = AnchorGroup(dict: dict)
                self.anchorGroups.append(group)
            }
            
            for group in self.anchorGroups {
                for anchor in group.anchors {
                    print(anchor.nickname)
                }
                print("______")
            }
            
            disGroup.leave()
            print("3的数据都请求到")
        }
        
        // 排序数据

        disGroup.notify(queue: DispatchQueue.main) { 
            print("所有的数据都请求到")
            self.anchorGroups.insert(self.prettyGroup, at: 0)
            self.anchorGroups.insert(self.bigDataGroup, at: 0)
            finishiedCallback()
        }
    }
}
