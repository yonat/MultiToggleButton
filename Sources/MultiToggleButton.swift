//
//  MultiToggleButton.swift
//  Tap button to toggle label and/or image, like in camera flash and timer buttons.
//
//  Created by Yonat Sharon on 02.03.2015.
//  Copyright (c) 2015 Yonat Sharon. All rights reserved.
//

import UIKit

public typealias ToggleButton = MultiToggleButton // compatibility with old version

open class MultiToggleButton: UIButton
{
    /// use only this init, it's 'convenience' only to avoid overriding required inits
    public convenience init(images: [UIImage?], states: [String], colors: [UIColor?] = [], action: ((_ sender: MultiToggleButton) -> ())? = nil) {
        self.init(frame: CGRect.zero)
        
        if let image = images.first {
            setImage(image, for: UIControlState())
        }
        sizeToFit()
        
        self.images = images
        self.states = states
        self.colors = colors
        self.action = action
        addTarget(self, action: #selector(toggle), for: .touchUpInside)
        
        setupCurrentState()
    }
    
    public convenience init(image: UIImage?, states: [String], colors: [UIColor?] = [], action: ((_ sender: MultiToggleButton) -> ())? = nil) {
        self.init(images: [image], states: states, colors: colors, action: action)
    }
    
    // MARK: - Manual Control
    
    open func toggle() {
        currentStateIndex = (currentStateIndex + 1) % states.count
        action?(self)
    }
    
    open var currentStateIndex: Int = 0      { didSet {setupCurrentState()} }
    open var colors: [UIColor?] = []         { didSet {setupCurrentState()} }
    open var images: [UIImage?] = []         { didSet {setupCurrentState()} }
    open var states: [String] = [] {
        didSet {
            currentStateIndex %= states.count
            setupCurrentState()
        }
    }
    open var action: ((_ sender: MultiToggleButton) -> ())? {
        didSet {
            addTarget(self, action: #selector(toggle), for: .touchUpInside)
        }
    }
    
    // MARK: - Overrides
    
    open override func tintColorDidChange() {
        if nil == currentColor {
            setTitleColor(tintColor, for: UIControlState())
        }
    }
    
    // MARK: - Private
    
    private func setupCurrentState() {
        let currentTitle = states[currentStateIndex]
        setTitle(currentTitle.isEmpty ? nil : " " + currentTitle, for: UIControlState())
        setTitleColor(currentColor ?? tintColor, for: UIControlState())
        setImage(currentToggleImage ?? currentImage, for: UIControlState())
    }
    
    private var currentColor: UIColor? {
        return currentStateIndex < colors.count ? colors[currentStateIndex] : nil
    }
    
    private var currentToggleImage: UIImage? {
        return currentStateIndex < images.count ? images[currentStateIndex] : nil
    }
}
