//
//  NetworkPerformanceView.swift
//  LASER
//
//  Created by Santhosh Kumar on 4/27/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import Foundation
import UIKit

class VisitedPageView: UIView {
    
    var scrollView : UIScrollView = UIScrollView()
    var cannedBase : UIView = UIView()
    var privateBase : UIView = UIView()
    var publicBase : UIView = UIView()
    
    var yPos : CGFloat = 0    
    let headerBar : CGFloat = 40
    
    func setNPerformanceViewBasics(){
        self.backgroundColor = .white
        self.setupViewBase()
        self.addCannedReports()
        self.addPrivateReports()
        self.addPublicReports()
        scrollView.contentSize = CGSize(width: screenWidth, height: yPos - 100)
    }
    
    func setupViewBase(){
        let base : UIView = UIView()
        base.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        base.backgroundColor = UIColor(white: 0.97, alpha: 1)
        base.layer.borderColor = UIColor.lightGray.cgColor
        base.layer.borderWidth = 1
        base.layer.cornerRadius = 4
        self.addSubview(base)
        
        let line = getLineOfLength(length: base.frame.size.width, color: .lightGray)
        line.frame.origin.y = headerBar
        base.addSubview(line)
        
        NSLayoutConstraint.on([
            line.pinTop(view: line, refView: base, thisConstant: headerBar),
            line.pinLeft(view: line, refView: base, thisConstant: 0),
            line.pinRight(view: line, refView: base, thisConstant: 0),
            line.pinHeight(view: line, thisHeight: 1)
        ])
        yPos += line.frame.origin.y + offset
        
        NSLayoutConstraint.on([
            base.pinTop(view: base, refView: self, thisConstant: 0),
            base.pinLeft(view: base, refView: self, thisConstant: 0),
            base.pinRight(view: base, refView: self, thisConstant: 0),
            base.pinBottom(view: base, refView: self, thisConstant: 0)
        ])
        self.setHeaderComponents(forView:base)
        self.addScrollView(view: base)
    }
    
    func setHeaderComponents(forView:UIView){
        let headerLbl = getLableOfSize(frame: CGRect(x: offset, y: offset, width: forView.frame.size.width, height: headerBar))
        headerLbl.text = "Available Reports"
        headerLbl.textAlignment = .left
        headerLbl.font = setFont(size: 16, family: "HelveticaNeue-Bold")
        headerLbl.sizeToFit()
        forView.addSubview(headerLbl)
    }
    
    func addScrollView(view:UIView){
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        scrollView.backgroundColor = .clear
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        scrollView.contentSize = CGSize(width: frame.size.width, height: frame.size.height)
        view.addSubview(scrollView)
        NSLayoutConstraint.on([
            scrollView.pinTop(view: scrollView, refView: view, thisConstant: 45),
            scrollView.pinLeft(view: scrollView, refView: view, thisConstant: 10),
            scrollView.pinRight(view: scrollView, refView: view, thisConstant: -10),
            scrollView.pinBottom(view: scrollView, refView: view, thisConstant: -1)
        ])
    }
    
