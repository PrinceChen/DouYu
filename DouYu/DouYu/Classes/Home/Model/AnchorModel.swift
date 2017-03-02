//
//  AnchorModel.swift
//  DouYu
//
//  Created by prince.chen on 2017/3/2.
//  Copyright © 2017年 prince.chen. All rights reserved.
//

import UIKit

class AnchorModel: NSObject {

    var room_id: Int = 0
    var vertical_src: String = ""
    
    // 0: 电脑直播，1：手机直播
    var  isVertical: Int = 0
    
    var room_name: String = ""
    
    var nickname: String = ""
    
    var online: Int = 0
    
    var anchor_city: String = ""
    
    init(dict: [String: NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
