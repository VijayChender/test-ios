//
//  Constants.swift
//  LASER
//
//  Created by Santhosh Kumar on 4/25/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import UIKit
import SystemConfiguration
import Foundation

// ------Views related Constants---------
let mainQueue = DispatchQueue.main
let bgQueue = DispatchQueue.global()
let screenWidth:CGFloat = getScreenVarient(factor: "W")
let screenHeight:CGFloat = getScreenVarient(factor: "H")
let statusBarHeight:CGFloat = UIApplication.shared.statusBarFrame.size.height
let offset:CGFloat = 10
let tabName = ["Key Metrics","Bounce Rates","Metrics","Graphs","Pages Visited","Settings"]
let tabBarHeight:CGFloat = 44
let mobileFactor = getScreenFactor()
var isLoggedIn:Bool = false
var selectedTabItem:UIButton = UIButton()
var cellHeight : CGFloat = 25

// --------Fonts related constants-----------

func setFont(size:CGFloat, family: String) -> UIFont{
    var thisFont : UIFont = UIFont()
//    thisFont = UIFont(name: family, size: getScaledSize(scalable: size))!
    thisFont = UIFont(name: family, size: size * mobileFactor)!
    return thisFont
}

func getScreenFactor() -> CGFloat{
    var factor:CGFloat = 1
    if lowResIPhone .contains(UIDevice.current.model){
        factor = 0.84
    }
    else if iPad .contains(UIDevice.current.model){
        factor = 1.5
    }
    
    let modelName = UIDevice.modelName
    print(modelName)
    
//    let device = UIDevice.current
//    let model = device.model
//    print(model) // e.g. "iPhone"
//
//    let modelName = device.model
//    print(modelName) // e.g. "iPhone 6"  /* see the extension */
//
//    let deviceName = device.name
//    print(deviceName) // e.g. "My iPhone"
//
//    let systemName = device.systemName
//    print(systemName) // e.g. "iOS"
//
//    let systemVersion = device.systemVersion
//    print(systemVersion) // e.g. "10.3.2"
//
//    if let identifierForVendor = device.identifierForVendor {
//
//        print(identifierForVendor) // e.g. "E1X2XX34-5X6X-7890-123X-XXX456C78901"
//    }
    1
    return factor
}

func getScreenVarient(factor:String) -> CGFloat{
    let screenRect = UIScreen.main.bounds
    let screenWidth = screenRect.size.width
    let screenHeight = screenRect.size.height
    if factor == "W"{
        if screenWidth < screenHeight{
            return screenWidth
        }
        return screenHeight
    }else{
        if screenHeight < screenWidth{
            return screenHeight
        }
        return screenWidth
    }
}

// -------Mobile screen sizes---------

