//
//  Constants.swift
//  Alinea iOS
//
//  Created by Anil Sharma on 23/08/20.
//  Copyright © 2020 Anil Sharma. All rights reserved.
//

import Foundation
import UIKit

//MARK:- Font
let NavBarTitleFontSize: CGFloat                    = 16

//MARK:- Add Wide
let kTabBarHeight: CGFloat                    = 62
let kScreenWidth         =  UIScreen.main.bounds.width
let kScreenHeight        = UIScreen.main.bounds.height
let kAppDelegate         = UIApplication.shared.delegate as! AppDelegate
let kDeviceUuid          =  UIDevice.current.identifierForVendor?.uuidString
let IS_IPHONE_4  = UIDevice.current.userInterfaceIdiom == .phone && kScreenHeight == 480
let IS_IPHONE_5  = UIDevice.current.userInterfaceIdiom == .phone && kScreenHeight == 568
let IS_IPHONE_X_OR_NOCH  = UIDevice.current.userInterfaceIdiom == .phone && (UIScreen.main.nativeBounds.height == 2436 || UIScreen.main.nativeBounds.height == 2688 || UIScreen.main.nativeBounds.height == 1792)
let kNavBarHeight  = UIApplication.shared.statusBarFrame.size.height +  44
