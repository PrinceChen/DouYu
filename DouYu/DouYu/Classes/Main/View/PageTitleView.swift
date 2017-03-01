//
//  PageTitleView.swift
//  DouYu
//
//  Created by prince.chen on 2017/3/1.
//  Copyright © 2017年 prince.chen. All rights reserved.
//

import UIKit

protocol PageTitleViewDelegate: class {
    func pageTitleView(titleView: PageTitleView, selectedIndex index: Int)
}

private let kScrollLineH: CGFloat = 2

class PageTitleView: UIView {

    fileprivate var currentIndex: Int = 0
    fileprivate var titles: [String]
    
    weak var delegate: PageTitleViewDelegate?
    
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
            
            label.isUserInteractionEnabled = true
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(self.titleLabelClick(tapGes:)))
            label.addGestureRecognizer(tapGes)
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

extension PageTitleView {
    @objc fileprivate func titleLabelClick(tapGes: UITapGestureRecognizer)  {
        print(#function)
        guard let currentLabel = tapGes.view as? UILabel else {return}
        
        let oldLabel = titlesLabels[currentIndex]
        
        currentLabel.textColor = UIColor.orange
        oldLabel.textColor = UIColor.darkGray
        
        currentIndex = currentLabel.tag
        
        let scrollLineX = CGFloat(currentLabel.tag) * scrollLine.frame.width
        
        UIView.animate(withDuration: 0.15) { 
            self.scrollLine.frame.origin.x = scrollLineX
        }
        
        delegate?.pageTitleView(titleView: self, selectedIndex: currentIndex)
        
    }
}














