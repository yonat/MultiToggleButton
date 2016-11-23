//
//  AppDelegate.swift
//  ToggleButtonDemo
//
//  Created by Yonat Sharon on 02.03.2015.
//  Copyright (c) 2015 Yonat Sharon. All rights reserved.
//

import UIKit
import MultiToggleButton
import MiniLayout

class ToggleButtonViewController: UIViewController {

    override func viewDidLoad() {
        
        let toggleButton = MultiToggleButton(
            images: [
                UIImage(named: "camera-flash"),
                UIImage(named: "facebook"),
                UIImage(named: "clock"),
                UIImage(named: "test_tube")
            ],
            states: ["Toggle", "State", "Alter", "Color"],
            colors: [nil, nil, .gray, .red]
        ) { button in
            print("Performing action for state: \(button.currentStateIndex)")
        }

        view.addConstrainedSubview(toggleButton, constrain: .centerX, .centerY)
    }
}

@UIApplicationMain
class ToggleButtonDemo: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = UIColor.white
        window.rootViewController = ToggleButtonViewController()
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}
