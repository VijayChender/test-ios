//
//  File.swift
//  LASER
//
//  Created by Santhosh Kumar on 5/22/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import Foundation
import UIKit

protocol NavigationItemDelegate {
    func logoutPressed()
    func homebuttonClicked()
}

class NavigationBarItems: UIView {
    
    var homeButton:UIButton = UIButton()
    var titleLabel:UILabel = UILabel()
    var imageView:UIImageView = UIImageView()
    var dashboardHeader:UIView = UIView()
    
    let imgWidth : CGFloat = 44 * 3
    var nbItemDelegate:NavigationItemDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupBarItems()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBarItems(){
         homeButton = UIButton(type: UIButton.ButtonType.custom)
         homeButton.frame = CGRect(x: offset, y: offset, width: 24, height: 24)
         homeButton.addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
         homeButton.isEnabled = false
         homeButton.setImage(UIImage(named: "home_green"), for: .normal)
         self.addSubview(homeButton)
         
         let logoutBtn = UIButton(type: UIButton.ButtonType.custom)
         logoutBtn.frame = CGRect(x: screenWidth, y: offset, width: 24, height: 24)
         logoutBtn.backgroundColor = .white
         logoutBtn.layer.borderColor = UIColor.systemBlue.cgColor
         logoutBtn.layer.borderWidth = 1
         logoutBtn.setImage(UIImage(named: "Profile"), for: .normal)
         logoutBtn.scalesLargeContentImage = true
         logoutBtn.layer.cornerRadius = logoutBtn.frame.size.width/2
         logoutBtn.addTarget(self, action: #selector(logoutPressed(sender:)), for: .touchUpInside)
         self.addSubview(logoutBtn)
         NSLayoutConstraint.on([
             logoutBtn.pinWH(size: CGSize(width: logoutBtn.frame.size.width, height: 24)),
             logoutBtn.pinTop(view: logoutBtn, refView: self, thisConstant: offset),
             logoutBtn.pinRight(view: logoutBtn, refView: self, thisConstant: -(1 * offset))
         ])
         
         let x = 2 * offset + homeButton.frame.size.width
         titleLabel = UILabel(frame: CGRect(x: x, y: 0, width: screenWidth - 2 * x, height: 44))
         titleLabel.backgroundColor = .clear
         titleLabel.textColor = .black
         titleLabel.textAlignment = .center
         titleLabel.text = ""
         titleLabel.font = setFont(size: 16, family: "helvetica neue")
         titleLabel.baselineAdjustment = .alignCenters
         self.addSubview(titleLabel)
         NSLayoutConstraint.on([
             titleLabel.pinWH(size: CGSize(width: titleLabel.frame.size.width, height: titleLabel.frame.size.height)),
             titleLabel.pinVertical(view: self)
         ])
         
         dashboardHeader = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 44))
         self.addSubview(dashboardHeader)
                     
         let label = UILabel(frame: CGRect(x: 0, y: 0, width: dashboardHeader.frame.size.width, height: 44))
         label.backgroundColor = .clear
         label.textColor = .black
         label.textAlignment = .center
         label.text = "Dashboard"
         label.baselineAdjustment = .alignCenters
         dashboardHeader.addSubview(label)
         label.sizeToFit()
         
//         let logImg = UIImage(named: "CenturyLink-Logo")
//         let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: Int(imgWidth), height: 44))
//         imageView.image = logImg
//         imageView.contentMode = .scaleAspectFit
//         dashboardHeader.addSubview(imageView)
         
         label.frame = CGRect(x: imageView.frame.origin.x + imageView.frame.size.width + offset/2, y: 0, width: label.frame.size.width, height: 44)
         dashboardHeader.frame.size.width = imageView.frame.size.width + label.frame.size.width + offset
         dashboardHeader.translatesAutoresizingMaskIntoConstraints = false
         NSLayoutConstraint.on([
             dashboardHeader.pinWH(size: CGSize(width: dashboardHeader.frame.size.width, height: self.frame.size.height)),
             dashboardHeader.pinVertical(view: self)
         ])
    }
    
    @objc func logoutPressed(sender:UIButton){
        if self.nbItemDelegate != nil{
            self.nbItemDelegate.logoutPressed()
        }
    }
    
    @objc func buttonClicked(sender:UIButton){
        if self.nbItemDelegate != nil{
            self.nbItemDelegate.homebuttonClicked()
        }
    }
}
