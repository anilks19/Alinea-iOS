//
//  ExploreVC.swift
//  Alinea iOS
//
//  Created by Anil Sharma on 23/08/20.
//  Copyright © 2020 Anil Sharma. All rights reserved.
//

import UIKit
import SnapKit

class ExploreVC: UIViewController {
    
    let explorePagerView: ExplorePagerView = {
        let explorePagerView = ExplorePagerView()
        return  explorePagerView
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    let scrollContainerView: UIView = {
        let scrollContainerView = UIView()
        return scrollContainerView
    }()
    
    //MARK: - Child View Controller
    lazy var categoryChildViewController: CategoryVC = {
        return CategoryVC()
    }()
    
    lazy var themeChildViewController: ThemeVC = {
        return ThemeVC()
    }()
    
    lazy var trendingChildViewController: TrendingVC = {
        return TrendingVC()
    }()
    
    //MARK: - Life cycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.AlineaBackgroundColor()
        
        /// setup top pager view
        explorePagerView.backgroundColor = .white
        explorePagerView.categoryTab.selectionButton.addTarget(self, action:#selector(self.didTapOnTopTabBarButton(_:)), for: .touchUpInside)
        explorePagerView.themesTab.selectionButton.addTarget(self, action:#selector(self.didTapOnTopTabBarButton(_:)), for: .touchUpInside)
        explorePagerView.trendingTab.selectionButton.addTarget(self, action:#selector(self.didTapOnTopTabBarButton(_:)), for: .touchUpInside)
      
        ///Add scrollView delegate
        scrollView.delegate = self
        
        self.setNavBarButton() // Add navigation bar button
        self.addSubviews() // Attch subview to view
        self.setupChildViewControllers() // Add Child Ciew Controller's
        self.setupConstraints() // Setup Constraints
        // Do any additional setup after loading the view.
    }
}

//MARK:- add Subviews
extension ExploreVC {
    
    func addSubviews() {
        self.view.addSubview(explorePagerView)
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(scrollContainerView)
    }
    
}

//MARK:- setup view Constraints
extension ExploreVC {
    
    func setupConstraints() {
        
        ///Top pager view set constraints
        explorePagerView.snp.makeConstraints({ (make) in
            make.leading.equalTo(0)
            make.top.equalTo(kNavBarHeight)
            make.trailing.equalTo(0)
            make.height.equalTo(32)
        })
        
        ///Set scrollview constraints
        scrollView.snp.makeConstraints({ (make) in
            make.leading.equalTo(0)
            make.top.equalTo(explorePagerView.snp.bottom)
            make.trailing.equalTo(0)
            make.bottom.equalTo(0)
        })
        
        ///Set scrollview container view constraints
        scrollContainerView.snp.makeConstraints({ (make) in
            make.leading.equalTo(0)
            make.top.equalTo(0)
            make.trailing.equalTo(0)
            make.bottom.equalTo(0)
            make.height.equalTo(self.scrollView.snp.height)
        })
        
         ///Set Category Child ViewController Constraints
        categoryChildViewController.view.snp.makeConstraints { (make) in
            make.leading.equalTo(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.width.equalTo(kScreenWidth)
        }
        
        ///Set Theme Child ViewController Constraints
        themeChildViewController.view.snp.makeConstraints { (make) in
            make.leading.equalTo(categoryChildViewController.view.snp.trailing)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.width.equalTo(kScreenWidth)
        }
        
        ///Set Trending Child ViewController Constraints
        trendingChildViewController.view.snp.makeConstraints { (make) in
            make.leading.equalTo(themeChildViewController.view.snp.trailing)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.width.equalTo(kScreenWidth)
            make.trailing.equalTo(0)
        }
    }
    
}

//MARK:- Set NavBar Button
extension ExploreVC {
    fileprivate func setNavBarButton() {
        /// set left bar button
        let sliderButton = UIBarButtonItem(image: UIImage(named: "setting drawer"), style: .plain, target: self, action: nil)
        navigationItem.setLeftBarButton(sliderButton, animated: true)
        
        /// set Right bar button
        let notificationButton = UIBarButtonItem(image: UIImage(named: "bell"), style: .plain, target: self, action: nil)
        navigationItem.setRightBarButton(notificationButton, animated: true)
    }
}

//MARK:- Tab bar setup and action
extension ExploreVC {
    
    fileprivate func setupChildViewControllers() {
        ///add  category child view
        categoryChildViewController.willMove(toParent: self)
        scrollContainerView.addSubview(categoryChildViewController.view)
        categoryChildViewController.didMove(toParent: self)
        
        /// add  theme child view
        themeChildViewController.willMove(toParent: self)
        scrollContainerView.addSubview(themeChildViewController.view)
        themeChildViewController.didMove(toParent: self)
        
        ///add  trending child view
        trendingChildViewController.willMove(toParent: self)
        scrollContainerView.addSubview(trendingChildViewController.view)
        trendingChildViewController.didMove(toParent: self)
        
        setTabBarSelected(0)
    }
    
    ///Tab bar button selector action
    @IBAction func didTapOnTopTabBarButton(_ sender: UIButton) {
        if !sender.isSelected {
            setTabBarSelected(sender.tag)
            UIView.animate(withDuration: 0.3, animations: {
                self.scrollView.contentOffset.x = kScreenWidth * CGFloat(sender.tag)
            })
        }
    }
    
    ///Set Selected Tab
    fileprivate func setTabBarSelected(_ currentPage : Int) {
        explorePagerView.categoryTab.setSelected(currentPage == 0 ? true : false)
        explorePagerView.themesTab.setSelected(currentPage == 1 ? true : false)
        explorePagerView.trendingTab.setSelected(currentPage == 2 ? true : false)
    }
    
}

//MARK:- UIScrollViewDelegate
extension ExploreVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPage = Int((scrollView.contentOffset.x + (0.5 * scrollView.frame.size.width)) / scrollView.frame.size.width)
        setTabBarSelected(currentPage)
    }
}
