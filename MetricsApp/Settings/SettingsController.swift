//
//  NetworkToolsController.swift
//  LASER
//
//  Created by Santhosh Kumar on 4/28/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import Foundation
import UIKit

class SettingsController: BaseViewController {
    
    var serView: SettingsView = SettingsView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBarTitle(title: "Settings", isDashboard: false)
        self.addView()
    }
    
    func addView(){
        let yPosition : CGFloat = offset
        serView = SettingsView(frame: CGRect(x: 0, y: yPosition, width: screenWidth, height: screenHeight - 2 * yPosition - tabBarHeight))
        serView.backgroundColor = .systemBlue
        self.view.addSubview(serView)
        
        NSLayoutConstraint.on([
            serView.pinTop(view: serView, refView: self.view, thisConstant: yPosition),
            serView.pinLeft(view: serView, refView: self.view, thisConstant: offset),
            serView.pinRight(view: serView, refView: self.view, thisConstant: -offset),
            serView.pinBottom(view: serView, refView: self.view, thisConstant: -tabBarHeight - offset/2)
        ])
    }
}
