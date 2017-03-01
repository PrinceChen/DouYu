//
//  PageTitleView.swift
//  DouYu
//
//  Created by prince.chen on 2017/3/1.
//  Copyright © 2017年 prince.chen. All rights reserved.
//

import UIKit

private let kScrollLineH: CGFloat = 2

class PageTitleView: UIView {

    fileprivate var titles: [String]
    
    fileprivate lazy var titlesLabels: [UILabel] = [UILabel]()
    
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    
    fileprivate lazy var scrollLine: UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()
    
    init(frame: CGRect, titles: [String]) {
        self.titles = titles
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension PageTitleView {
    fileprivate func setupUI() {
        
        addSubview(scrollView)
        scrollView.frame = bounds
        
        setupTitleLabels()
        
        setupBottomMenuAndScrollLine()
    }
    
    fileprivate func setupTitleLabels() {
        
        let labelW: CGFloat = frame.width / CGFloat(titles.count)
        let labelH: CGFloat = frame.height - kScrollLineH
        let labelY: CGFloat = 0
        
        
        for (index, title) in titles.enumerated() {
            let label = UILabel()
            
            label.text = title
            label.tag = index
            
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = UIColor.darkGray
            label.textAlignment = .center
            
            let labelX: CGFloat = labelW * CGFloat(index)


            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)

            scrollView.addSubview(label)
            titlesLabels.append(label)
        }
    }
    
    fileprivate func setupBottomMenuAndScrollLine() {
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        
        let lineH: CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        addSubview(bottomLine)
     
        guard let firstLabel = titlesLabels.first else {return}
        firstLabel.textColor = UIColor.orange
        
        
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x , y: frame.height - kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)

    }
}














