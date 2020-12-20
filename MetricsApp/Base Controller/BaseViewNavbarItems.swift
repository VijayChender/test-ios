//
//  BaseViewNavbarItems.swift
//  LASER
//
//  Created by Santhosh Kumar on 7/30/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import Foundation
import UIKit

extension BaseViewController{
    func setNavigationBarItems(){
        baseBarView = UINavigationBar(frame: CGRect(x: 0, y: statusBarHeight, width: screenWidth, height: 44))
        baseBarView.backgroundColor = .clear
        self.navigationController?.view.addSubview(baseBarView)
        NSLayoutConstraint.on([
            baseBarView.pinLeft(view: baseBarView, refView: self.navigationController!.view, thisConstant: 0),
            baseBarView.pinRight(view: baseBarView, refView: self.navigationController!.view, thisConstant: 0),
            baseBarView.pinTop(view: baseBarView, refView: self.navigationController!.view, thisConstant: 0),
            baseBarView.pinVertical(view: self.navigationController!.view)
        ])
        
        navbarItems.frame = CGRect(x: 0, y: 0, width: baseBarView.frame.size.width, height: baseBarView.frame.size.height)
        navbarItems.nbItemDelegate = self
        baseBarView.addSubview(navbarItems)
        NSLayoutConstraint.on([
            navbarItems.pinLeft(view: navbarItems, refView: baseBarView, thisConstant: 0),
            navbarItems.pinRight(view: navbarItems, refView: baseBarView, thisConstant: 0),
            navbarItems.pinTop(view: navbarItems, refView: baseBarView, thisConstant: 0),
            navbarItems.pinBottom(view: navbarItems, refView: baseBarView, thisConstant: 0)
        ])
    }
    
    func logoutPressed() {
        let navigationController = UINavigationController()
        let mainView = LoginViewController()
        navigationController.viewControllers = [mainView]
        UIApplication.shared.windows.first?.rootViewController = navigationController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.popViewController(animated: false)
    }
    
    func homebuttonClicked() {
        let oldTab:UIButton = selectedTabItem
        oldTab.backgroundColor = .gray
        self.navbarItems.homeButton.isEnabled = false
        self.setBarTitle(title: "", isDashboard: true)
        self.navigationController?.popToRootViewController(animated: false)
    }
}

