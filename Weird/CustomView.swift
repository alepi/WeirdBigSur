//
//  CustomView.swift
//  Weird
//
//  Created by yawmoo_ext on 20/12/20.
//

import Cocoa

class CustomView: NSView {
    
    var image = NSImage(named: "test")!
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        image.draw(in: bounds)
    }
    
}
