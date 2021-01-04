//
//  BaseViewToastItem.swift
//  LASER
//
//  Created by Santhosh Kumar on 7/30/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import Foundation
import UIKit

extension BaseViewController{
    func setToastPopup(){
        
        popToastLabel = UILabel(frame: CGRect(x: offset, y: -50, width: screenWidth - 2 * offset, height: 30))
        popToastLabel.backgroundColor = UIColor(red: 223/255, green: 98/255, blue: 90/255, alpha: 1.0)
        popToastLabel.layer.borderWidth = 1
        popToastLabel.layer.borderColor = UIColor.white.cgColor
        popToastLabel.layer.cornerRadius = 4
        popToastLabel.clipsToBounds = true
        popToastLabel.textAlignment = .center
        popToastLabel.numberOfLines = 0
        popToastLabel.font = UIFont(name: "helvetica neue", size: 13.5)
        popToastLabel.lineBreakMode = .byWordWrapping
        popToastLabel.textColor = .white
        self.navigationController?.view.addSubview(popToastLabel)
        self.popToastLabel.needsUpdateConstraints() 
        
        NSLayoutConstraint.on([
            popToastLabel.pinLeft(view: popToastLabel, refView: self.navigationController!.view, thisConstant: offset),
            popToastLabel.pinRight(view: popToastLabel, refView: self.navigationController!.view, thisConstant: offset),
            popToastLabel.pinTop(view: popToastLabel, refView: self.navigationController!.view, thisConstant: -50),
            popToastLabel.pinHeight(view: popToastLabel, thisHeight: 30),
            popToastLabel.pinVertical(view: self.navigationController!.view)
        ])
    }
    
    func setToastMessage(msg:String){
        if (msg.isEmpty == false && popToastLabel.text != msg){
            popToastLabel.text = msg
        }
        
        if self.popToastLabel.frame.origin.y != 30{
            UIView.animate(withDuration: 1.0, animations: {
                self.popToastLabel.frame.origin.y = 30
            }) { _ in
                self.perform(#selector(self.reverseAnimate), with: nil, afterDelay: 3)
            }
        }
    }
    
    @objc func reverseAnimate(){
        UIView.animate(withDuration: 1.0, animations: {
            self.popToastLabel.frame.origin.y = -50
        }) { _ in
        }
    }
}
