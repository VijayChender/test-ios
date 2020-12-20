//
//  LoginViewController.swift
//  LASER
//
//  Created by Santhosh Kumar on 5/20/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: BaseViewController, SplashDelegate, LoginDelegate{

    var splash : SplashView = SplashView()
    var loginScreen : LoginView = LoginView()
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
        self.baseBarView.isHidden = false
//        self.searchBarItems.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.baseBarView.isHidden = true
//        self.searchBarItems.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.addLoginScreen()
        if !isLoggedIn{
            self.addSplash()
            isLoggedIn = true
        }
        
//        let op1 = Operation()
//        op1.name = "Operation1"
//        let op2 = ServiceOperation()
//        op2.name = "OPR-2"
//        op2.queue.addOperations([op1], waitUntilFinished: true)
//        op2.execute()
    }
    
    func addSplash(){
        splash.removeFromSuperview()
        splash = SplashView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        splash.splashDelegate = self
        splash.backgroundColor = .white
        self.view.addSubview(splash)
        
        NSLayoutConstraint.on([
            splash.pinTop(view: splash, refView: self.view, thisConstant: 0),
            splash.pinLeft(view: splash, refView: self.view, thisConstant: 0),
            splash.pinRight(view: splash, refView: self.view, thisConstant: 0),
            splash.pinBottom(view: splash, refView: self.view, thisConstant: 0),
            splash.pinVertical(view: self.view)
//            splash.pinHorizontal(view: self.view)
        ])
    }
    
    func splashAnimationDone() {
        UIView.animate(withDuration: 2.0, animations: {
            self.splash.alpha = 0
        }) { _ in
            self.splash.removeFromSuperview()
        }
    }
    
    func addLoginScreen(){
        loginScreen.removeFromSuperview()
        loginScreen = LoginView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        loginScreen.lgnDelegate = self
        loginScreen.backgroundColor = .white
        self.view.addSubview(loginScreen)
        
        NSLayoutConstraint.on([
            loginScreen.pinTop(view: loginScreen, refView: self.view, thisConstant: 0),
            loginScreen.pinLeft(view: loginScreen, refView: self.view, thisConstant: 0),
            loginScreen.pinRight(view: loginScreen, refView: self.view, thisConstant: 0),
            loginScreen.pinBottom(view: loginScreen, refView: self.view, thisConstant: 0),
            loginScreen.pinVertical(view: self.view)
//            loginScreen.pinHorizontal(view: self.view)
        ])
    }
    
    func loginButtonPressed() {
        let dshbrd = DashboardViewController()
        self.navigationController?.pushViewController(dshbrd, animated: false)
        // Set the root view
        let navigationController = UINavigationController()
        let mainView = DashboardViewController(nibName: nil, bundle: nil)
        navigationController.viewControllers = [mainView]
        UIApplication.shared.windows.first?.rootViewController = navigationController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    func showAlert(usr: String, psw: String) {
        if usr.count <= 0 && psw.count <= 0{
            self.setToastMessage(msg: " Please provide Username and Password")
        }else if usr.count <= 0{
            self.setToastMessage(msg: " Please provide Username")
        }else if psw.count <= 0{
            self.setToastMessage(msg: " Please provide Password")
        }else{
            self.setToastMessage(msg: " Username or Password is wrong  ")
        }
    }
}
