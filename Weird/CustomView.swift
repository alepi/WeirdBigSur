//
//  CustomView.swift
//  Weird
//
//  Created by yawmoo_ext on 20/12/20.
//

import Cocoa

class CustomView: NSView {
    
    var image = NSImage(named: "test")!
    
    fileprivate func drawImage(in ctx: CGContext) {
        ctx.setShouldAntialias(false)
        ctx.interpolationQuality = .none
        var r = bounds
        let cgImage = image.cgImage(forProposedRect: &r, context: nil, hints: nil)!
        ctx.draw(cgImage, in: bounds)
    }
    
    override func makeBackingLayer() -> CALayer {
        let layer = CALayer()
        layer.delegate = self
        layer.needsDisplayOnBoundsChange = true
        layer.frame = bounds
        layer.minificationFilter = .nearest
        layer.magnificationFilter = .nearest
        return layer
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        wantsLayer = true
    }
}

extension CustomView: CALayerDelegate {
    func draw(_ layer: CALayer, in ctx: CGContext) {
        drawImage(in: ctx)
    }
}
