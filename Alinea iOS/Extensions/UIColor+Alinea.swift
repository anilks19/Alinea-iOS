//
//  UIColor+Alinea.swift
//  Alinea iOS
//
//  Created by Anil Sharma on 23/08/20.
//  Copyright © 2020 Anil Sharma. All rights reserved.
//

import UIKit

extension UIColor {
    
    //MARK:- App Colors
    class func alineaGrayColor() -> UIColor {
        return UIColor(hexString: "484857")
    }
    
    class func AlineaBlueColor() -> UIColor {
        return UIColor(hexString: "4E53CA")
    }
    
    class func AlineaLightBlueColor() -> UIColor {
        return UIColor(hexString: "A5A6FA")
    }
    
    class func AlineaYellowColor() -> UIColor {
        return UIColor(hexString: "FDD64D")
    }
    
    class func AlineaNavTitleColor() -> UIColor {
        return UIColor(hexString: "323232")
    }
    
    class func AlineaBackgroundColor() -> UIColor {
        return UIColor(hexString: "F3F3F3")
    }
    
    class func AlineaCellSubTitleColor() -> UIColor {
        return UIColor(hexString: "ABACB3")
    }
    
    class func AlineaPositiveGainColor() -> UIColor {
        return UIColor(hexString: "46D2AE")
    }
    
    class func AlineaCollectionViewCellBgColor() -> UIColor {
        return UIColor(hexString: "FAFBFC")
    }
    
    class func AlineaCellBorderColor() -> UIColor {
        return UIColor(hexString: "EEF0F9")
    }
    
    class func AlineaSeperatorColor() -> UIColor {
        return UIColor(hexString: "D0D0D0")
    }
    
}

//MARK:- Convert hax color string to UIColor
extension UIColor {
    convenience init(hexString: String) {
        
        var cString:String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            self.init(red: 0, green: 0, blue: 0, alpha: 1.0)
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255, green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255, blue: CGFloat(rgbValue & 0x0000FF) / 255, alpha: 1.0)
    }
}
