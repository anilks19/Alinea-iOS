//
//  ExplorePagerView.swift
//  Alinea iOS
//
//  Created by Anil Sharma on 23/08/20.
//  Copyright © 2020 Anil Sharma. All rights reserved.
//

import UIKit

class ExplorePagerView: UIView {
    
    let categoryTab: TabView = {
        let categoryTab = TabView()
        categoryTab.titleLbl.text = "Category"
        categoryTab.selectionButton.tag = 0
        return categoryTab
    }()
    
    let seperatorOne: UILabel = {
        let seperatorOne = UILabel()
        seperatorOne.backgroundColor = UIColor.AlineaSeperatorColor()
        return seperatorOne
    }()
    
    let themesTab: TabView = {
        let themesTab = TabView()
        themesTab.titleLbl.text = "Themes"
        themesTab.selectionButton.tag = 1
        return themesTab
    }()
    
    let seperatorTwo: UILabel = {
        let seperatorTwo = UILabel()
        seperatorTwo.backgroundColor = UIColor.AlineaSeperatorColor()
        return seperatorTwo
    }()
    
    let trendingTab: TabView = {
        let trendingTab = TabView()
        trendingTab.titleLbl.text = "Trending"
        trendingTab.selectionButton.tag = 2
        return trendingTab
    }()
    
    //MARK:- Init View
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
        self.setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK:- add Subviews
extension ExplorePagerView {
    
    func addSubviews() {
        self.addSubview(categoryTab)
        self.addSubview(seperatorOne)
        self.addSubview(themesTab)
        self.addSubview(seperatorTwo)
        self.addSubview(trendingTab)
    }
}

//MARK:- setup view Constraints
extension ExplorePagerView {
    
    func setupConstraints() {
        
        categoryTab.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.leading.equalTo(0)
            make.width.equalTo(themesTab.snp.width)
        })
        
        seperatorOne.snp.makeConstraints({ (make) in
            make.top.equalTo(10.5)
            make.bottom.equalTo(-10.5)
            make.leading.equalTo(categoryTab.snp.trailing)
            make.width.equalTo(1)
        })
        
        themesTab.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.leading.equalTo(seperatorOne.snp.trailing)
            make.width.equalTo(categoryTab.snp.width)
        })
        
        seperatorTwo.snp.makeConstraints({ (make) in
            make.top.equalTo(10.5)
            make.bottom.equalTo(-10.5)
            make.leading.equalTo(themesTab.snp.trailing)
            make.width.equalTo(1)
        })
        
        trendingTab.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.leading.equalTo(seperatorTwo.snp.trailing)
            make.trailing.equalTo(0)
            make.width.equalTo(categoryTab.snp.width)
        })
    }
}
