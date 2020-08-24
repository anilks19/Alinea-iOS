//
//  ExplorePagerView.swift
//  Alinea iOS
//
//  Created by Anil Sharma on 23/08/20.
//  Copyright © 2020 Anil Sharma. All rights reserved.
//

import UIKit

class TabView: UIView {
    
    let titleLbl: UILabel = {
        let titleLbl = UILabel()
        titleLbl.font = UIFont.boldSystemFont(ofSize: 14)
        titleLbl.numberOfLines = 1
        titleLbl.textAlignment = .center
        return titleLbl
    }()
    
    let selectLbl: UILabel = {
        let selectLbl = UILabel()
        return selectLbl
    }()
    
    let selectionButton: UIButton = {
        let selectionButton = UIButton()
        return selectionButton
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
extension TabView {
    
    func addSubviews() {
        self.addSubview(titleLbl)
        self.addSubview(selectLbl)
        self.addSubview(selectionButton)
    }
}

//MARK:- setup view Constraints
extension TabView {
    
    func setupConstraints() {
        titleLbl.snp.makeConstraints({ (make) in
            make.top.equalTo(5)
            make.centerX.equalTo(self)
        })
        
        selectLbl.snp.makeConstraints({ (make) in
            make.bottom.equalTo(0)
            make.height.equalTo(2)
            make.width.equalTo(titleLbl.snp.width)
            make.centerX.equalTo(self)
        })
        
        selectionButton.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.bottom.equalTo(0)
        })
    }
}


//MARK:- Set tab selection
extension TabView {
    func setSelected(_ selected: Bool) {
        
        // Configure the view for the selected state
        selectionButton.isSelected = selected
        if selected {
            self.titleLbl.textColor = UIColor.AlineaBlueColor()
            self.selectLbl.backgroundColor = UIColor.AlineaBlueColor()
        }else {
            self.titleLbl.textColor = UIColor.alineaGrayColor()
            self.selectLbl.backgroundColor = UIColor.clear
        }
        
    }
}
