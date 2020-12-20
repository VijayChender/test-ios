//
//  PerformanceController.swift
//  LASER
//
//  Created by Santhosh Kumar on 4/28/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import Foundation
import UIKit

class MetricsController: BaseViewController {
    
    var serView : MetricsView = MetricsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = .orange
        self.setBarTitle(title: "Metrics", isDashboard: false)
//        self.searchBarItems.selectedItem.setTitle("Device", for: .normal)
        self.searchbarSelectionList.selectiondata = ["Device","Service Id","Ring"]
//        self.searchBarItems.hideActionItems(status: false)
        self.addView()
    }
    
    func addView(){
        let yPosition : CGFloat = offset
        serView = MetricsView(frame: CGRect(x: 0, y: yPosition, width: screenWidth, height: screenHeight - 2 * yPosition - tabBarHeight))
        serView.backgroundColor = .orange
        self.view.addSubview(serView)
        
        NSLayoutConstraint.on([
            serView.pinTop(view: serView, refView: self.view, thisConstant: yPosition),
            serView.pinLeft(view: serView, refView: self.view, thisConstant: offset),
            serView.pinRight(view: serView, refView: self.view, thisConstant: -offset),
            serView.pinBottom(view: serView, refView: self.view, thisConstant: -tabBarHeight - offset/2)
        ])
    }
}