    func addCannedReports(){
        let header = getLableOfSize(frame: CGRect(x: offset, y: yPos - 20 , width: scrollView.frame.size.width, height: 30))
        header.text = "Canned Report"
        header.textAlignment = .left
        header.font = setFont(size: 16, family: "helvetica neue")
        header.sizeToFit()
        scrollView.addSubview(header)
        
        cannedBase.frame = CGRect(x: 0, y: yPos, width: scrollView.frame.size.width, height: 300)
        cannedBase.backgroundColor = UIColor(white: 0.97, alpha: 1)
        cannedBase.layer.borderColor = UIColor.lightGray.cgColor
        cannedBase.layer.borderWidth = 1
        scrollView.addSubview(cannedBase)
        
        let gradient = UIView(frame: CGRect(x: 0, y: yPos, width: cannedBase.frame.size.width, height: headerBar))
        cannedBase.addSubview(gradient)
        setGradientForView(view: gradient)
        addheaderItems(view: cannedBase)
        addListView(onView: cannedBase)
        
        let line = getLineOfLength(length: cannedBase.frame.size.width, color: .lightGray)
        line.frame.origin.y = 40
        cannedBase.addSubview(line)
        
        NSLayoutConstraint.on([
            line.pinTop(view: line, refView: cannedBase, thisConstant: 40),
            line.pinLeft(view: line, refView: cannedBase, thisConstant: 0),
            line.pinRight(view: line, refView: cannedBase, thisConstant: 0),
            line.pinHeight(view: line, thisHeight: 1)
        ])
        
        NSLayoutConstraint.on([
            cannedBase.pinTop(view: scrollView, refView: cannedBase, thisConstant: -70),
            cannedBase.pinLeft(view: cannedBase, refView: scrollView, thisConstant: 1),
            cannedBase.pinRight(view: cannedBase, refView: scrollView, thisConstant: -1),
            cannedBase.pinHeight(view: cannedBase, thisHeight: 300)
        ])
        
        NSLayoutConstraint.on([
            header.pinTop(view: header, refView: cannedBase, thisConstant: -50),
            header.pinLeft(view: header, refView: scrollView, thisConstant: 0),
            header.pinHeight(view: header, thisHeight: 30)
        ])
        
        NSLayoutConstraint.on([
            gradient.pinTop(view: gradient, refView: cannedBase, thisConstant: 0),
            gradient.pinLeft(view: gradient, refView: cannedBase, thisConstant: 0),
            gradient.pinRight(view: gradient, refView: cannedBase, thisConstant: 0),
            gradient.pinHeight(view: gradient, thisHeight: 40)
        ])
        yPos += cannedBase.frame.origin.y + cannedBase.frame.size.height + 4 * offset
    }
    
    func addPrivateReports(){
        let header = getLableOfSize(frame: CGRect(x: offset, y: cannedBase.frame.origin.y + cannedBase.frame.size.height + 4 * offset , width: scrollView.frame.size.width, height: 30))
        header.text = "Private (User)"
        header.textAlignment = .left
        header.font = setFont(size: 16, family: "helvetica neue")
        header.sizeToFit()
        scrollView.addSubview(header)
        
        privateBase.frame = CGRect(x: 0, y: yPos, width: scrollView.frame.size.width, height: 300)
        privateBase.backgroundColor = UIColor(white: 0.97, alpha: 1)
        privateBase.layer.borderColor = UIColor.lightGray.cgColor
        privateBase.layer.borderWidth = 1
        scrollView.addSubview(privateBase)
        
        let gradient = UIView(frame: CGRect(x: 0, y: yPos, width: privateBase.frame.size.width, height: headerBar))
        privateBase.addSubview(gradient)
        setGradientForView(view: gradient)
        addheaderItems(view: privateBase)
        addListView(onView: privateBase)
        
        let line = getLineOfLength(length: privateBase.frame.size.width, color: .lightGray)
        line.frame.origin.y = 40
        privateBase.addSubview(line)
        
        NSLayoutConstraint.on([
            line.pinTop(view: line, refView: privateBase, thisConstant: 40),
            line.pinLeft(view: line, refView: privateBase, thisConstant: 0),
            line.pinRight(view: line, refView: privateBase, thisConstant: 0),
            line.pinHeight(view: line, thisHeight: 1)
        ])
        
        NSLayoutConstraint.on([
            privateBase.pinTop(view: privateBase, refView: cannedBase, thisConstant: 370),
            privateBase.pinLeft(view: privateBase, refView: cannedBase, thisConstant: 0),
            privateBase.pinRight(view: privateBase, refView: cannedBase, thisConstant: 0),
            privateBase.pinHeight(view: privateBase, thisHeight: 300)
        ])
        
        NSLayoutConstraint.on([
            header.pinTop(view: header, refView: privateBase, thisConstant: -50),
            header.pinLeft(view: header, refView: scrollView, thisConstant: 0),
            header.pinHeight(view: header, thisHeight: 30)
        ])
        
        NSLayoutConstraint.on([
            gradient.pinTop(view: gradient, refView: privateBase, thisConstant: 0),
            gradient.pinLeft(view: gradient, refView: privateBase, thisConstant: 0),
            gradient.pinRight(view: gradient, refView: privateBase, thisConstant: 0),
            gradient.pinHeight(view: gradient, thisHeight: 40)
        ])
        yPos += privateBase.frame.origin.y + privateBase.frame.size.height + 4 * offset
    }
    
