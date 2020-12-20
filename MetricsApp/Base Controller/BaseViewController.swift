//
//  ViewController.swift
//  LASER
//
//  Created by Santhosh Kumar on 4/25/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import UIKit
import Network

class BaseViewController: LayoutBarn, NavigationItemDelegate, OverlayViewDelegate, TabViewTableDelegate{
    func dismissOverlay() {
    }
    
    let imgWidth : CGFloat = 44 * 3
    var baseBarView:UINavigationBar = UINavigationBar()
    var navbarItems:NavigationBarItems = NavigationBarItems()
    var popToastLabel:UILabel = UILabel()
    var searchResults: [String]?
    var overlay : OverlayView = OverlayView()
    
    var searchbarSelectionList : SearchSelectionTableDDS = SearchSelectionTableDDS()
    var tabBarSelectionList : TabSelectionTableDDS = TabSelectionTableDDS()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.checkNetworkAvailability()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
           if UIDevice.current.orientation.isLandscape {
               print("Landscape-------->")
           }
           else if UIDevice.current.orientation.isFlat {
               print("Flat")
           } else {
               print("Portrait------>")
           }
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        if (self.navigationController?.topViewController!.isViewLoaded)!{
            self.checkNetworkAvailability()
            self.setToastPopup()
            self.setNavigationBarItems()
            self.addOverlay()
        }
    }
    
    //-------Setting title bar--------
    func setBarTitle(title:String, isDashboard:Bool){
        navbarItems.homeButton.isEnabled = false
        navbarItems.dashboardHeader.isHidden = true
        navbarItems.titleLabel.text = ""
        if (!isDashboard){
            if !(title .isEmpty){
                navbarItems.titleLabel.text = title
            }
            navbarItems.homeButton.isEnabled = true
        }else{
            navbarItems.dashboardHeader.isHidden = false
        }
    }
    // --------Overlay view-----------
     func addOverlay(){
        overlay.removeFromSuperview()
        overlay = OverlayView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        overlay.alpha = 0.0
        overlay.backgroundColor = .clear
        overlay.overlayDelegate = self as OverlayViewDelegate
        self.overlay.table.delegate = self.searchbarSelectionList
        self.overlay.table.dataSource = self.searchbarSelectionList
        self.navigationController!.view.addSubview(overlay)
        
        NSLayoutConstraint.on([
            overlay.pinTop(view: overlay, refView: self.navigationController!.view, thisConstant: 0),
            overlay.pinLeft(view: overlay, refView: self.navigationController!.view, thisConstant: 0),
            overlay.pinRight(view: overlay, refView: self.navigationController!.view, thisConstant: 0),
            overlay.pinBottom(view: overlay, refView: self.navigationController!.view, thisConstant: 0)
        ])
    }
    
    // Tab bar related selection for multiple items in a tab
    func tabSelectedCell(table: UITableView, indexPath: IndexPath, uponData: [String]) {
        
    }
}
