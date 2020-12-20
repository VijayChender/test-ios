//
//  SplashView.swift
//  LASER
//
//  Created by Santhosh Kumar on 5/20/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import Foundation
import UIKit

protocol SplashDelegate {
    func splashAnimationDone()
}

class SplashView: UIView {
    
    var baseView:UIView = UIView()
    var splashDelegate : SplashDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSplashContent()
        self.animate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSplashContent(){
        let heightOffset : CGFloat = 50
        let img = resizeImage(image: UIImage(named: "CenturyLink-Logo")!, targetSize: CGSize(width: screenWidth/2, height: screenWidth/4))
        baseView = UIView(frame: CGRect(x: screenWidth/2 - (img.size.width)/2, y: screenHeight/2 - (img.size.height)/2 - heightOffset, width: (img.size.width), height: (img.size.height) + heightOffset))
//        baseView = UIView(frame: CGRect(x: 0, y: 0, width: (img.size.width), height: (img.size.height) + heightOffset))
        baseView.backgroundColor = .clear
        self.addSubview(baseView)
       
//        NSLayoutConstraint.on([
//            baseView.pinVertical(view: self),
//            baseView.pinCenter(view: self),
//            baseView.pinWH(size: CGSize(width: (img.size.width), height: (img.size.height)))
//        ])
        
        let imgView = UIImageView(frame: CGRect(x: baseView.frame.size.width/2 - (img.size.width)/2, y: 0, width: (img.size.width), height: (img.size.height)))
        imgView.image = img
        baseView.addSubview(imgView)
        
        let label = UILabel(frame: CGRect(x: 0, y: imgView.frame.size.height - offset, width: baseView.frame.size.width, height: 30))
        label.backgroundColor = .clear
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Laser"
        label.font = setFont(size: 25, family: "helvetica-bold")
        label.baselineAdjustment = .alignCenters
        baseView.addSubview(label)
    }
    
    func animate(){
        UIView.animate(withDuration: 3.0, animations: {
            self.baseView.frame.origin.y = 50
        
        }) { _ in
            if self.splashDelegate != nil{
                self.splashDelegate.splashAnimationDone()
            }
        }
    }
}