    func addPublicReports(){
        let header = getLableOfSize(frame: CGRect(x: offset, y: privateBase.frame.origin.y + privateBase.frame.size.height + 2 * offset , width: scrollView.frame.size.width, height: 30))
        header.text = "Public"
        header.textAlignment = .left
        header.font = setFont(size: 16, family: "helvetica neue")
        header.sizeToFit()
        scrollView.addSubview(header)
        
        publicBase.frame = CGRect(x: 0, y: yPos, width: scrollView.frame.size.width, height: 300)
        publicBase.backgroundColor = UIColor(white: 0.97, alpha: 1)
        publicBase.layer.borderColor = UIColor.lightGray.cgColor
        publicBase.layer.borderWidth = 1
        scrollView.addSubview(publicBase)
        
        let gradient = UIView(frame: CGRect(x: 0, y: yPos, width: publicBase.frame.size.width, height: headerBar))
        publicBase.addSubview(gradient)
        setGradientForView(view: gradient)
        addheaderItems(view: publicBase)
        addListView(onView: publicBase)
        
        let line = getLineOfLength(length: cannedBase.frame.size.width, color: .lightGray)
        line.frame.origin.y = 40
        publicBase.addSubview(line)
        
        NSLayoutConstraint.on([
            line.pinTop(view: line, refView: publicBase, thisConstant: 40),
            line.pinLeft(view: line, refView: publicBase, thisConstant: 0),
            line.pinRight(view: line, refView: publicBase, thisConstant: 0),
            line.pinHeight(view: line, thisHeight: 1)
        ])
        
        NSLayoutConstraint.on([
            publicBase.pinTop(view: publicBase, refView: privateBase, thisConstant: 370),
            publicBase.pinLeft(view: publicBase, refView: privateBase, thisConstant: 0),
            publicBase.pinRight(view: publicBase, refView: privateBase, thisConstant: 0),
            publicBase.pinHeight(view: publicBase, thisHeight: 300)
        ])
        
        NSLayoutConstraint.on([
            header.pinTop(view: header, refView: publicBase, thisConstant: -50),
            header.pinLeft(view: header, refView: scrollView, thisConstant: 0),
            header.pinHeight(view: header, thisHeight: 30)
        ])
        
        NSLayoutConstraint.on([
            gradient.pinTop(view: gradient, refView: publicBase, thisConstant: 0),
            gradient.pinLeft(view: gradient, refView: publicBase, thisConstant: 0),
            gradient.pinRight(view: gradient, refView: publicBase, thisConstant: 0),
            gradient.pinHeight(view: gradient, thisHeight: 40),
        ])
    }
    
