//
//  LayoutShed.swift
//  LASER
//
//  Created by Santhosh Kumar on 4/29/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import Foundation
import UIKit

class LayoutBarn: UIViewController {

//    weak var testView: UIView!

    /*var regularConstraints: [NSLayoutConstraint] = []
    var compactConstraints: [NSLayoutConstraint] = []

    override func loadView() {
        super.loadView()
        self.activateCurrentConstraints()
    }
    
    func setConstraintsFor(view:UIImageView) -> UIImageView{
        let testView = UIImageView(frame: .zero)
        testView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(testView)

        self.regularConstraints = [
            testView.widthAnchor.constraint(equalToConstant: 64),
            testView.widthAnchor.constraint(equalTo: testView.heightAnchor),
            testView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            testView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ]

        self.compactConstraints = [
            testView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            testView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            testView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            testView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ]
        return testView
    }

    private func activateCurrentConstraints() {
        NSLayoutConstraint.deactivate(self.compactConstraints + self.regularConstraints)

        if self.traitCollection.verticalSizeClass == .regular {
            NSLayoutConstraint.activate(self.regularConstraints)
        }
        else {
            NSLayoutConstraint.activate(self.compactConstraints)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - rotation support

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .allButUpsideDown
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }

    // MARK: - trait collections

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        self.activateCurrentConstraints()
    }*/
}
//
//extension UIView {
//
//    /// Returns a collection of constraints to anchor the bounds of the current view to the given view.
//    ///
//    /// - Parameter view: The view to anchor to.
//    /// - Returns: The layout constraints needed for this constraint.
//    func constraintsForAnchoringTo(boundsOf view: UIView) -> [NSLayoutConstraint] {
//        return [
//            topAnchor.constraint(equalTo: view.topAnchor),
//            leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            view.bottomAnchor.constraint(equalTo: bottomAnchor),
//            view.trailingAnchor.constraint(equalTo: trailingAnchor)
//        ]
//    }
//}
//
//
//extension NSLayoutConstraint {
//
//    /// Returns the constraint sender with the passed priority.
//    ///
//    /// - Parameter priority: The priority to be set.
//    /// - Returns: The sended constraint adjusted with the new priority.
//    func usingPriority(_ priority: UILayoutPriority) -> NSLayoutConstraint {
//        self.priority = priority
//        return self
//    }
//
//}
//
//extension UILayoutPriority {
//
//    /// Creates a priority which is almost required, but not 100%.
//    static var almostRequired: UILayoutPriority {
//        return UILayoutPriority(rawValue: 999)
//    }
//
//    /// Creates a priority which is not required at all.
//    static var notRequired: UILayoutPriority {
//        return UILayoutPriority(rawValue: 0)
//    }
//}
//
//@propertyWrapper
//public struct UsesAutoLayout<T: UIView> {
//    public var wrappedValue: T {
//        didSet {
//            wrappedValue.translatesAutoresizingMaskIntoConstraints = false
//        }
//    }
//
//    public init(wrappedValue: T) {
//        self.wrappedValue = wrappedValue
//        wrappedValue.translatesAutoresizingMaskIntoConstraints = false
//    }
//}

