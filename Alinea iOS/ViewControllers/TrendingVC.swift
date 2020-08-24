//
//  TrendingVC.swift
//  Alinea iOS
//
//  Created by Anil Sharma on 23/08/20.
//  Copyright © 2020 Anil Sharma. All rights reserved.
//

import UIKit

class TrendingVC: UIViewController {
    
    var tableView : UITableView = {
        let tableView = UITableView()
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .clear
        return  tableView
    }()
    
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
}

//MARK:- setupTableView
extension TrendingVC {
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TrendingTableViewCell.self, forCellReuseIdentifier: "TrendingTableViewCell")
        tableView.reloadData()
    }
}

//MARK:- add Subviews
extension TrendingVC {
    
    func addSubviews() {
        self.view.addSubview(tableView)
    }
}

//MARK:- setup view Constraints
extension TrendingVC {
    
    func setupConstraints() {
        tableView.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
        })
    }
}
// MARK: - UITableViewDataSource
extension TrendingVC : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingTableViewCell", for: indexPath) as! TrendingTableViewCell
        cell.backgroundColor = .white
        cell.selectionStyle = .none
        cell.configureCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = TrendingHeaderView()
        headerView.titleLbl.text = "Top Gainers"
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
}
