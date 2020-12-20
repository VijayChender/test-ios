//
//  BaseViewNetworkReachability.swift
//  LASER
//
//  Created by Santhosh Kumar on 7/30/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices
import Network

extension BaseViewController{
    
//    func checkNetworkAvailability(){
//        let reachability = try! Reachability()
//         NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
//        do{
//          try reachability.startNotifier()
//        }catch{
//          print("could not start reachability notifier")
//        }
//    }
//
//    @objc func reachabilityChanged(note: Notification) {
//
//      let reachability = note.object as! Reachability
//
//      switch reachability.connection {
//      case .wifi:
//          print("Reachable via WiFi")
//      case .cellular:
//          print("Reachable via Cellular")
//      case .unavailable:
//        print("Network not reachable")
//      case .none:
//        print("No network")
//        break
//        }
//    }
    
    func checkNetworkAvailability(){
        
        let monitor = NWPathMonitor(requiredInterfaceType: .wifi)
        let interface = monitor.currentPath.status
            
        if interface == NWPath.Status.satisfied{
            monitor.pathUpdateHandler = { path in
                if path.status == .satisfied {
                    print("We're connected!")
                } else {
                    print("No connection.")
                }
                    print(path.isExpensive)
            }
            
            let cellMonitor = NWPathMonitor(requiredInterfaceType: .cellular)

            cellMonitor.pathUpdateHandler = { path in
                if path.status == .satisfied {
                    print("We're connected!")
                } else {
                    print("No connection.")
                }
                    print(path.isExpensive)
            }
            let queue = DispatchQueue(label: "Monitor")
            monitor.start(queue: queue)
            cellMonitor.start(queue: queue)
        }else if interface == NWPath.Status.unsatisfied{
            // No network
        }
    }
}
