//
//  CategoryVC.swift
//  Alinea iOS
//
//  Created by Anil Sharma on 23/08/20.
//  Copyright © 2020 Anil Sharma. All rights reserved.
//

import UIKit

class CategoryVC: UIViewController {
    
    var tableView : UITableView = {
        let tableView = UITableView()
        tableView.estimatedRowHeight = 110.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .clear
        return  tableView
    }()
    
    //Create dummy tuple
    var categoryData : [(categoryName: String , categoryImage: UIImage , bgColor: UIColor)] = [(categoryName : "Stocks", categoryImage: UIImage.init(named: "stocks")!, bgColor: UIColor.AlineaLightBlueColor()),
                                                                                               (categoryName : "ETFs", categoryImage: UIImage.init(named: "etfs")!, bgColor: UIColor.AlineaBlueColor()),
                                                                                               (categoryName : "Crypto", categoryImage: UIImage.init(named: "bitcoin")!, bgColor: UIColor.AlineaYellowColor())]
    //MARK: - Life cycle method
    override func viewDidLoad() {
        super.viewDidLoad()
       
        /// setup TableView
        self.setupTableView()
        
        /// add Subviews
        self.addSubviews()
        
        /// setup Constraints
        self.setupConstraints()
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

//MARK:- setupTableView
extension CategoryVC {
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: "CategoryTableViewCell")
        tableView.reloadData()
    }
}

//MARK:- add Subviews
extension CategoryVC {
    
    func addSubviews() {
        self.view.addSubview(tableView)
    }
}

//MARK:- setup view Constraints
extension CategoryVC {
    
    func setupConstraints() {
        tableView.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
        })
    }
}

// MARK: - UITableView Delegate
extension CategoryVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
}

// MARK: - UITableView DataSource
extension CategoryVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
        cell.selectionStyle = .none
        cell.configureCell(categoryData[indexPath.row])
        return cell
    }
}
