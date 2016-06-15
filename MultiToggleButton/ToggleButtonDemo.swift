//
//  AppDelegate.swift
//  ToggleButtonDemo
//
//  Created by Yonat Sharon on 02.03.2015.
//  Copyright (c) 2015 Yonat Sharon. All rights reserved.
//

import UIKit

class ToggleButtonViewController: UIViewController {

    override func viewDidLoad() {
        
        let toggleButton = ToggleButton(
            images: [
                UIImage(named: "camera-flash"),
                UIImage(named: "facebook"),
                UIImage(named: "clock"),
                UIImage(named: "test_tube")
            ],
            states: ["Toggle", "State", "Alter", "Color"],
            colors: [nil, nil, UIColor.grayColor(), UIColor.redColor()]
        ) { button in
            switch button.currentStateIndex {
            case 0:
                print("Performing action for state: 0")
            case 1:
                print("Performing action for state: 1")
            case 2:
                print("Performing action for state: 2")
            case 3:
                print("Performing action for state: 3")
            default:
                print("Performing action for state: default")
            }
        }

        view.addSubview(toggleButton, constrain: .CenterX, .CenterY)
    }
}

extension UIView {
    func constrain(subview: UIView?, to: NSLayoutAttribute, with: NSLayoutAttribute = .NotAnAttribute, diff: CGFloat = 0, ratio: CGFloat = 1) {
        let subviewAttribute = (subview != nil && with == .NotAnAttribute) ? to : with
        addConstraint( NSLayoutConstraint(item: self, attribute: to, relatedBy: .Equal, toItem: subview, attribute: subviewAttribute, multiplier: ratio, constant: -diff) )
    }
    
    func addSubview(subview: UIView, constrain: NSLayoutAttribute...) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        constrain.forEach { self.constrain(subview, to: $0) }
    }
}

@UIApplicationMain
class ToggleButtonDemo: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.backgroundColor = UIColor.whiteColor()
        window.rootViewController = ToggleButtonViewController()
        window.makeKeyAndVisible()
        self.window = window
        return true
    }

}

