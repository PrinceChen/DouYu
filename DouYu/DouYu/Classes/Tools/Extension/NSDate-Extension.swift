//
//  NSDate-Extension.swift
//  DouYu
//
//  Created by prince.chen on 2017/3/2.
//  Copyright © 2017年 prince.chen. All rights reserved.
//

import Foundation

extension NSDate {
    class func getCurrentTime()-> String {
        let nowDate = NSDate()
        
        let interval = nowDate.timeIntervalSince1970
        
        return "\(interval)"
    }
}
