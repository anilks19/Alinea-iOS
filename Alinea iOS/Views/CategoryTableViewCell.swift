//
//  CategoryTableViewCell.swift
//  Alinea iOS
//
//  Created by Anil Sharma on 23/08/20.
//  Copyright © 2020 Anil Sharma. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    let categoryButton: UIButton = {
        let categoryButton = UIButton()
        categoryButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        categoryButton.contentHorizontalAlignment = .left
        categoryButton.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: 32, bottom: 0, right: 0)
        categoryButton.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 52, bottom: 0, right: 0)
        categoryButton.cornerRadius = 39
        return categoryButton
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
extension CategoryTableViewCell {
    
    func addSubviews() {
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(categoryButton)
    }
}

//MARK:- setup view Constraints
extension CategoryTableViewCell {
    
    func setupConstraints() {
        categoryButton.snp.makeConstraints({ (make) in
            make.top.equalTo(16)
            make.bottom.equalTo(-16)
            make.leading.equalTo(25)
            make.trailing.equalTo(-25)
            make.height.greaterThanOrEqualTo(78)
        })
    }
}

//MARK:- Configure Cell
extension CategoryTableViewCell {
    
    func configureCell(_ data : (categoryName: String , categoryImage: UIImage , bgColor: UIColor)) {
        categoryButton.setTitle(data.categoryName, for: .normal)
        categoryButton.setImage(data.categoryImage, for: .normal)
        categoryButton.backgroundColor = data.bgColor
    }
}

