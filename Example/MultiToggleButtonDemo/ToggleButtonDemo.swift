//
//  ToggleButtonDemo.swift
//  ToggleButtonDemo
//
//  Created by Yonat Sharon on 02.03.2015.
//  Copyright (c) 2015 Yonat Sharon. All rights reserved.
//

import MiniLayout
import MultiToggleButton
import UIKit

class ToggleButtonViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let toggleButton = MultiToggleButton(
            images: [
                UIImage(named: "camera-flash"),
                UIImage(named: "facebook"),
                UIImage(named: "clock"),
                UIImage(named: "test_tube"),
            ],
            states: ["Toggle", "State", "Alter", "Color"],
            colors: [nil, nil, .gray, .red],
            backgroundColors: [nil, nil, .yellow, UIColor.lightGray.withAlphaComponent(0.25)]
        ) { button in
            print("Performing action for state: \(button.currentStateIndex)")
        }

        // make background coloring appear nicer
        toggleButton.contentEdgeInsets = UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 8)
        toggleButton.layer.cornerRadius = 8

        view.addConstrainedSubview(toggleButton, constrain: .centerX, .centerY)
    }
}

@UIApplicationMain
class ToggleButtonDemo: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = UIColor.white
        window.rootViewController = ToggleButtonViewController()
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}
