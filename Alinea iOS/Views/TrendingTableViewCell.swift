//
//  TrendingTableViewCell.swift
//  Alinea iOS
//
//  Created by Anil Sharma on 22/08/20.
//  Copyright © 2020 Anil Sharma. All rights reserved.
//

import UIKit

class TrendingTableViewCell: UITableViewCell {
    
    let iconImg : UIImageView = {
        let iconImg = UIImageView()
        iconImg.cornerRadius = 17.5
        return iconImg
    }()
    
    let titleLbl: UILabel = {
        let titleLbl = UILabel()
        titleLbl.font = UIFont.boldSystemFont(ofSize: 16)
        titleLbl.textColor = .black
        titleLbl.numberOfLines = 0
        return titleLbl
    }()
    
    let subTitleLbl: UILabel = {
        let subTitleLbl = UILabel()
        subTitleLbl.font = UIFont.boldSystemFont(ofSize: 12)
        subTitleLbl.textColor = UIColor.AlineaCellSubTitleColor()
        subTitleLbl.numberOfLines = 0
        return subTitleLbl
    }()
    
    let gainContainerView: UIView = {
        let gainContainerView = UIView()
        gainContainerView.cornerRadius = 12
        return gainContainerView
    }()
    
    let gainLbl: UILabel = {
        let gainLbl = UILabel()
        gainLbl.font = UIFont.boldSystemFont(ofSize: 12)
        gainLbl.textColor = .white
        return gainLbl
    }()
    
    // MARK: - Init Table View Cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubviews()
        self.setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

//MARK:- add Subviews
extension TrendingTableViewCell {
    func addSubviews() {
        self.contentView.addSubview(iconImg)
        self.contentView.addSubview(titleLbl)
        self.contentView.addSubview(subTitleLbl)
        self.contentView.addSubview(gainContainerView)
        self.gainContainerView.addSubview(gainLbl)
    }
}

//MARK:- setup view Constraints
extension TrendingTableViewCell {
    
    func setupConstraints() {
        iconImg.snp.makeConstraints({ (make) in
            make.top.equalTo(22)
            make.leading.equalTo(25)
            make.height.equalTo(35)
            make.width.equalTo(35)
        })
        
        titleLbl.snp.makeConstraints({ (make) in
            make.top.equalTo(19)
            make.leading.equalTo(iconImg.snp.trailing).offset(16)
            make.trailing.lessThanOrEqualTo(gainContainerView.snp.leading).offset(-8)
        })
        
        subTitleLbl.snp.makeConstraints({ (make) in
            make.top.equalTo(titleLbl.snp.bottom).offset(8)
            make.leading.equalTo(iconImg.snp.trailing).offset(16)
            //            make.trailing.equalTo(titleLbl.snp.trailing)
            make.bottom.equalTo(-19)
        })
        
        gainContainerView.snp.makeConstraints({ (make) in
            //            make.leading.greaterThanOrEqualTo(titleLbl.snp.trailing).offset(8)
            make.trailing.equalTo(-16)
            make.height.equalTo(24)
            make.centerY.equalTo(self.contentView)
        })
        
        gainLbl.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.bottom.equalTo(0)
        })
    }
    
}

//MARK:- Configure Cell
extension TrendingTableViewCell {
    
    func configureCell() {
        iconImg.image = UIImage.init(named: "slack")!//Now its dummy image we will change when we have real data
        titleLbl.text = "Slack Technologies"
        subTitleLbl.text = "WORK"
        gainContainerView.backgroundColor = UIColor.AlineaPositiveGainColor()
        gainLbl.text = "+50.65"
    }
}
