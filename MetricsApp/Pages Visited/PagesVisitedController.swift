//
//  NetworkPerformanceController.swift
//  LASER
//
//  Created by Santhosh Kumar on 4/28/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import Foundation
import UIKit

class PagesVisitedController: BaseViewController {
    
    var npView:VisitedPageView = VisitedPageView()
//    var npsCriteria:NetworkPerformanceSearchCriteria = NetworkPerformanceSearchCriteria()
    var scrollView : UIScrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBarTitle(title: "Pages Visited", isDashboard: false)
//        self.searchBarItems.actionBase.isHidden = true
//        self.searchBarItems.filterBase.isHidden = true
        self.addSearchBarItems()
        self.addBarComponents()
        self.addView()
    }
    
    func addSearchBarItems(){
//        let searchBarYPos:CGFloat = self.searchBarItems.searchBar.frame.origin.y + self.searchBarItems.searchBar.frame.size.height
//        scrollView = UIScrollView(frame: CGRect(x: 5, y: searchBarYPos, width: self.searchBarItems.frame.size.width - 10, height: 30))
//        scrollView.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha: 0.11)
//        self.searchBarItems.addSubview(scrollView)
//
//        NSLayoutConstraint.on([
//               scrollView.pinTop(view: scrollView, refView: self.searchBarItems, thisConstant: searchBarYPos),
//               scrollView.pinRight(view: scrollView, refView: self.searchBarItems, thisConstant: -offset/2),
//               scrollView.pinLeft(view: scrollView, refView: self.searchBarItems, thisConstant: offset/2),
//               scrollView.pinHeight(view: scrollView, thisHeight: 30)
//        ])
    }
    
    func addBarComponents(){
        let space : CGFloat = scrollView.frame.size.width/4
        let search = UIButton(type: .custom)
        search.frame = CGRect(x: 0, y: 3, width: space - 3.5 * offset, height: 24)
        search.backgroundColor = .systemBlue
        (search .setTitle("Search", for: .normal))
        search.titleLabel?.font = setFont(size: 12, family: "helvetica neue")
        (search .setTitleColor(.white, for: .normal))
        search.layer.cornerRadius = 4
        search.addTarget(self, action: #selector(search(sender:)), for: .touchUpInside)
        scrollView.addSubview(search)
        
        let cpyFilter = UIButton(type: .custom)
        cpyFilter.frame = CGRect(x: search.frame.origin.x + search.frame.size.width + offset, y: 3, width: space - 1.5 * offset, height: 24)
        cpyFilter.backgroundColor = .systemBlue
        (cpyFilter .setTitle("Copy Filters", for: .normal))
        (cpyFilter .setTitleColor(.white, for: .normal))
        cpyFilter.titleLabel?.font = setFont(size: 12, family: "helvetica neue")
        cpyFilter.layer.cornerRadius = 4
        cpyFilter.addTarget(self, action: #selector(copyFilter(sender:)), for: .touchUpInside)
        scrollView.addSubview(cpyFilter)
        
        let autoRefLbl = getLableOfSize(frame: CGRect(x: cpyFilter.frame.size.width + cpyFilter.frame.origin.x + offset, y: 0, width: space - 2 * offset, height: 30))
        autoRefLbl.text = "Auto-refresh:"
        autoRefLbl.font = setFont(size: 12, family: "helvetica neue")
        autoRefLbl.textAlignment = .left
        autoRefLbl.textColor = .white
        autoRefLbl.sizeToFit()
        autoRefLbl.frame.origin.y = scrollView.frame.size.height/2 - autoRefLbl.frame.size.height/2
        scrollView.addSubview(autoRefLbl)
        
        let checkBtn = UIButton(type: .custom)
        checkBtn.frame = CGRect(x: autoRefLbl.frame.origin.x + autoRefLbl.frame.size.width + 5, y: 10, width: 10, height: 10)
        checkBtn.backgroundColor = .orange
        checkBtn.addTarget(self, action: #selector(checkButton(sender:)), for: .touchUpInside)
        scrollView.addSubview(checkBtn)
        
        let pageSizeLbl = getLableOfSize(frame: CGRect(x: scrollView.frame.size.width - space - 3 * offset , y: 0, width: space - 2 * offset, height: 30))
        pageSizeLbl.text = "Page-Size:"
        pageSizeLbl.textAlignment = .left
        pageSizeLbl.font = setFont(size: 12, family: "helvetica neue")
        pageSizeLbl.textColor = .white
        pageSizeLbl.sizeToFit()
        pageSizeLbl.frame.origin.y = scrollView.frame.size.height/2 - pageSizeLbl.frame.size.height/2
        scrollView.addSubview(pageSizeLbl)
        
        let txtField = UITextField(frame: CGRect(x: scrollView.frame.size.width - 60, y: 5, width: 40, height: 20))
        txtField.borderStyle = UITextField.BorderStyle.roundedRect
        txtField.autocapitalizationType = .none
        txtField.clearsOnBeginEditing = true
        txtField.backgroundColor = .white
        txtField.font = setFont(size: 10, family: "helvetica neue")
        scrollView.addSubview(txtField)
    }
    
    func addView(){
        let yPosition : CGFloat = offset
        npView = VisitedPageView(frame: CGRect(x: 0, y: yPosition, width: screenWidth, height: screenHeight - 2 * yPosition - tabBarHeight))
        npView.setNPerformanceViewBasics()
        self.view.addSubview(npView)
        
        NSLayoutConstraint.on([
            npView.pinTop(view: npView, refView: self.view, thisConstant: yPosition),
            npView.pinLeft(view: npView, refView: self.view, thisConstant: offset),
            npView.pinRight(view: npView, refView: self.view, thisConstant: -offset),
            npView.pinBottom(view: npView, refView: self.view, thisConstant: -tabBarHeight - offset/2)
        ])
    }
    
    @objc func search(sender:UIButton){
//        //Search button clicked
//        print("Search button clicked")
//        self.overlay.alpha = 1.0
//        npsCriteria.frame = CGRect(x: offset, y: self.searchBarItems.frame.size.height, width: scrollView.frame.size.width - 2 * offset, height: screenHeight - tabBarHeight - self.searchBarItems.frame.size.height)
//        npsCriteria.showDetails()
//        npsCriteria.backgroundColor = .clear
//        self.overlay.addSubview(npsCriteria)
//        
//        NSLayoutConstraint.on([
//            npsCriteria.pinTop(view: npsCriteria, refView: self.view, thisConstant: self.searchBarItems.frame.size.height),
//            npsCriteria.pinLeft(view: npsCriteria, refView: self.view, thisConstant: offset),
//            npsCriteria.pinRight(view: npsCriteria, refView: self.view, thisConstant: -offset),
//            npsCriteria.pinBottom(view: npsCriteria, refView: self.view, thisConstant: -tabBarHeight - offset/2)
//        ])
    }
    
    @objc func copyFilter(sender:UIButton){
        //Search button clicked
        print("copyFilter clicked")
    }
    
    @objc func checkButton(sender:UIButton){
        //Search button clicked
        print("checkButton clicked")
    }
}
