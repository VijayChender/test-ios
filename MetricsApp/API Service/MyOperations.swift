//
//  Operation.swift
//  LASER
//
//  Created by Santhosh Kumar on 8/4/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import Foundation
import UIKit

public enum NSOperationQueuePriority : Int {
    case VeryLow
    case Low
    case Normal
    case High
    case VeryHigh
}

@available(iOS 8.0, OSX 10.10, *)
public enum NSQualityOfService : Int {
    case UserInteractive
    case UserInitiated
    case Utility
    case Background
    case Default
}

precedencegroup OperationChaining {
    associativity: left
}
infix operator ==> : OperationChaining

@discardableResult
func ==><T: Operation>(lhs: T, rhs: T) -> T {
    rhs.addDependency(lhs)
    return rhs
}

class MyOperations: Operation {
    override var isAsynchronous: Bool {
        return true
    }
    
    var _isFinished: Bool = false
    
    override var isFinished: Bool {
        set {
            willChangeValue(forKey: "isFinished")
            _isFinished = newValue
            didChangeValue(forKey: "isFinished")
        }
        
        get {
            return _isFinished
        }
    }

    var _isExecuting: Bool = false
    
    override var isExecuting: Bool {
        set {
            willChangeValue(forKey: "isExecuting")
            _isExecuting = newValue
            didChangeValue(forKey: "isExecuting")
        }
        
        get {
            return _isExecuting
        }
    }
    
    func execute() {
    }
    
    override func start() {
        isExecuting = true
        execute()
        isExecuting = false
        isFinished = true
    }
}

class ServiceOperation: MyOperations {
    let queue = OperationQueue()
    var operations: [MyOperations] = []
    var errors: [Error] = []
    
    override func execute() {
        print("group started")
        queue.addOperations(operations, waitUntilFinished: true)
        print("group done")
    }
    
    func finish(withError errors: [Error]) {
        self.errors += errors
    }
}

class OperationObserver: NSObject {
    init(operation: MyOperations) {
        super.init()
        operation.addObserver(self, forKeyPath: "finished", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let key = keyPath else {
            return
        }
        
        switch key {
        case "finished":
            print("done")
        default:
            print("doing")
        }
    }
}
