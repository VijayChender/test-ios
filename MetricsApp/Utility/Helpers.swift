//
//  Helpers.swift
//  LASER
//
//  Created by Santhosh Kumar on 5/20/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
  func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
  }
}

func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
    let size = image.size

    let widthRatio  = targetSize.width  / size.width
    let heightRatio = targetSize.height / size.height

    // Figure out what our orientation is, and use that to form the rectangle
    var newSize: CGSize
    if(widthRatio > heightRatio) {
        newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
    } else {
        newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
    }

    // This is the rect that we've calculated out and this is what is actually used below
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

    // Actually do the resizing to the rect using the ImageContext stuff
    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    image.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return newImage!
}

var keyWindow: UIWindow? {
    return UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive}).map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first
}

func getCircleOfSize(size:CGSize, color: UIColor) -> UIView{
    var thisSize:CGFloat = 0
    if size.height < size.width{
        thisSize = size.height
    }else if size.height > size.width{
        thisSize = size.width
    }else{
        thisSize = size.width
    }
    
    if thisSize <= 15{
        thisSize = 15
    }
    
    let circle:UIView = UIView(frame: CGRect(x: 0, y: 0, width: thisSize, height: thisSize))
    circle.layer.cornerRadius = thisSize/2
    circle.layer.borderWidth = 1.0
    circle.layer.borderColor = color.cgColor
    
    return circle
}

func getLineOfLength(length:CGFloat, color:UIColor) -> UIView{
    let line:UIView = UIView(frame: CGRect(x: 0, y: 0, width: length, height: 1))
    line.backgroundColor = color
    return line
}

func getLableOfSize(frame:CGRect) -> UILabel{
    let label:UILabel = UILabel()
    label.frame = frame
    label.backgroundColor = .clear
    label.textAlignment = .center
    label.textColor = .black
    label.baselineAdjustment = .alignCenters
    label.adjustsFontSizeToFitWidth = true
    label.numberOfLines = 0
    label.lineBreakMode = NSLineBreakMode.byWordWrapping
    label.font = setFont(size: 10, family: "helvetica neue")
    return label
}
