//
//  CollectionBaseCell.swift
//  DouYu
//
//  Created by prince.chen on 2017/3/3.
//  Copyright © 2017年 prince.chen. All rights reserved.
//

import UIKit

class CollectionBaseCell: UICollectionViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var onlineBtn: UIButton!
    @IBOutlet weak var nickNameBtn: UIButton!
    
    var anchor: AnchorModel? {
        didSet {
            guard let anchor = anchor else {return}
            
            
            var onlineStr: String = ""
            if anchor.online >= 10000 {
                onlineStr = "\(Int(anchor.online / 10000))万"
            } else {
                onlineStr = "\(Int(anchor.online))"
            }
            
            onlineBtn.setTitle(onlineStr, for: .normal)
            
            nickNameBtn.setTitle(anchor.nickname, for: .normal)
            
            
            guard let iconURL = URL(string: anchor.vertical_src) else {
                return
            }
            iconImageView.kf.setImage(with: iconURL)
        }
    }
}
