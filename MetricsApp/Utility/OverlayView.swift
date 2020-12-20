//
//  OverlayView.swift
//  LASER
//
//  Created by Santhosh Kumar on 5/22/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import Foundation
import UIKit

protocol OverlayViewDelegate {
    func dismissOverlay()
}

class OverlayView: UIView {
    
    var overlay:UIButton = UIButton()
    var imgView:UIImageView = UIImageView()
    var table:UITableView = UITableView()
    var overlayDelegate : OverlayViewDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupOverlay()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupOverlay(){
        overlay = UIButton(type: UIButton.ButtonType.custom)
        overlay.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        overlay.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.25)
        overlay.addTarget(self, action: #selector(overlayTapped(sender:)), for: .touchUpInside)
        self.bringSubviewToFront(overlay)
        self.addSubview(overlay)
        
        NSLayoutConstraint.on([
            overlay.pinLeft(view: overlay, refView: self, thisConstant: 0),
            overlay.pinRight(view: overlay, refView: self, thisConstant: 0),
            overlay.pinTop(view: overlay, refView: self, thisConstant: 0),
            overlay.pinBottom(view: overlay, refView: self, thisConstant: 0)
        ])
    }
    
    @objc func overlayTapped(sender:UIButton){
        if self.overlayDelegate != nil{
            self.overlayDelegate.dismissOverlay()
        }
    }
    
    func dropList(sender:UIButton, dataCount: Int){
        var img = UIImage(named: "icon.down-arrow")
        img = img?.withTintColor(.white, renderingMode: UIImage.RenderingMode.alwaysOriginal)
        var yPos:CGFloat = sender.frame.size.height + sender.frame.origin.y
        
        imgView.removeFromSuperview()
        imgView = UIImageView(frame: CGRect(x: sender.frame.size.width/2, y: yPos, width: 20, height: 18))
        imgView.image = img
        imgView.transform = CGAffineTransform.init(rotationAngle: .pi)
        overlay.addSubview(imgView)
        yPos += imgView.frame.size.height
        
        NSLayoutConstraint.on([
            imgView.pinTop(view: imgView, refView: sender, thisConstant: sender.frame.size.height),
            imgView.pinWH(size: CGSize(width: imgView.frame.size.width, height: imgView.frame.size.height)),
            imgView.pinLeft(view: imgView, refView: sender, thisConstant: sender.frame.size.width/2 - imgView.frame.size.width/2)
        ])
        
        table.removeFromSuperview()
        let cellHt = cellHeight * CGFloat(dataCount)
        table = UITableView(frame: CGRect(x: offset, y: yPos - 2, width: sender.frame.size.width, height: cellHt))
        table.separatorColor = .gray
        table.register(UITableViewCell.self, forCellReuseIdentifier: "selectionCell")
        table.layer.cornerRadius = 5
        table.isScrollEnabled = false
        overlay.addSubview(table)
        NSLayoutConstraint.on([
            table.pinTop(view: table, refView: imgView, thisConstant: imgView.frame.size.height),
            table.pinWH(size: CGSize(width: table.frame.size.width, height: table.frame.size.height)),
            table.pinLeft(view: table, refView: sender, thisConstant: 0)
        ])
    }
}
