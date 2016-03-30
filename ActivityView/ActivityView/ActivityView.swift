//
//  BKActivityView.swift
//
//  Created by Brendan Kirchner on 3/29/16.
//  Copyright © 2016 Brendan Kirchner. All rights reserved.
//

import UIKit

public class ActivityView: UIView {

    private var circleView1: CircleView!
    private var circleView2: CircleView!
    private var circleView3: CircleView!
    
    private var isAnimating = false
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.customInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.customInit()
    }
    
    func customInit() {
        let minDimension = min(self.bounds.width, self.bounds.height)
        let rect = CGRectMake(CGRectGetMidX(self.bounds) - minDimension / 2.0, CGRectGetMidY(self.bounds) - minDimension / 2.0, minDimension, minDimension)
        
        let lineWidth = (rect.size.width / 2.0) / 5.0
        let sc = lineWidth / 2.0
        
        let ovalRect1 = CGRectMake(sc, sc, rect.size.width - 2 * sc,  rect.size.height - 2 * sc)
        circleView1 = CircleView(frame: rect, offset: 0.0, lineColor: UIColor.redColor(), lineWidth: lineWidth, ovalRect: ovalRect1)
        
        let sc2 = sc + lineWidth
        let ovalRect2 = CGRectMake(sc2, sc2, rect.size.width - 2 * sc2,  rect.size.height - 2 * sc2)
        circleView2 = CircleView(frame: rect, offset: 0.0, lineColor: UIColor.greenColor(), lineWidth: lineWidth, ovalRect: ovalRect2)
        
        let sc3 = sc2 + lineWidth
        let ovalRect3 = CGRectMake(sc3, sc3, rect.size.width - 2 * sc3,  rect.size.height - 2 * sc3)
        circleView3 = CircleView(frame: rect, offset: 0.0, lineColor: UIColor.blueColor(), lineWidth: lineWidth, ovalRect: ovalRect3)
        
        [circleView1, circleView2, circleView3].forEach({ self.addSubview($0) })
        
        self.backgroundColor = UIColor.clearColor()
        self.clipsToBounds = false
        self.userInteractionEnabled = false
        
        self.hidden = true
        
        self.enableTapping()
    }
    
    func enableTapping() {
        self.userInteractionEnabled = true
        let recog = UITapGestureRecognizer(target: self, action: #selector(ActivityView.tapped))
        self.addGestureRecognizer(recog)
    }
    
    public func startAnimating() {
        if !isAnimating {
            self.hidden = false
            
            let animation1 = BKAnimation.bkAnimationWithKeyPath("transform.rotation")
            animation1.duration = 3.75
            circleView1.layer.addAnimation(animation1, forKey: nil)
            
            let animation2 = BKAnimation.bkAnimationWithKeyPath("transform.rotation")
            animation2.duration = 2.5
            circleView2.layer.addAnimation(animation2, forKey: nil)
            
            let animation3 = BKAnimation.bkAnimationWithKeyPath("transform.rotation")
            animation3.duration = 1.25
            circleView3.layer.addAnimation(animation3, forKey: nil)
            
            isAnimating = true
        }
    }
    
    public func stopAnimating() {
        if isAnimating {
            
            self.hidden = true
            
            circleView1.layer.removeAllAnimations()
            circleView2.layer.removeAllAnimations()
            circleView3.layer.removeAllAnimations()
            
            isAnimating = false
        }
    }
    
    public func startOrStop() {
        if isAnimating {
            stopAnimating()
        } else {
            startAnimating()
        }
    }
    
    func tapped() {
        self.changeColors()
    }
    
    func changeColors() {
        circleView1.changeColor(UIColor.randomColor())
        circleView2.changeColor(UIColor.randomColor())
        circleView3.changeColor(UIColor.randomColor())
    }

}

class CircleView: UIView {
    private var offset: CGFloat
    private var lineColor: UIColor
    private var lineWidth: CGFloat
    private var ovalRect: CGRect
    
    override init(frame: CGRect) {
        self.offset = 0.0
        self.lineColor = .blackColor()
        self.lineWidth = 2.0
        self.ovalRect = frame
        super.init(frame: frame)
        self.backgroundColor = .clearColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not implemented on CircleView")
    }
    
    init(frame: CGRect, offset: CGFloat, lineColor: UIColor, lineWidth: CGFloat, ovalRect: CGRect) {
        self.offset = offset
        self.lineColor = lineColor
        self.lineWidth = lineWidth
        self.ovalRect = ovalRect
        super.init(frame: frame)
        self.backgroundColor = .clearColor()
    }
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        CGContextAddPath(context, UIBezierPath().addArc(withCenter: CGPoint(x: CGRectGetMidX(ovalRect), y: CGRectGetMidY(ovalRect)), radius: CGRectGetWidth(ovalRect) / 2, start: 10, endAngle: 80, andOffset: offset).CGPath)
        
        CGContextAddPath(context, UIBezierPath().addArc(withCenter: CGPoint(x: CGRectGetMidX(ovalRect), y: CGRectGetMidY(ovalRect)), radius: CGRectGetWidth(ovalRect) / 2, start: 100, endAngle: 170, andOffset: offset).CGPath)
        
        CGContextAddPath(context, UIBezierPath().addArc(withCenter: CGPoint(x: CGRectGetMidX(ovalRect), y: CGRectGetMidY(ovalRect)), radius: CGRectGetWidth(ovalRect) / 2, start: 190, endAngle: 260, andOffset: offset).CGPath)
        
        CGContextAddPath(context, UIBezierPath().addArc(withCenter: CGPoint(x: CGRectGetMidX(ovalRect), y: CGRectGetMidY(ovalRect)), radius: CGRectGetWidth(ovalRect) / 2, start: 280, endAngle: 350, andOffset: offset).CGPath)
        
        CGContextSetLineWidth(context, lineWidth)
        CGContextSetStrokeColorWithColor(context, lineColor.CGColor)
        CGContextStrokePath(context)
        
    }
    
    func changeColor(color: UIColor) {
        self.lineColor = color
        self.setNeedsDisplay()
    }
    
}

class BKAnimation: CABasicAnimation {
    
    static func bkAnimationWithKeyPath(path: String) -> BKAnimation {
        let anim = BKAnimation(keyPath: path)
        anim.fromValue = NSNumber(float: 0)
        anim.toValue = NSNumber(double: 2.0 * M_PI)
        anim.repeatCount = Float.infinity
        return anim
    }
    
}

extension UIBezierPath {
    
    func addArc(withCenter center: CGPoint, radius: CGFloat, start: Double, endAngle: Double, andOffset offset: CGFloat) -> UIBezierPath {
        self.addArcWithCenter(center, radius: radius, startAngle: CGFloat(start * M_PI / 180.0) + offset, endAngle: CGFloat(endAngle * M_PI / 180.0) + offset, clockwise: true)
        return self
    }
    
}

extension UIColor {
    
    static func randomColor() -> UIColor {
        let hue = Double(arc4random_uniform(256)) % 256.0 / 256.0
        let sat = Double(arc4random_uniform(256)) % 128.0 / 256.0 + 0.5
        let bri = Double(arc4random_uniform(256)) % 128.0 / 256.0 + 0.5
        return UIColor(hue: CGFloat(hue), saturation: CGFloat(sat), brightness: CGFloat(bri), alpha: 1)
    }
    
}