public extension UIView {
    func pinCenter(view: UIView) -> [NSLayoutConstraint] {
        return [
            centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
    }
    
    func pinWH(size: CGSize) -> [NSLayoutConstraint] {
        return [
            widthAnchor.constraint(equalToConstant: size.width),
            heightAnchor.constraint(equalToConstant: size.height)
        ]
    }
    
    func pinHorizontal(view: UIView) -> [NSLayoutConstraint] {
        return [
            centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
    }
    
    func pinVertical(view: UIView) -> [NSLayoutConstraint] {
        return [
            centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
    }
    
    func pinVerticalWithOffset(view:UIView, refView: UIView, offset:CGFloat) -> [NSLayoutConstraint] {
        return [
            centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        let guide = refView.safeAreaLayoutGuide
        let constraint = view.centerXAnchor.constraint(equalToSystemSpacingAfter: refView.centerXAnchor, multiplier: -offset)
//        let constraint = view.topAnchor.constraint(equalTo: guide.topAnchor, constant: thisConstant)
        constraint.priority = UILayoutPriority.defaultLow
        return [
            constraint
        ]
    }
    
    func pinTop(view:UIView, refView:UIView, thisConstant: CGFloat) -> [NSLayoutConstraint] {
        let guide = refView.safeAreaLayoutGuide
        let topConstraint = view.topAnchor.constraint(equalTo: guide.topAnchor, constant: thisConstant)
        topConstraint.priority = UILayoutPriority.defaultLow
        return [
            topConstraint
        ]
    }
    
    func pinBottom(view:UIView, refView:UIView, thisConstant: CGFloat) -> [NSLayoutConstraint] {
        let guide = refView.safeAreaLayoutGuide
        let bottomConstraint = view.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: thisConstant)
        bottomConstraint.priority = UILayoutPriority.defaultLow
        return [
            bottomConstraint
        ]
    }
    
    func pinLeft(view:UIView, refView:UIView, thisConstant: CGFloat) -> [NSLayoutConstraint] {
        let guide = refView.safeAreaLayoutGuide
        let leftConstraint = view.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: thisConstant)
        leftConstraint.priority = UILayoutPriority.defaultLow
        return [
            leftConstraint
        ]
    }
    
    func pinRight(view:UIView, refView:UIView, thisConstant: CGFloat) -> [NSLayoutConstraint] {
        let guide = refView.safeAreaLayoutGuide
        let rightConstraint = view.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: thisConstant)
        rightConstraint.priority = UILayoutPriority.defaultLow
        return [
            rightConstraint
        ]
    }
    
    func pinLeading(view:UIView, refView:UIView, thisConstant: CGFloat) -> [NSLayoutConstraint] {
        let leftConstraint = view.leadingAnchor.constraint(equalTo: refView.leadingAnchor, constant: thisConstant)
        leftConstraint.priority = UILayoutPriority.defaultLow
        return [
            leftConstraint
        ]
    }
    
    func pinLeadingToTrailing(view:UIView, refView:UIView, thisConstant: CGFloat) -> [NSLayoutConstraint] {
        let leftConstraint = view.leadingAnchor.constraint(equalTo: refView.trailingAnchor, constant: thisConstant)
        leftConstraint.priority = UILayoutPriority.defaultLow
        return [
            leftConstraint
        ]
    }
    
    func pinTrailing(view:UIView, refView:UIView, thisConstant: CGFloat) -> [NSLayoutConstraint] {
        let leftConstraint = view.trailingAnchor.constraint(equalTo: refView.trailingAnchor, constant: thisConstant)
        leftConstraint.priority = UILayoutPriority.defaultLow
        return [
            leftConstraint
        ]
    }
    
    func pinBetweenObjects(view:UIView, refView:UIView, leftRefView:UIView, rightRefView:UIView, thisConstant: CGFloat) -> [NSLayoutConstraint] {
        let restConstraint = view.leadingAnchor.constraint(equalTo: leftRefView.leadingAnchor, constant: thisConstant)
        let restRefConstraint = refView.trailingAnchor.constraint(equalTo: rightRefView.trailingAnchor, constant: -thisConstant)
        let bindingConstraint = view.trailingAnchor.constraint(equalTo: refView.leadingAnchor, constant: -thisConstant)
        let viewWidth = view.widthAnchor.constraint(equalTo: refView.widthAnchor, multiplier: 1)
        let refViewWidth = view.widthAnchor.constraint(equalTo: refView.widthAnchor, multiplier: 1)
        
        bindingConstraint.priority = UILayoutPriority.defaultLow
        
        return [
            bindingConstraint,
            viewWidth,
            refViewWidth,
            restConstraint,
            restRefConstraint
        ]
    }
    
    func pinHeight(view:UIView, thisHeight:CGFloat) -> [NSLayoutConstraint] {
        let heightConstraint = view.heightAnchor.constraint(equalToConstant: thisHeight)
        heightConstraint.priority = UILayoutPriority.defaultLow
        return [
            heightConstraint
        ]
    }
}


public extension NSLayoutConstraint {
    /// Disable auto resizing mask and activate constraints///
    /// - Parameter constraints: constraints to activate
    static func on(_ constraints: [NSLayoutConstraint]) {
        constraints.forEach {
            ($0.firstItem as? UIView)?.translatesAutoresizingMaskIntoConstraints = false
            $0.isActive = true
        }
    }
    
    static func on(_ constraintsArray: [[NSLayoutConstraint]]) {
        let constraints = constraintsArray.flatMap({ $0 })
        NSLayoutConstraint.on(constraints)
    }
}