let deviceNamesByCode : [String: String] =
    ["i386" : "iPhone Simulator",
    "x86_64" : "iPhone Simulator",
    "iPhone1,1" : "iPhone",
    "iPhone1,2" : "iPhone 3G",
    "iPhone2,1" : "iPhone 3GS",
    "iPhone3,1" : "iPhone 4",
    "iPhone3,2" : "iPhone 4 GSM Rev A",
    "iPhone3,3" : "iPhone 4 CDMA",
    "iPhone4,1" : "iPhone 4S",
    "iPhone5,1" : "iPhone 5 (GSM)",
    "iPhone5,2" : "iPhone 5 (GSM+CDMA)",
    "iPhone5,3" : "iPhone 5C (GSM)",
    "iPhone5,4" : "iPhone 5C (Global)",
    "iPhone6,1" : "iPhone 5S (GSM)",
    "iPhone6,2" : "iPhone 5S (Global)",
    "iPhone7,1" : "iPhone 6 Plus",
    "iPhone7,2" : "iPhone 6",
    "iPhone8,1" : "iPhone 6s",
    "iPhone8,2" : "iPhone 6s Plus",
    "iPhone8,3" : "iPhone SE (GSM+CDMA)",
    "iPhone8,4" : "iPhone SE (GSM)",
    "iPhone9,1" : "iPhone 7",
    "iPhone9,2" : "iPhone 7 Plus",
    "iPhone9,3" : "iPhone 7",
    "iPhone9,4" : "iPhone 7 Plus",
    "iPhone10,1" : "iPhone 8",
    "iPhone10,2" : "iPhone 8 Plus",
    "iPhone10,3" : "iPhone X Global",
    "iPhone10,4" : "iPhone 8",
    "iPhone10,5" : "iPhone 8 Plus",
    "iPhone10,6" : "iPhone X GSM",
    "iPhone11,2" : "iPhone XS",
    "iPhone11,4" : "iPhone XS Max",
    "iPhone11,6" : "iPhone XS Max Global",
    "iPhone11,8" : "iPhone XR",
    
    "iPad1,1" : "iPad",
    "iPad1,2" : "iPad 3G",
    "iPad2,1" : "2nd Gen iPad",
    "iPad2,2" : "2nd Gen iPad GSM",
    "iPad2,3" : "2nd Gen iPad CDMA",
    "iPad2,4" : "2nd Gen iPad New Revision",
    "iPad3,1" : "3rd Gen iPad",
    "iPad3,2" : "3rd Gen iPad CDMA",
    "iPad3,3" : "3rd Gen iPad GSM",
    "iPad2,5" : "iPad mini",
    "iPad2,6" : "iPad mini GSM+LTE",
    "iPad2,7" : "iPad mini CDMA+LTE",
    "iPad3,4" : "4th Gen iPad",
    "iPad3,5" : "4th Gen iPad GSM+LTE",
    "iPad3,6" : "4th Gen iPad CDMA+LTE",
    "iPad4,1" : "iPad Air (WiFi)",
    "iPad4,2" : "iPad Air (GSM+CDMA)",
    "iPad4,3" : "1st Gen iPad Air (China)",
    "iPad4,4" : "iPad mini Retina (WiFi)",
    "iPad4,5" : "iPad mini Retina (GSM+CDMA)",
    "iPad4,6" : "iPad mini Retina (China)",
    "iPad4,7" : "iPad mini 3 (WiFi)",
    "iPad4,8" : "iPad mini 3 (GSM+CDMA)",
    "iPad4,9" : "iPad Mini 3 (China)",
    "iPad5,1" : "iPad mini 4 (WiFi)",
    "iPad5,2" : "4th Gen iPad mini (WiFi+Cellular)",
    "iPad5,3" : "iPad Air 2 (WiFi)",
    "iPad5,4" : "iPad Air 2 (Cellular)",
    "iPad6,3" : "iPad Pro (9.7 inch, WiFi)",
    "iPad6,4" : "iPad Pro (9.7 inch, WiFi+LTE)",
    "iPad6,7" : "iPad Pro (12.9 inch, WiFi)",
    "iPad6,8" : "iPad Pro (12.9 inch, WiFi+LTE)",
    "iPad6,11" : "iPad (2017)",
    "iPad6,12" : "iPad (2017)",
    "iPad7,1" : "iPad Pro 2nd Gen (WiFi)",
    "iPad7,2" : "iPad Pro 2nd Gen (WiFi+Cellular)",
    "iPad7,3" : "iPad Pro 10.5-inch",
    "iPad7,4" : "iPad Pro 10.5-inch",
    "iPad7,5" : "iPad 6th Gen (WiFi)",
    "iPad7,6" : "iPad 6th Gen (WiFi+Cellular)",
    "iPad8,1" : "iPad Pro 3rd Gen (11 inch, WiFi)",
    "iPad8,2" : "iPad Pro 3rd Gen (11 inch, 1TB, WiFi)",
    "iPad8,3" : "iPad Pro 3rd Gen (11 inch, WiFi+Cellular)",
    "iPad8,4" : "iPad Pro 3rd Gen (11 inch, 1TB, WiFi+Cellular)",
    "iPad8,5" : "iPad Pro 3rd Gen (12.9 inch, WiFi)",
    "iPad8,6" : "iPad Pro 3rd Gen (12.9 inch, 1TB, WiFi)",
    "iPad8,7" : "iPad Pro 3rd Gen (12.9 inch, WiFi+Cellular)",
    "iPad8,8" : "iPad Pro 3rd Gen (12.9 inch, 1TB, WiFi+Cellular)"
    ]

