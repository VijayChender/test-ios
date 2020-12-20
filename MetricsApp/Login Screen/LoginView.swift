//
//  LoginView.swift
//  LASER
//
//  Created by Santhosh Kumar on 5/20/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import Foundation
import UIKit

protocol LoginDelegate {
    func loginButtonPressed()
    func showAlert(usr:String, psw:String)
}

class LoginView: UIView {
    
    var lgnDelegate : LoginDelegate!
    var yPos : CGFloat = 0
    let fieldTag = 199
    var scrollView:UIScrollView = UIScrollView()
    var headerBaseView : UIView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addScrollView()
        self.addHeaderContent()
        self.addTextFields()
        self.addLoginButton()
        self.addVersionContent()
        self.setScrollContentSize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addScrollView(){
        scrollView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        scrollView.backgroundColor = .clear
        scrollView.contentSize = CGSize(width: frame.size.width, height: frame.size.height)
        self.addSubview(scrollView)
        NSLayoutConstraint.on([
            scrollView.pinTop(view: scrollView, refView: self, thisConstant: 0),
            scrollView.pinLeft(view: scrollView, refView: self, thisConstant: 0),
            scrollView.pinRight(view: scrollView, refView: self, thisConstant: 0),
            scrollView.pinBottom(view: scrollView, refView: self, thisConstant: 0)
        ])
    }
    
    func setScrollContentSize(){
        scrollView.contentSize = CGSize(width: frame.size.width, height: yPos)
    }
    
    func addHeaderContent(){
        let heightOffset : CGFloat = 50
        let img = resizeImage(image: UIImage(named: "CenturyLink-Logo")!, targetSize: CGSize(width: screenWidth/2, height: screenWidth/4))
//        let headerBaseView = UIView(frame: CGRect(x: screenWidth/2 - (img.size.width)/2, y: 50, width: (img.size.width), height: (img.size.height) + heightOffset))
        headerBaseView.frame = CGRect(x: screenWidth/2 - (img.size.width)/2, y: 50, width: (img.size.width), height: (img.size.height) + heightOffset)
        headerBaseView.backgroundColor = .clear
        scrollView.addSubview(headerBaseView)
        
        let imgView = UIImageView(frame: CGRect(x: headerBaseView.frame.size.width/2 - (img.size.width)/2, y: 0, width: (img.size.width), height: (img.size.height)))
        imgView.image = img
        headerBaseView.addSubview(imgView)
        
        let label = UILabel(frame: CGRect(x: 0, y: imgView.frame.size.height - offset, width: headerBaseView.frame.size.width * getScreenFactor(), height: 30 * getScreenFactor()))
        label.backgroundColor = .clear
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Laser"
        label.font = setFont(size: 25, family: "helvetica-bold")
        label.baselineAdjustment = .alignCenters
        headerBaseView.addSubview(label)
        
        NSLayoutConstraint.on([
            headerBaseView.pinTop(view: scrollView, refView: headerBaseView, thisConstant: -50),
            headerBaseView.pinWH(size: CGSize(width: (img.size.width), height: (img.size.height) + heightOffset)),
            headerBaseView.pinVertical(view: scrollView)
        ])
        
        yPos += headerBaseView.frame.size.height + headerBaseView.frame.origin.y + 4 * offset
    }
    
    func addVersionContent(){
        let password = self.viewWithTag(fieldTag + 1) as! UITextField
        let versionLabel = UILabel(frame: CGRect(x: 0, y: screenHeight - 70, width: screenWidth, height: 24 * getScreenFactor()))
        versionLabel.backgroundColor = .clear
        versionLabel.textColor = .darkGray
        versionLabel.textAlignment = .center
        versionLabel.text = "Version: 1.0.0"
        versionLabel.font = setFont(size: 14, family: "helvetica neue")
        versionLabel.baselineAdjustment = .alignCenters
        scrollView.addSubview(versionLabel)
        yPos = versionLabel.frame.size.height + versionLabel.frame.origin.y
        NSLayoutConstraint.on([
            versionLabel.pinBottom(view: versionLabel, refView: password, thisConstant: 230),
            versionLabel.pinWH(size: CGSize(width: screenWidth, height: 24 * getScreenFactor())),
            versionLabel.pinVertical(view: scrollView)
        ])
    }
    
