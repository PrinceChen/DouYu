//
//  NetworkTools.swift
//  DouYu
//
//  Created by prince.chen on 2017/3/2.
//  Copyright © 2017年 prince.chen. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case get
    case post
}

class NetworkTools {
    class func requestData(type: HTTPMethod, URLString: String, parameters: [String : NSString]? = nil, finishedCallback: @escaping (_ result : Any) -> ()) {
//        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        // 2.发送网络请求
//        Alamofire.request(URLString, parameters: parameters).responseJSON { (response) in
//            
//            // 3.获取结果
//            guard let result = response.result.value else {
//                print(response.result.error)
//                return
//            }
//            
//            // 4.将结果回调出去
//            finishedCallback(result)
//        }
        
        Alamofire.request(URLString, method: type, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            
            // 3.获取结果
            guard let result = response.result.value else {
                print(response.result.error)
                return
            }
            
            // 4.将结果回调出去
            finishedCallback(result)
        }
    }
    
    
}
