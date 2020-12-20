//
//  DashboardViewController.swift
//  LASER
//
//  Created by Santhosh Kumar on 4/25/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import Foundation
import UIKit

class DashboardViewController: TabBarController {
    
    var listView:UITableView = UITableView()
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setBarTitle(title: "Dashboard",isDashboard: true)
    }
    
    // ------Tabbar related section--------
    override func showViewController(tag:UIButton){
        self.loadViewFor(index:tag)
        self.setBarTitle(title: tabName[tag.tag - 100], isDashboard: false)
    }
    
    // ----For list view-----
    func addtableView(){
        let yPos:CGFloat = 100
        listView.removeFromSuperview()
        listView = UITableView(frame: CGRect(x: offset, y: yPos, width: self.view.frame.size.width - 2 * offset, height: self.view.frame.size.height - 2 * yPos))
        listView.separatorColor = .gray
        listView.register(UITableViewCell.self, forCellReuseIdentifier: "genericCell")
        self.view.addSubview(listView)
        NSLayoutConstraint.on([
            listView.pinTop(view: listView, refView: self.view, thisConstant: yPos),
            listView.pinRight(view: listView, refView: self.view, thisConstant: 0),
            listView.pinLeft(view: listView, refView: self.view, thisConstant: 0),
            listView.pinBottom(view: listView, refView: self.view, thisConstant: -tabBarHeight)
        ])
    }
    
    //--------Tab bar selection--------------
    func loadViewFor(index:UIButton){
        self.navbarItems.homeButton.isEnabled = true
        selectedTabItem = index
        self.navigationController?.popViewController(animated: false)
        switch index.tag - 100 {
        case 0:
            print("TSC")
            let kmController = KeyMetricsViewController()
            self.navigationController?.pushViewController(kmController, animated: false)
        case 1:
            print("NT")
            let brController = BounceRateController()
            self.navigationController?.pushViewController(brController, animated: false)
        case 2:
            print("PV")
            let mController = MetricsController()
            self.navigationController?.pushViewController(mController, animated: false)
        case 3:
            print("SV")
            let gController = GraphsController()
            self.navigationController?.pushViewController(gController, animated: false)
        case 4:
            print("NPM")
            let pvController = PagesVisitedController()
            self.navigationController?.pushViewController(pvController, animated: false)
        case 5:
            print("NPV")
            let sController = SettingsController()
            self.navigationController?.pushViewController(sController, animated: false)
        default:
            break;
        }
    }
}
