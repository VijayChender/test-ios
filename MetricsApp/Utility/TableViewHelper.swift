//
//  TableViewController.swift
//  LASER
//
//  Created by Santhosh Kumar on 5/20/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import Foundation
import UIKit

protocol SearchViewTableDelegate {
    func selectedCell(table:UITableView, indexPath: IndexPath, uponData:[String])
}

protocol GenericTableDelegate {
    func selectedCell(table:UITableView, indexPath: IndexPath, uponData:[String])
}

protocol TabViewTableDelegate {
    func tabSelectedCell(table:UITableView, indexPath: IndexPath, uponData:[String])
}

class GenericTable: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var data:[String]?
    var listDelegate : GenericTableDelegate!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let thisData = self.data{
            return thisData.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "genericCell"){
            for subView in cell.contentView.subviews{
                subView .removeFromSuperview()
            }
            
            let cellLabel = UILabel(frame: CGRect(x: offset, y: 0, width: 100, height: 25))
            cellLabel.backgroundColor = .clear
            cellLabel.textColor = .darkGray
            cellLabel.textAlignment = .left
            cellLabel.text = self.data![indexPath.row]
            cellLabel.font = setFont(size: 14, family: "helvetica neue")
            cellLabel.baselineAdjustment = .alignCenters
            
            cell.backgroundColor = .clear
            cell.clipsToBounds = true
            cell.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            cell.contentView.addSubview(cellLabel)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.listDelegate != nil{
            var thisData:[String]?
            thisData = self.data!
            self.listDelegate.selectedCell(table: tableView, indexPath: indexPath, uponData: thisData!)
        }
    }
}


class SearchSelectionTableDDS : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var selectiondata:[String]?
    var SearchSelectionListDelegate : SearchViewTableDelegate!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let thisData = self.selectiondata{
            return thisData.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 25
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "selectionCell"){
            for subView in cell.contentView.subviews{
                subView .removeFromSuperview()
            }
            
            let cellLabel = UILabel(frame: CGRect(x: offset, y: 0, width: 100, height: 25))
            cellLabel.backgroundColor = .clear
            cellLabel.textColor = .darkGray
            cellLabel.textAlignment = .left
            cellLabel.text = self.selectiondata![indexPath.row]
            cellLabel.font = setFont(size: 12, family: "helvetica neue")
            cellLabel.baselineAdjustment = .alignCenters
            
            cell.backgroundColor = .clear
            cell.clipsToBounds = true
            cell.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            cell.contentView.addSubview(cellLabel)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.SearchSelectionListDelegate != nil{
            var thisData:[String]?
            thisData = self.selectiondata!
            self.SearchSelectionListDelegate.selectedCell(table: tableView, indexPath: indexPath, uponData: thisData!)
        }
    }
}


class TabSelectionTableDDS : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tabSelectiondata:[String]?
    var TabSelectionListDelegate : TabViewTableDelegate!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let thisData = self.tabSelectiondata{
            return thisData.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 25
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "selectionCell"){
            for subView in cell.contentView.subviews{
                subView .removeFromSuperview()
            }
            
            let cellLabel = UILabel(frame: CGRect(x: offset, y: 0, width: 100, height: 25))
            cellLabel.backgroundColor = .clear
            cellLabel.textColor = .darkGray
            cellLabel.textAlignment = .left
            cellLabel.text = self.tabSelectiondata![indexPath.row]
            cellLabel.font = setFont(size: 12, family: "helvetica neue")
            cellLabel.baselineAdjustment = .alignCenters
            
            cell.backgroundColor = .clear
            cell.clipsToBounds = true
            cell.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            cell.contentView.addSubview(cellLabel)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.TabSelectionListDelegate != nil{
            var thisData:[String]?
            thisData = self.tabSelectiondata!
            self.TabSelectionListDelegate.tabSelectedCell(table: tableView, indexPath: indexPath, uponData: thisData!)
        }
    }
}
