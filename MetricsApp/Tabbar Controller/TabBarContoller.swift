//
//  TabBarContoller.swift
//  LASER
//
//  Created by Santhosh Kumar on 4/27/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: BaseViewController {
    var baseView:UIView = UIView()
    var popView:UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTabbar()
    }
    
    // This is for tab bar in the center
    func addTabbar(){
        baseView = UIView(frame: CGRect(x: 0, y: screenHeight - tabBarHeight, width: screenWidth, height: tabBarHeight))
        self.navigationController?.view.addSubview(baseView)
        NSLayoutConstraint.on([
            baseView.pinLeading(view: baseView, refView: self.navigationController!.view, thisConstant: 0),
            baseView.pinTrailing(view: baseView, refView: self.navigationController!.view, thisConstant: 0),
            baseView.pinVertical(view: self.navigationController!.view),
            baseView.pinHeight(view: baseView, thisHeight: tabBarHeight),
            baseView.pinBottom(view: baseView, refView: self.navigationController!.view, thisConstant: 0)
        ])
        
        let scroll:UIScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: baseView.frame.size.width, height: baseView.frame.size.height))
        scroll.contentSize = CGSize(width: screenWidth, height: tabBarHeight)
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        scroll.bounces = false
        scroll.backgroundColor = .clear
        baseView.addSubview(scroll)
        
        NSLayoutConstraint.on([
            scroll.pinVertical(view: baseView),
            scroll.pinWH(size: CGSize(width: screenWidth, height: tabBarHeight)),
            scroll.pinBottom(view: scroll, refView: baseView, thisConstant: 0)
        ])
        
        var xPos:CGFloat = 0
        let tabWidth:CGFloat = screenWidth/CGFloat(tabName.count)
        
        for i in 0 ..< tabName.count {
            let button = UIButton(type: UIButton.ButtonType.custom)
            button.frame = CGRect(x: xPos, y: 0, width: tabWidth, height: tabBarHeight)
            button.tag = 100 + i
            button.backgroundColor = .gray
            button.setTitle(tabName[i], for: .normal)
            button.titleLabel?.font = UIFont(name: "helvetica-bold", size: 10)
            button.titleLabel?.numberOfLines = 0
            button.titleLabel?.lineBreakMode = .byWordWrapping
            button.titleLabel?.textAlignment = .center
            button.setTitleColor(.orange, for: .normal)
            button.addTarget(self, action: #selector(selectedTab(sender:)), for: UIControl.Event.touchUpInside)
            scroll.addSubview(button)
            xPos = xPos + tabWidth + 1
        }
    }
    
    @objc func selectedTab(sender:UIButton){
        popView.removeFromSuperview()
        if sender.titleLabel?.text == "Network Tools"{
            self.overlay.alpha = 0
            self.tabBarSelectionList.tabSelectiondata = ["Network Path","Link Flaps"]
            popView = self.checkPopupList(data: self.tabBarSelectionList.tabSelectiondata!,tabIndex: 2)
            self.navigationController?.view.addSubview(popView)

        }else if sender.titleLabel?.text == "Network Probe Metrics"{
            self.overlay.alpha = 0
            self.tabBarSelectionList.tabSelectiondata = ["AS3549 Edge to Customer","AS3356 POP TO POP","AS3549 POP TO POP"]
            popView = self.checkPopupList(data: self.tabBarSelectionList.tabSelectiondata!,tabIndex: 5)
            self.navigationController?.view.addSubview(popView)

        }else{
            if (selectedTabItem.tag != -1){
                let oldTab:UIButton = selectedTabItem
                oldTab.backgroundColor = .gray
            }
            let tab:UIButton = sender
            tab.backgroundColor = .green
            selectedTabItem = sender
            self.showViewController(tag:sender)
        }
    }
    
    func showViewController(tag:UIButton){}
    
    func checkPopupList(data:[String], tabIndex:Int) -> UIView{
        let cellHt = cellHeight * CGFloat(data.count)
        let tabWidth:CGFloat = screenWidth/CGFloat(tabName.count)
        let xPos:CGFloat = CGFloat(tabIndex) * tabWidth - tabWidth/2
        
        var img = UIImage(named: "icon.down-arrow")
        img = img?.withTintColor(.orange, renderingMode: UIImage.RenderingMode.alwaysOriginal)
        var yPos = self.view.frame.size.height - tabBarHeight - 20
        self.tabBarSelectionList.tabSelectiondata = data
 
        yPos -= ( cellHt)
        let table = UITableView(frame: CGRect(x: 10, y: 0, width: 100, height: cellHt))
        table.backgroundColor = .green
        table.separatorColor = .gray
        table.register(UITableViewCell.self, forCellReuseIdentifier: "selectionCell")
        table.layer.cornerRadius = 5
        table.delegate = TabSelectionTableDDS()
        table.dataSource = TabSelectionTableDDS()
        table.isScrollEnabled = false

        let view = UIView(frame: CGRect(x: xPos - 60, y: yPos, width: 120, height: cellHt + 20))
        view.backgroundColor = .clear
        let imgView = UIImageView(frame: CGRect(x: view.frame.size.width/2 - 10, y: view.frame.size.height - 20, width: 20, height: 18))
        imgView.image = img
        view.addSubview(imgView)
        view.addSubview(table)
        
        return view
    }
}