    func setGradientForView(view:UIView){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = (view.bounds)
        gradientLayer.colors = [UIColor.init(red: 246/255, green: 249/255, blue: 253/255, alpha: 1).cgColor,UIColor.init(red: 236/255, green: 241/255, blue: 251/255, alpha: 1).cgColor,UIColor.init(red: 226/255, green: 234/255, blue: 248/255, alpha: 1).cgColor,UIColor.init(red: 218/255, green: 228/255, blue: 245/255, alpha: 1).cgColor, UIColor.init(red: 206/255, green: 219/255, blue: 240/255, alpha: 1).cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func addheaderItems(view:UIView){
        let arrow = UIImageView(frame: CGRect(x: offset, y: offset, width: 14, height: 14))
        arrow.image = UIImage(named: "dataArrow")
        view.addSubview(arrow)
        var xPos : CGFloat = arrow.frame.origin.x + arrow.frame.size.width + 4
        
        let lbl = getLableOfSize(frame: CGRect(x: xPos, y: offset, width: cannedBase.frame.size.width, height: 30))
        lbl.text = "Query Name"
        lbl.textAlignment = .left
        lbl.textColor = .black
        lbl.font = setFont(size: 12, family: "AvenirNextCondensed-Medium")
        lbl.sizeToFit()
        view.addSubview(lbl)
        xPos += lbl.frame.size.width + 7
        
        let menuIcon = UIImageView(frame: CGRect(x: xPos, y: offset + 2, width: 12, height: 12))
        menuIcon.image = UIImage(named: "menuicon")
        view.addSubview(menuIcon)
        
        let actionItemsBase = UIView(frame: CGRect(x: view.frame.size.width - screenWidth/4, y: offset/2, width: screenWidth/4, height: 30))
        actionItemsBase.backgroundColor = .green
        view.addSubview(actionItemsBase)
        
        NSLayoutConstraint.on([
            actionItemsBase.pinTop(view: actionItemsBase, refView: view, thisConstant: offset/2),
            actionItemsBase.pinRight(view: actionItemsBase, refView: view, thisConstant: 0),
            actionItemsBase.pinWH(size: CGSize(width: actionItemsBase.frame.size.width, height: 30))
        ])
        
        let addBtn = UIButton(frame: CGRect(x: offset/2, y: offset/2, width: 20, height: 20))
        addBtn.backgroundColor = .systemRed
        actionItemsBase.addSubview(addBtn)
        xPos = addBtn.frame.origin.x + addBtn.frame.size.width + 10
        
        let annBtn = UIButton(frame: CGRect(x: xPos, y: offset/2, width: 20, height: 20))
        annBtn.backgroundColor = .systemBlue
        actionItemsBase.addSubview(annBtn)
        xPos += annBtn.frame.size.width + 10
        
        let notesBtn = UIButton(frame: CGRect(x: xPos, y: offset/2, width: 20, height: 20))
        notesBtn.backgroundColor = .systemTeal
        actionItemsBase.addSubview(notesBtn)
    }
    
    func addListView(onView:UIView){
        let displayLbl = getLableOfSize(frame: CGRect(x: 1, y: headerBar, width: onView.frame.size.width - 2, height: 30))
        displayLbl.text = "No Rows To Show"
        onView.addSubview(displayLbl)
        
        NSLayoutConstraint.on([
            displayLbl.pinTop(view: displayLbl, refView: onView, thisConstant: (onView.frame.size.height - headerBar)/2),
            displayLbl.pinWH(size: CGSize(width: onView.frame.size.width, height: 30)),
            displayLbl.pinVertical(view: onView)
        ])
        
        let list = UITableView(frame: CGRect(x: 1, y: headerBar, width: onView.frame.size.width - 2, height: onView.frame.size.height - headerBar))
        list.backgroundColor = .white
        list.separatorColor = .gray
        list.register(UITableViewCell.self, forCellReuseIdentifier: "genericCell")
        list.bounces = false
        onView.addSubview(list)

        NSLayoutConstraint.on([
            list.pinTop(view: list, refView: onView, thisConstant: headerBar - 1),
            list.pinLeft(view: list, refView: onView, thisConstant: 1),
            list.pinRight(view: list, refView: onView, thisConstant: -1),
            list.pinBottom(view: list, refView: onView, thisConstant: -1)
        ])
    }
}
