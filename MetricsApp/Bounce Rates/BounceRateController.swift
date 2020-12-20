//
//  NetworkProbeController.swift
//  LASER
//
//  Created by Santhosh Kumar on 4/28/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import Foundation
import UIKit

class BounceRateController: BaseViewController {
    
    var probeView : BounceRateView = BounceRateView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBarTitle(title: "Bounce Rate", isDashboard: false)
        self.searchbarSelectionList.selectiondata = ["I","N","R","A"]
        self.addView()
    }
    
    func addView(){
        let yPosition : CGFloat = offset
        probeView = BounceRateView(frame: CGRect(x: 0, y: yPosition, width: screenWidth, height: screenHeight - 2 * yPosition - tabBarHeight))
        probeView.backgroundColor = .systemOrange
        self.view.addSubview(probeView)
        
        NSLayoutConstraint.on([
            probeView.pinTop(view: probeView, refView: self.view, thisConstant: yPosition),
            probeView.pinLeft(view: probeView, refView: self.view, thisConstant: offset),
            probeView.pinRight(view: probeView, refView: self.view, thisConstant: -offset),
            probeView.pinBottom(view: probeView, refView: self.view, thisConstant: -tabBarHeight - offset/2)
        ])
    }
}
