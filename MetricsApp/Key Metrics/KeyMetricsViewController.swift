//
//  TSCViewController.swift
//  LASER
//
//  Created by Santhosh Kumar on 5/11/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import Foundation
import UIKit

class KeyMetricsViewController: BaseViewController {
    
    var tscView : KeyMetricsView = KeyMetricsView()
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBarTitle(title: "Key Metrics", isDashboard: false)
//        self.searchBarItems.selectedItem.setTitle("Service Id", for: .normal)
//        self.searchbarSelectionList.selectiondata = ["Service Id","Ticket Id"]
//        self.searchBarItems.hideActionItems(status: true)
        self.addView()
    }
    
    func addView(){
        let yPosition : CGFloat =  offset
        tscView = KeyMetricsView(frame: CGRect(x: 0, y: yPosition, width: screenWidth, height: screenHeight - 2 * yPosition - tabBarHeight))
        tscView.backgroundColor = .systemRed
        self.view.addSubview(tscView)
        
        NSLayoutConstraint.on([
            tscView.pinTop(view: tscView, refView: self.view, thisConstant: yPosition),
            tscView.pinLeft(view: tscView, refView: self.view, thisConstant: offset),
            tscView.pinRight(view: tscView, refView: self.view, thisConstant: -offset),
            tscView.pinBottom(view: tscView, refView: self.view, thisConstant: -tabBarHeight - offset/2)
        ])
    }
}
