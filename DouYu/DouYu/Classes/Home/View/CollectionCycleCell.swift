//
//  CollectionCycleCell.swift
//  DouYu
//
//  Created by prince.chen on 2017/3/3.
//  Copyright © 2017年 prince.chen. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionCycleCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    var cycleModel: CycleModel? {
        didSet {
            let iconURL = URL(string: cycleModel?.pic_url ?? "")!
            
            iconImageView.kf.setImage(with: iconURL)
            
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
