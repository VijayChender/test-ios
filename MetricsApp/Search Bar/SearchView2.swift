//
//  SearchView.swift
//  LASER
//
//  Created by Santhosh Kumar on 5/15/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import Foundation
import UIKit

class SearchView: UIView {
    var selectedItem : UILabel = UILabel()
    var searchBar: UISearchBar = UISearchBar()
    var selectionBase : UIView = UIView()
    var searchBase : UIView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        searchBase = UIView(frame: CGRect(x: offset/2, y: 0, width: screenWidth - offset, height: 30))
        searchBase.backgroundColor = .red
        self.addSubview(searchBase)
        NSLayoutConstraint.on([
            searchBase.pinTop(view: searchBase, refView: self, thisConstant: 35),
//            searchBase.pinLeft(view: searchBase, refView: self, thisConstant: offset),
//            searchBase.pinRight(view: searchBase, refView: self, thisConstant: -offset),
//            searchBase.pinHeight(view: searchBase, thisHeight: 30)
            
            searchBase.pinVertical(view: self),
            searchBase.pinWH(size: CGSize(width: searchBase.frame.size.width, height: searchBase.frame.size.height))
        ])
        
//        selectionBase = UIView(frame: CGRect(x: searchBase.frame.size.width + offset, y: 0, width: screenWidth/2 - offset/2, height: 30))
        selectionBase = UIView(frame: CGRect(x: offset/2, y: 0, width: screenWidth - offset, height: 30))
        selectionBase.backgroundColor = .green
        self.addSubview(selectionBase)
        NSLayoutConstraint.on([
            selectionBase.pinTop(view: selectionBase, refView: self, thisConstant: 0),
//            selectionBase.pinLeft(view: selectionBase, refView: self, thisConstant: offset),
//            selectionBase.pinRight(view: selectionBase, refView: self, thisConstant: -offset),
            selectionBase.pinVertical(view: self),
            selectionBase.pinWH(size: CGSize(width: selectionBase.frame.size.width, height: selectionBase.frame.size.height))
//            selectionBase.pinHeight(view: selectionBase, thisHeight: 30)
//            selectionBase.pinBetweenObjects(view: searchBase, refView:selectionBase, leftRefView: self, rightRefView: self, thisConstant: 10)
        ])
        
//        self.setSelectionField()
//        self.setSearchField()
//        self.addSegmentSelectionBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //----For selection view ------
    func setSelectionField(){
        selectedItem = UILabel(frame: CGRect(x: 0, y: 0, width: searchBase.frame.size.width / 2.5, height: 20))
        selectedItem.backgroundColor = .clear
        selectedItem.textColor = .black
        selectedItem.font = UIFont(name: "helvetica neue", size: 12)
        selectedItem.textAlignment = .center
        selectedItem.baselineAdjustment = .alignCenters
        searchBase.addSubview(selectedItem)
//        NSLayoutConstraint.on([
//            selectedItem.pinTop(view: selectedItem, refView: searchBase, thisConstant: 0),
//            selectedItem.pinWH(size: CGSize(width: selectedItem.frame.size.width, height: selectedItem.frame.size.height))
//        ])
    }
    
    func isSelectedItemVisible(isVisible:Bool){
        selectedItem.isHidden = !isVisible
        if isVisible{
            NSLayoutConstraint.on([
                selectedItem.pinTop(view: selectedItem, refView: self, thisConstant: 0),
                selectedItem.pinWH(size: CGSize(width: selectedItem.frame.size.width, height: selectedItem.frame.size.height))
            ])
        }else{
            NSLayoutConstraint.on([
                selectedItem.pinTop(view: selectedItem, refView: self, thisConstant: 0),
                selectedItem.pinWH(size: CGSize(width: 0, height: 0))
            ])
        }
    }
    
    func updateSelectedItem(item:String){
        if (selectedItem.text != item && item.isEmpty == false){
            selectedItem.text = item
        }
    }
    
    // ----For search view----
    func setSearchField(){
        let xPos : CGFloat = selectedItem.frame.origin.x + selectedItem.frame.size.width
        searchBar.frame = CGRect(x: xPos, y: 0, width: searchBase.frame.size.width - xPos - offset/2, height: 30)
        searchBar.searchBarStyle = UISearchBar.Style.minimal
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
//        searchBar.isTranslucent = true
        searchBase.addSubview(searchBar)
        /*NSLayoutConstraint.on([
            searchBar.pinTop(view: searchBar, refView: selectedItem, thisConstant: offset),
            searchBar.pinLeft(view: searchBar, refView: selectedItem, thisConstant: offset),
//            searchBar.pinWH(size: CGSize(width: searchBar.frame.size.width, height: searchBar.frame.size.height)),
            searchBar.pinRight(view: searchBar, refView: base, thisConstant: offset)
        ])*/
    }
    
    // --------Segment bar + Field search button section------------
    func addSegmentSelectionBar(){
        
        let items = ["Partial" , "Exact"]
        let segmentedControl = UISegmentedControl(items : items)
        segmentedControl.frame = CGRect(x: 0, y: 0, width: 90, height: 30)
        segmentedControl.selectedSegmentIndex = 0
        let font = UIFont(name: "helvetica neue", size: 11.5)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: font as Any], for: .normal)
        segmentedControl.addTarget(self, action: #selector(indexChanged(_:)), for: .valueChanged)
        segmentedControl.backgroundColor = .systemBlue
        segmentedControl.selectedSegmentTintColor = .green
        selectionBase.addSubview(segmentedControl)
        
        let fieldSearch = UIButton(type: UIButton.ButtonType.custom)
        fieldSearch.frame = CGRect(x: segmentedControl.frame.size.width + offset/2, y: 0, width: 80, height: 30)
        fieldSearch.setTitle("Field Search", for: .normal)
        fieldSearch.backgroundColor = .systemBlue
        fieldSearch.layer.cornerRadius = 8.0
        fieldSearch.titleLabel?.font = UIFont(name: "helvetica neue", size: 11.5)
        selectionBase.addSubview(fieldSearch)
        
//        NSLayoutConstraint.on([
//            searchBar.pinTop(view: searchBar, refView: self, thisConstant: offset),
//            searchBar.pinLeft(view: searchBar, refView: self, thisConstant: offset),
////            searchBar.pinWH(size: CGSize(width: searchBar.frame.size.width, height: searchBar.frame.size.height)),
//            searchBar.pinRight(view: searchBar, refView: base, thisConstant: -offset)
//        ])
    }
    
    @objc func indexChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
            case 0:
                print("Partial");
            case 1:
                print("Exact")
            default:
                break
            }
    }
}