let iPad = ["iPad1,1","iPad1,2","iPad2,1","iPad2,2","iPad2,3","iPad2,4","iPad3,1","iPad3,2","iPad3,3",
            "iPad2,5","iPad2,6","iPad2,7","iPad3,4","iPad3,5","iPad3,6","iPad4,1","iPad4,2","iPad4,3","iPad4,4","iPad4,5","iPad4,6",
            "iPad4,7","iPad4,8","iPad4,9","iPad5,1","iPad5,2","iPad5,3","iPad5,4","iPad6,3","iPad6,4","iPad6,7","iPad6,8",
            "iPad6,11","iPad6,12","iPad7,1","iPad7,2","iPad7,3","iPad7,4","iPad7,5","iPad7,6","iPad8,1","iPad8,2","iPad8,3",
            "iPad8,4","iPad8,5","iPad8,6","iPad8,7","iPad8,8"]

let lowResIPhone = ["iPhone5,1","iPhone5,2","iPhone5,3","iPhone5,4","iPhone6,1","iPhone6,2","iPhone8,4"]


public extension UIDevice {
  static let modelName: String = {
    var systemInfo = utsname()
    uname(&systemInfo)
    let machineMirror = Mirror(reflecting: systemInfo.machine)
    let identifier = machineMirror.children.reduce("") { identifier, element in
      guard let value = element.value as? Int8, value != 0 else { return identifier }
      return identifier + String(UnicodeScalar(UInt8(value)))
    }
    
    func mapToDevice(identifier: String) -> String {
      #if os(iOS)
      switch identifier {
      case "iPod5,1":                                 return "iPod Touch 5"
      case "iPod7,1":                                 return "iPod Touch 6"
      case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
      case "iPhone4,1":                               return "iPhone 4s"
      case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
      case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
      case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
      case "iPhone7,2":                               return "iPhone 6"
      case "iPhone7,1":                               return "iPhone 6 Plus"
      case "iPhone8,1":                               return "iPhone 6s"
      case "iPhone8,2":                               return "iPhone 6s Plus"
      case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
      case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
      case "iPhone8,4":                               return "iPhone SE"
      case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
      case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
      case "iPhone10,3", "iPhone10,6":                return "iPhone X"
      case "iPhone11,2":                              return "iPhone XS"
      case "iPhone11,4", "iPhone11,6":                return "iPhone XS Max"
      case "iPhone11,8":                              return "iPhone XR"
      case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
      case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
      case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
      case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
      case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
      case "iPad6,11", "iPad6,12":                    return "iPad 5"
      case "iPad7,5", "iPad7,6":                      return "iPad 6"
      case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
      case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
      case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
      case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
      case "iPad6,3", "iPad6,4":                      return "iPad Pro (9.7-inch)"
      case "iPad6,7", "iPad6,8":                      return "iPad Pro (12.9-inch)"
      case "iPad7,1", "iPad7,2":                      return "iPad Pro (12.9-inch) (2nd generation)"
      case "iPad7,3", "iPad7,4":                      return "iPad Pro (10.5-inch)"
      case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":return "iPad Pro (11-inch)"
      case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":return "iPad Pro (12.9-inch) (3rd generation)"
      case "AppleTV5,3":                              return "Apple TV"
      case "AppleTV6,2":                              return "Apple TV 4K"
      case "AudioAccessory1,1":                       return "HomePod"
//      case "i386", "x86_64":                          return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))"
    case "i386", "x86_64":                          return "\(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))"
      default:                                        return identifier
      }
      #elseif os(tvOS)
      switch identifier {
      case "AppleTV5,3": return "Apple TV 4"
      case "AppleTV6,2": return "Apple TV 4K"
      case "i386", "x86_64": return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "tvOS"))"
      default: return identifier
      }
      #endif
    }
    
    return mapToDevice(identifier: identifier)
  }()
}
