//
//  ServiceController.swift
//  LASER
//
//  Created by Santhosh Kumar on 4/28/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import Foundation
import UIKit

class GraphsController: BaseViewController {
 
    var serView : GraphsView = GraphsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBarTitle(title: "Graphs", isDashboard: false)
//        self.searchBarItems.selectedItem.setTitle("Service Id", for: .normal)
        self.searchbarSelectionList.selectiondata = ["Account Id","Account Name","Customer Id","Customer Name","Order Id","PIID","PPID","Service Id","TID"]
//        self.searchBarItems.hideActionItems(status: false)
        self.addView()
    }
    
    func addView(){
        let yPosition : CGFloat = offset
        serView = GraphsView(frame: CGRect(x: 0, y: yPosition, width: screenWidth, height: screenHeight - 2 * yPosition - tabBarHeight))
        serView.backgroundColor = .systemPink
        self.view.addSubview(serView)
        
        NSLayoutConstraint.on([
            serView.pinTop(view: serView, refView: self.view, thisConstant: yPosition),
            serView.pinLeft(view: serView, refView: self.view, thisConstant: offset),
            serView.pinRight(view: serView, refView: self.view, thisConstant: -offset),
            serView.pinBottom(view: serView, refView: self.view, thisConstant: -tabBarHeight - offset/2)
        ])
    }
}
