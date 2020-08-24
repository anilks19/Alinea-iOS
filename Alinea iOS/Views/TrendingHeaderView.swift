//
//  TrendingHeaderView.swift
//  Alinea iOS
//
//  Created by Anil Sharma on 23/08/20.
//  Copyright © 2020 Anil Sharma. All rights reserved.
//

import UIKit

class TrendingHeaderView: UIView {
    
    let titleLbl: UILabel = {
        let titleLbl = UILabel()
        titleLbl.font = UIFont.boldSystemFont(ofSize: 16)
        titleLbl.textColor = UIColor.black
        return titleLbl
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
extension TrendingHeaderView {
    func addSubviews() {
        self.backgroundColor = .white
        self.addSubview(titleLbl)
    }
}

//MARK:- setup view Constraints
extension TrendingHeaderView {
    
    func setupConstraints() {
        titleLbl.snp.makeConstraints({ (make) in
            make.top.equalTo(5)
            make.bottom.equalTo(-5)
            make.leading.equalTo(25)
            make.trailing.equalTo(-25)
        })
    }
}
