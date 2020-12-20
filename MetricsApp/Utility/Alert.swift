//
//  Alert.swift
//  LASER
//
//  Created by Santhosh Kumar on 4/26/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import Foundation
import UIKit


class Alert: UIViewController {
    
    let alertWidth:CGFloat = 200
    let alertHeight:CGFloat = 100
    var titleLbl:UILabel?
    var messageLbl:UILabel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(white: 0, alpha: 0.4)
        self.addAlertView()
    }
    
    func addAlertView(){
        let view = UIView(frame: CGRect(x: screenWidth/2 - alertWidth/2, y: screenHeight/2 - alertHeight/2, width: alertWidth, height: alertHeight))
        view.layer.borderColor = UIColor.red.cgColor
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 2
        
        titleLbl?.frame = CGRect(x: 0, y: 0, width: view.frame.size.width - offset, height: view.frame.size.height/4)
        titleLbl?.textAlignment = .center
        titleLbl?.textColor = .black
        titleLbl?.font = setFont(size: 24, family: "helvetica neue")
        
        messageLbl?.frame = CGRect(x: 0, y: (titleLbl?.frame.size.height)! + 1, width: view.frame.size.width - offset, height: view.frame.size.height/3)
        messageLbl?.textAlignment = .center
        messageLbl?.textColor = .black
        messageLbl?.font = setFont(size: 16, family: "helvetica neue")
        
        view.addSubview(titleLbl!)
        view.addSubview(messageLbl!)
        self.view.addSubview(view)
    }
    
    public func showAlertWith(title:String, message: String){
        if (title.isEmpty == false){
            titleLbl?.text = title
        }
        
        
        if (message.isEmpty == false){
            messageLbl?.text = message
        }
    }
}
