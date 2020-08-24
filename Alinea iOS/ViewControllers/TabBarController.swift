//
//  TabBarController.swift
//  Alinea iOS
//
//  Created by Anil Sharma on 23/08/20.
//  Copyright © 2020 Anil Sharma. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    lazy public var tabBar1: UINavigationController = {
        
        let initialTabBar = UIViewController()
        
        initialTabBar.view.backgroundColor = UIColor.AlineaBackgroundColor()
        
        initialTabBar.title = "Tab 1"
        
        let defaultImage = UIImage(named: "tab 1")!
        
        let selectedImage = UIImage(named: "tab 1 selected")!
        
        let tabBarItem = UITabBarItem(title: "", image: defaultImage, selectedImage: selectedImage)
        
        initialTabBar.tabBarItem = tabBarItem
        
        return UINavigationController(rootViewController: initialTabBar)
    }()
    
    lazy public var tabBar2: UINavigationController = {
        
        let exploreTabBar = ExploreVC()
        
        exploreTabBar.title = "Explore"
        
        let defaultImage = UIImage(named: "tab 2")
        
        let selectedImage = UIImage(named: "tab 2 selected")
        
        let tabBarItem = UITabBarItem(title: "", image: defaultImage, selectedImage: selectedImage)
        
        exploreTabBar.tabBarItem = tabBarItem
        
        return UINavigationController(rootViewController: exploreTabBar)
    }()
    
    
    lazy public var tabBar3: UINavigationController = {
        
        let initialTabBar = UIViewController()
        
        initialTabBar.view.backgroundColor = UIColor.AlineaBackgroundColor()
        
        initialTabBar.title = "Tab 3"
        
        let defaultImage = UIImage(named: "tab3")!
        
        let selectedImage = UIImage(named: "tab3 selected")!
        
        let tabBarItem = UITabBarItem(title: "", image: defaultImage, selectedImage: selectedImage)
        
        initialTabBar.tabBarItem = tabBarItem
        
        return UINavigationController(rootViewController: initialTabBar)
    }()
    
    
    lazy public var tabBar4: UINavigationController = {
        
        let initialTabBar = UIViewController()
        
        initialTabBar.view.backgroundColor = UIColor.AlineaBackgroundColor()
        
        initialTabBar.title = "Tab 4"
        
        let defaultImage = UIImage(named: "tab 4")!
        
        let selectedImage = UIImage(named: "tab 4 selected")!
        
        let tabBarItem = UITabBarItem(title: "", image: defaultImage, selectedImage: selectedImage)
        
        initialTabBar.tabBarItem = tabBarItem
        
        return UINavigationController(rootViewController: initialTabBar)
    }()
    
    
    lazy public var tabBar5: UINavigationController = {
        
        let initialTabBar = UIViewController()
        
        initialTabBar.view.backgroundColor = UIColor.AlineaBackgroundColor()
        
        initialTabBar.title = "Tab 5"
        
        let defaultImage = UIImage(named: "tab 5")!
        
        let selectedImage = UIImage(named: "tab 5 selected")!
        
        let tabBarItem = UITabBarItem(title: "", image: defaultImage, selectedImage: selectedImage)
        
        initialTabBar.tabBarItem = tabBarItem
        
        return UINavigationController(rootViewController: initialTabBar)
    }()
    
    // MARK: - Life cycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        ///add tab bar View controller
        self.viewControllers = [tabBar1,tabBar2,tabBar3,tabBar4,tabBar5]
        
        ///Remove tab bar shadow image
        UITabBar.appearance().shadowImage = UIImage()
        
        ///Add Tab bar background image
        let image = UIImage(named: "tabBarBg")
        let tabBarImage = resize(image: image!, newWidth: self.tabBar.frame.width)
        self.tabBar.backgroundImage = tabBarImage
        
        //Add tab bar background color
        self.tabBar.backgroundColor =  UIColor.AlineaBackgroundColor()
        
        ///add selection Indicator Image
        self.tabBar.selectionIndicatorImage = IS_IPHONE_X_OR_NOCH ? UIImage.init(named: "tab bar Baground For Iphone X")! :  UIImage.init(named: "tab bar Baground")!
        
        ///Make index one is default
        self.selectedIndex = 1
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        ///Change tab bar height for non Noch phone
        if kTabBarHeight > 0.0 && !IS_IPHONE_X_OR_NOCH{
            tabBar.frame.size.height = kTabBarHeight
            tabBar.frame.origin.y = view.frame.height - kTabBarHeight
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
}

// MARK: - Resize background image
extension TabBarController {
    func resize(image: UIImage, newWidth: CGFloat) -> UIImage {
        
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: image.size.height))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: kTabBarHeight)) 
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

// MARK: - UITabBarController Delegate
extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }
}
