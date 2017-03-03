//
//  CollectionGameCell.swift
//  DouYu
//
//  Created by prince.chen on 2017/3/3.
//  Copyright © 2017年 prince.chen. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionGameCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var titelLabel: UILabel!
    
    var baseGame: BaseGameModel? {
        didSet {
            titelLabel.text = baseGame?.tag_name
            
            if let iconURL = URL(string: baseGame?.icon_url ?? "") {
                iconImageView.kf.setImage(with: iconURL)
            } else {
                iconImageView.image = UIImage(named: "dyla_btn_more")
            }
            
        }
    }
    
//    var group: AnchorGroup? {
//        
//    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
    }

}
