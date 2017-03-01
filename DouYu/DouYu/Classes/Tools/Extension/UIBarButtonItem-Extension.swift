//
//  UIBarButtonItem-Extension.swift
//  DouYu
//
//  Created by prince.chen on 2017/3/1.
//  Copyright © 2017年 prince.chen. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    class func createItem(imageName: String, highlightedImageName: String, size: CGSize) -> UIBarButtonItem {
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: highlightedImageName), for: .highlighted)
        
        btn.frame = CGRect(origin: .zero, size: size)
        
        return UIBarButtonItem(customView: btn)

    }
    
    convenience init(imageName: String, highlightedImageName: String = "", size: CGSize = .zero) {
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), for: .normal)
        
        if highlightedImageName != "" {
            btn.setImage(UIImage(named: highlightedImageName), for: .highlighted)
        }
        
        if size == CGSize.zero {
            btn.sizeToFit()
        } else {
            btn.frame = CGRect(origin: .zero, size: size)
        }
        
        
        
        self.init(customView: btn)
    }
    
}
