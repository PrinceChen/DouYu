//
//  RecommendViewModel.swift
//  DouYu
//
//  Created by prince.chen on 2017/3/2.
//  Copyright © 2017年 prince.chen. All rights reserved.
//

import UIKit

class RecommendViewModel {

}


extension RecommendViewModel {
    func requestData() {
        
        // 1. 请求推荐数据
        
        // 2.请求颜值数据
        
        // 3.请求后面部分游戏数据
        
        NetworkTools.requestData(type: .get, URLString: "http://httpbin.org/get", parameters: ["name" : "why"]) { (result) in
            print(result)
        }
    }
}
