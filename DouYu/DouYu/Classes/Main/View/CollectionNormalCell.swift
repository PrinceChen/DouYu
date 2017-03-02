//
//  CollectionNormalCell.swift
//  DouYu
//
//  Created by prince.chen on 2017/3/2.
//  Copyright © 2017年 prince.chen. All rights reserved.
//

import UIKit

class CollectionNormalCell: CollectionBaseCell {
    @IBOutlet weak var roomNameLabel: UILabel!
    
    override var anchor: AnchorModel? {
        didSet {
            
            super.anchor = anchor
            roomNameLabel.text = anchor?.room_name
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
