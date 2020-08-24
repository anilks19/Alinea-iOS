//
//  ThemeCollectionViewCell.swift
//  Alinea iOS
//
//  Created by Anil Sharma on 23/08/20.
//  Copyright © 2020 Anil Sharma. All rights reserved.
//

import UIKit

class ThemeCollectionViewCell: UICollectionViewCell {
    
    let iconImg : UIImageView = {
        let iconImg = UIImageView()
        iconImg.cornerRadius = 17.5
        iconImg.contentMode = .center
        return iconImg
    }()
    
    let titleLbl: UILabel = {
        let titleLbl = UILabel()
        titleLbl.font = UIFont.boldSystemFont(ofSize: 16)
        titleLbl.textColor = .black
        titleLbl.numberOfLines = 0
        titleLbl.textAlignment = .center
        return titleLbl
    }()
    
     // MARK: - Init Collection View Cell
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = UIColor.AlineaCollectionViewCellBgColor()
        self.contentView.cornerRadius = 16
        self.contentView.borderWidth = 2
        self.contentView.borderColor = UIColor.AlineaCellBorderColor()
        self.addSubviews()
        self.setupConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
//MARK:- add Subviews
extension ThemeCollectionViewCell {
    
    func addSubviews() {
        self.contentView.addSubview(iconImg)
        self.contentView.addSubview(titleLbl)
    }
}

//MARK:- setup view Constraints
extension ThemeCollectionViewCell {
    
    func setupConstraints() {
        iconImg.snp.makeConstraints({ (make) in
            make.top.equalTo(8)
            make.leading.equalTo(8)
            make.trailing.equalTo(-8)
        })
        
        titleLbl.snp.makeConstraints({ (make) in
            make.top.equalTo(iconImg.snp.bottom)
            make.leading.equalTo(8)
            make.trailing.equalTo(-8)
            make.bottom.equalTo(-16)
        })
    }
}

//MARK:- Configure Cell
extension ThemeCollectionViewCell {
    
    func configureCell() {
        iconImg.image = UIImage.init(named: "ExploreThemes")!//Now its dummy image we will change when we have real data
        titleLbl.text = "Diversity & Inclusion"
    }
}


