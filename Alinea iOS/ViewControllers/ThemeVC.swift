//
//  ThemeVC.swift
//  Alinea iOS
//
//  Created by Anil Sharma on 23/08/20.
//  Copyright © 2020 Anil Sharma. All rights reserved.
//

import UIKit

class ThemeVC: UIViewController {
    
    var collectionView : UICollectionView!

    var flowLayout : UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        let cellWidth = (kScreenWidth - 72)/2
        flowLayout.itemSize  =  CGSize(width: cellWidth, height: cellWidth * 1.07)
        
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 24
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
        return  flowLayout
    }()
    
    //MARK: - Life cycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///Setup Collection View
        self.setupCollectionView()
        
        ///Add Sub views
        self.addSubviews()
        
        ///Setup Constraints
        self.setupConstraints()
        // Do any additional setup after loading the view.
    }
}

//MARK:- add Subviews
extension ThemeVC {
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        collectionView.dataSource = self
        collectionView.register(ThemeCollectionViewCell.self, forCellWithReuseIdentifier: "ThemeCollectionViewCell")
        collectionView.backgroundColor = .white
    }
}

//MARK:- add Subviews
extension ThemeVC {
    
    func addSubviews() {
        self.view.addSubview(collectionView)
    }
}

//MARK:- setup view Constraints
extension ThemeVC {
    
    func setupConstraints() {
        collectionView.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
        })
    }
}

// MARK: - UICollectionViewDataSource
extension ThemeVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThemeCollectionViewCell", for: indexPath) as! ThemeCollectionViewCell
        cell.configureCell()
        return cell
    }
}
