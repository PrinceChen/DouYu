//
//  AnchorGroup.swift
//  DouYu
//
//  Created by prince.chen on 2017/3/2.
//  Copyright © 2017年 prince.chen. All rights reserved.
//

import UIKit

class AnchorGroup: NSObject {
    
    var room_list: [[String: NSObject]]? {
        didSet {
            guard let room_list = room_list else {
                return
            }
            
            for dict in room_list {
                anchors.append(AnchorModel(dict: dict))
            }
        }
    }
    var tag_name: String = ""
    var icon_name: String = "home_header_normal"
    
    // 定义主播的模型对象数组
    lazy var anchors: [AnchorModel] = [AnchorModel]()
    
    
    override init() {
        
    }
    
    init(dict: [String: NSObject]) {
        super.init()
        
        setValuesForKeys(dict)
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
//    override func setValue(_ value: Any?, forKey key: String) {
//        if key == "room_list" {
//            if let dataArray = value as? [[String: NSObject]] {
//                for dict in dataArray {
//                    
//                }
//            }
//        }
//    }
}