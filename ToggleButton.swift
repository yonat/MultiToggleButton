//
//  ToggleButton.swift
//  Tap button to toggle label, like in camera flash and timer buttons.
//
//  Created by Yonat Sharon on 02.03.2015.
//  Copyright (c) 2015 Yonat Sharon. All rights reserved.
//

import UIKit

public class ToggleButton: UIButton
{
    /// use only this init, it's 'convenience' only to avoid overriding required inits
    public convenience init(images: [UIImage?], states: [String], colors: [UIColor?] = [], action: ((sender: ToggleButton) -> ())? = nil) {
        self.init(frame: CGRectZero)
        if let image = images.first {
            setImage(image, forState: .Normal)
        }
        sizeToFit()
        
        self.images = images
        self.states = states
        self.colors = colors
        self.action = action
        addTarget(self, action: #selector(toggle), forControlEvents: .TouchUpInside)
        
        setupCurrentState()
    }
    
    internal convenience init(image: UIImage?, states: [String], colors: [UIColor?] = [], action: ((sender: ToggleButton) -> ())? = nil) {
        self.init(images: [image], states: states, colors: colors, action: action)
    }
    
    // MARK: - Manual Control
    
    public func toggle() {
        currentStateIndex = (currentStateIndex + 1) % states.count
        action?(sender: self)
    }
    
    public var currentStateIndex: Int = 0      { didSet {setupCurrentState()} }
    public var colors: [UIColor?] = []         { didSet {setupCurrentState()} }
    public var images: [UIImage?] = []         { didSet {setupCurrentState()} }
    public var states: [String] = [] {
        didSet {
            currentStateIndex %= states.count
            setupCurrentState()
        }
    }
    public var action: ((sender: ToggleButton) -> ())?
    
    // MARK: - Overrides
    
    public override func tintColorDidChange() {
        if nil == currentColor {
            setTitleColor(tintColor, forState: .Normal)
        }
    }
    
    // MARK: - Private
    
    private func setupCurrentState() {
        setTitle(" " + states[currentStateIndex], forState: .Normal)
        setTitleColor(currentColor ?? tintColor, forState: .Normal)
        setImage(myCurrentImage ?? currentImage, forState: .Normal)
    }
    
    private var currentColor: UIColor? {
        return currentStateIndex < colors.count ? colors[currentStateIndex] : nil
    }
    
    private var myCurrentImage: UIImage? {
        return currentStateIndex < images.count ? images[currentStateIndex] : nil
    }
}
