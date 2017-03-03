//
//  AmuseMenuViewCell.swift
//  DouYu
//
//  Created by prince.chen on 2017/3/3.
//  Copyright © 2017年 prince.chen. All rights reserved.
//

import UIKit

private let kGameCellID = "kGameCellID"

class AmuseMenuViewCell: UICollectionViewCell {
    
    var groups: [AnchorGroup]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        autoresizingMask = UIViewAutoresizing()

        
        collectionView.register(UINib(nibName:"CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        let itemW = collectionView.bounds.width / 4
        let itemH = collectionView.bounds.height / 2
        
        layout.itemSize = CGSize(width: itemW, height: itemH)
        
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
    }
}



extension AmuseMenuViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! CollectionGameCell
        
//        cell.backgroundColor = UIColor.randomColor()
        
        cell.baseGame = groups![indexPath.item]
        
        cell.clipsToBounds = true
        
        return cell
    }
}
