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


// MARK: - Constants
fileprivate let kScrollLineH: CGFloat = 2
fileprivate let kNormalColor: (CGFloat, CGFloat, CGFloat) = (85, 85, 85)
fileprivate let kSelectedColor: (CGFloat, CGFloat, CGFloat) = (255, 128, 0)



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
            label.textColor = UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)
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
        firstLabel.textColor = UIColor(r: kSelectedColor.0, g: kSelectedColor.1, b: kSelectedColor.2)
        
        
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x , y: frame.height - kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)

    }
}

extension PageTitleView {
    @objc fileprivate func titleLabelClick(tapGes: UITapGestureRecognizer)  {
//        print(#function)
        
        
        
        guard let currentLabel = tapGes.view as? UILabel else {return}
        
        if currentLabel.tag == currentIndex{ return }
        
        let oldLabel = titlesLabels[currentIndex]
        
        currentLabel.textColor = UIColor(r: kSelectedColor.0, g: kSelectedColor.1, b: kSelectedColor.2)
        oldLabel.textColor = UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)
        
        currentIndex = currentLabel.tag
        
        let scrollLineX = CGFloat(currentLabel.tag) * scrollLine.frame.width
        
        UIView.animate(withDuration: 0.15) { 
            self.scrollLine.frame.origin.x = scrollLineX
        }
        
        delegate?.pageTitleView(titleView: self, selectedIndex: currentIndex)
        
    }
}

extension PageTitleView {
    func setTitleWithProgress(progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        let sourceLabel = titlesLabels[sourceIndex]
        let targetLabel = titlesLabels[targetIndex]
        
        let moveTotalX = targetLabel.frame.origin.x - sourceLabel.frame.origin.x
        let moveX = moveTotalX * progress
        
        scrollLine.frame.origin.x = sourceLabel.frame.origin.x + moveX
        
        // 颜色渐变
        let colorDelta = (kSelectedColor.0 - kNormalColor.0, kSelectedColor.1 - kNormalColor.1, kSelectedColor.2 - kNormalColor.2)
        
        sourceLabel.textColor = UIColor(r: kSelectedColor.0 - colorDelta.0 * progress, g: kSelectedColor.1 - colorDelta.1 * progress, b: kSelectedColor.2 - colorDelta.2 * progress)
        
        targetLabel.textColor = UIColor(r: kNormalColor.0 + colorDelta.0 * progress, g: kNormalColor.1 + colorDelta.1 * progress, b: kNormalColor.2 + colorDelta.2 * progress)
        
        currentIndex = targetIndex
    }
}














