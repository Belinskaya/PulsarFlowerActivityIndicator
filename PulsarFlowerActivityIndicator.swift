//
//  PulsarFlowerActivityIndicator.swift
//  SquaresActivityIndicator
//
//  Created by Ekaterina Belinskaya on 10/12/2016.
//  Copyright © 2016 Belinskaya. All rights reserved.
//

import UIKit
import QuartzCore

class PulsarFlowerActivityIndicator: UIView{

    var mainColor: UIColor = UIColor(displayP3Red: 246.0/255.0, green: 71.0/255.0, blue: 71.0/255.0, alpha: 1)
    
    var ratio: CGFloat = 0.6{
        didSet{
            setup()
        }
    }
    var lineWidth: CGFloat = 2{
        didSet{
            setup()
        }
    }
    
    var elipseColors = [UIColor](){
        didSet{
            setup()
        }
    }
    
    var duration: CGFloat = 2{
        didSet{
            stopAnimation(with: nil)
            startAnimation()
        }
    }
    
    private var ovalLayers = [CAShapeLayer]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        for layer in self.ovalLayers{
            layer.removeFromSuperlayer()
        }
        self.ovalLayers.removeAll()
        
        
        let width = self.frame.height * ratio
        let height = self.frame.height
        let centerPoint = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        for i in 0...3{
            let ovalShapeLayer = CAShapeLayer()
            let x = (self.frame.height - width)/2
            let ovalPath = UIBezierPath(ovalIn: CGRect(x: x, y: 0, width: width, height: height ))
            ovalShapeLayer.path = ovalPath.cgPath
            ovalShapeLayer.fillColor = UIColor.clear.cgColor
            ovalShapeLayer.strokeColor = getOvalColorFor(index: i).cgColor
            ovalShapeLayer.lineWidth = lineWidth
            ovalShapeLayer.bounds = ovalPath.cgPath.boundingBox;
            if i>0{
                let rotationAngle = getrotationAngleFor(index: i)
                ovalShapeLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                ovalShapeLayer.transform = CATransform3DRotate(ovalShapeLayer.transform, rotationAngle, 0.0, 0.0, 1.0);
            }
            ovalShapeLayer.position = centerPoint
            ovalShapeLayer.rasterizationScale = UIScreen.main.scale
            ovalShapeLayer.shouldRasterize = true
            
            self.ovalLayers.append(ovalShapeLayer)
            self.layer.addSublayer(ovalShapeLayer)
        }
    }
    
    private func getrotationAngleFor(index: Int) -> CGFloat{
        switch index {
        case 1://90
            return CGFloat(M_PI/2)
        case 2: //45
            return CGFloat(M_PI/4)
        case 3://-45
            return -CGFloat(M_PI/4)
        default:
            return 0
        }
    }
    
    private func getOvalColorFor(index: Int) -> UIColor{
        if elipseColors.count == 0 || index >= elipseColors.count {
            return mainColor
        } else{
            return elipseColors[index]
        }
    }
    
    func startAnimation(){
        for i in 0..<(self.layer.sublayers?.count)!{
            let ovalShapeLayer = self.ovalLayers[i]
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
            rotationAnimation.isRemovedOnCompletion = false
            rotationAnimation.fillMode = kCAFillModeForwards;
            let startingAngle = ovalShapeLayer.presentation()?.value(forKeyPath: "transform.rotation")
            rotationAnimation.fromValue = startingAngle // the value read from the presentation layer
            rotationAnimation.byValue = (2.0*M_PI);
            rotationAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
            rotationAnimation.duration = CFTimeInterval(duration)
            rotationAnimation.repeatCount    = Float(Int.max);
            
            let scale = CAKeyframeAnimation(keyPath: "transform.scale")
            scale.duration = CFTimeInterval(duration)
            scale.values = [NSNumber(value: 1.0), NSNumber(value: 1.2), NSNumber(value: 1)]
            scale.keyTimes = [NSNumber(value: 0), NSNumber(value: 0.5), NSNumber(value: 1)]
            
            let group = CAAnimationGroup()
            group.fillMode = kCAFillModeForwards;
            group.isRemovedOnCompletion = false;
            group.duration = CFTimeInterval(duration);
            group.repeatCount = Float(Int.max);
            group.animations = [ rotationAnimation, scale]
            ovalShapeLayer.add(group, forKey: "animations")
        }
    }
    
    func stopAnimation(with completionHandler: (() -> Void)?){
        for i in 0..<self.ovalLayers.count{
            let ovalShapeLayer = self.ovalLayers[i]
            let transform = ovalShapeLayer.presentation()?.transform
            ovalShapeLayer.removeAllAnimations()
            ovalShapeLayer.transform = transform!
            
            if let handler = completionHandler{
                handler()
            }
        }
    }
}