    func addTextFields(){
        let fieldNames = ["Username","Password"]
        let fieldLength : CGFloat = 250 * getScreenFactor()
        
        let noteLabel = UILabel(frame: CGRect(x: 0, y: yPos, width: screenWidth, height: 24))
        noteLabel.backgroundColor = .clear
        noteLabel.textColor = .gray
        noteLabel.textAlignment = .center
        noteLabel.text = "Please use your Active Directory credentials."
        noteLabel.font = setFont(size: 14, family: "helvetica neue")
        noteLabel.baselineAdjustment = .alignCenters
        scrollView.addSubview(noteLabel)
        
        yPos += noteLabel.frame.size.height + 3 * offset
        
        NSLayoutConstraint.on([
            noteLabel.pinTop(view: noteLabel, refView: headerBaseView, thisConstant: screenHeight/3),
            noteLabel.pinWH(size: CGSize(width: screenWidth, height: 24 * getScreenFactor())),
            noteLabel.pinVertical(view: scrollView)
        ])
        
        for i in 0 ..< fieldNames.count{
            let field = UITextField(frame: CGRect(x: screenWidth/2 - fieldLength/2, y: yPos, width: fieldLength, height: 30 * getScreenFactor()))
            field.placeholder = fieldNames[i]
            field.font = setFont(size: 13, family: "helvetica neue")
            field.textAlignment = .left
            field.borderStyle = .roundedRect
            field.tag = fieldTag + i
            field.textColor = .black
            scrollView.addSubview(field)
            
            if fieldNames[i] == "Password"{
                field.isSecureTextEntry = true
                NSLayoutConstraint.on([
                               field.pinTop(view: field, refView: noteLabel, thisConstant: field.frame.size.height + 5 * offset),
                               field.pinWH(size: CGSize(width: fieldLength, height: 30 * getScreenFactor())),
                               field.pinVertical(view: scrollView)
                           ])
            }else{
                NSLayoutConstraint.on([
                               field.pinTop(view: field, refView: noteLabel, thisConstant: 30 * getScreenFactor()),
                               field.pinWH(size: CGSize(width: fieldLength, height: 30 * getScreenFactor())),
                               field.pinVertical(view: scrollView)
                           ])
            }
           
            yPos += field.frame.size.height + 2 * offset
        }
    }
    
    func addLoginButton(){
        let btnLength : CGFloat = 200 * getScreenFactor()
        let loginBtn = UIButton(type: UIButton.ButtonType.custom)
        loginBtn.frame = CGRect(x: screenWidth/2 - btnLength/2, y: yPos + 2 * offset, width: btnLength, height: 40 * getScreenFactor())
        loginBtn.layer.cornerRadius = 5
        loginBtn.backgroundColor = .systemBlue
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.setTitleColor(.white, for: .normal)
        loginBtn.titleLabel?.font = setFont(size: 14, family: "helvetica-bold")
        loginBtn.addTarget(self, action: #selector(loginPressed(sender:)), for: .touchUpInside)
        scrollView.addSubview(loginBtn)
        let password = self.viewWithTag(fieldTag + 1) as! UITextField
        NSLayoutConstraint.on([
            loginBtn.pinTop(view: loginBtn, refView: password, thisConstant: 70),
            loginBtn.pinWH(size: CGSize(width: btnLength, height: 40 * getScreenFactor())),
            loginBtn.pinVertical(view: scrollView)
        ])
        yPos += loginBtn.frame.size.height + 2 * offset
    }
    
    @objc func loginPressed(sender:UIButton){
        let usrname = self.viewWithTag(fieldTag) as! UITextField
        let password = self.viewWithTag(fieldTag + 1) as! UITextField
        
        if lgnDelegate != nil{
            if (usrname.text == "X" && password.text == "x"){
                self.lgnDelegate.loginButtonPressed()
            }else{
                self.lgnDelegate.showAlert(usr: usrname.text!, psw: password.text!)
            }
        }
    }
}
