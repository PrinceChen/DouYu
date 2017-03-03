//
//  BaseViewController.swift
//  DouYu
//
//  Created by prince.chen on 2017/3/3.
//  Copyright © 2017年 prince.chen. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var contentView: UIView?
    
    fileprivate lazy var animateImageView: UIImageView = { [unowned self] in
        let imageView = UIImageView(image: UIImage(named:"dyla_img_loading_1"))
        imageView.center = self.view.center
        imageView.animationImages = [UIImage(named:"dyla_img_loading_1")!, UIImage(named:"dyla_img_loading_2")!, UIImage(named:"dyla_img_loading_3")!, UIImage(named:"dyla_img_loading_4")! ]
        imageView.animationDuration = 0.5
        imageView.animationRepeatCount = LONG_MAX
        imageView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin]
        return imageView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension BaseViewController {
    func setupUI() {
        
        contentView?.isHidden = true
        
        view.addSubview(animateImageView)
        
        animateImageView.startAnimating()
        
        view.backgroundColor = UIColor(r: 245, g: 245, b: 245)

    }
    
    func loadDataFinished() {
        animateImageView.stopAnimating()
        
        animateImageView.isHidden = true
        
        contentView?.isHidden = false
    }
}
