//
//  ProgressBar.swift
//  Stories
//
//  Created by Rajan Arora on 30/05/21.
//

import UIKit

class ProgressBar: UIView {
    
    // MARK: CLass Members
    var foregroundLayer: CAShapeLayer!
    var progressLayer : CAShapeLayer!
    
    // MARK:  Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        addLayers()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addLayers()
    }
    
    // MARK:  Setup Layers
    func addLayers() {
        let lineWidth = 3
        
        foregroundLayer = createCircularLayer(strokeColor: UIColor.red.cgColor, fillColor: UIColor.clear.cgColor, lineWidth: Int(lineWidth))
        
        progressLayer = createCircularLayer(strokeColor: UIColor.purple.cgColor, fillColor: UIColor.clear.cgColor, lineWidth: lineWidth)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.colors = [UIColor.red.cgColor,UIColor.blue.cgColor]
        gradientLayer.frame = frame
        gradientLayer.mask = foregroundLayer
        
        foregroundLayer.strokeEnd = 1.0
        progressLayer.strokeEnd = 0.0
        
        layer.addSublayer(gradientLayer)
        layer.addSublayer(progressLayer)
    }
    
    func showAnimation() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.fillMode = .forwards
        basicAnimation.delegate = self
        basicAnimation.isRemovedOnCompletion = false
        progressLayer.add(basicAnimation, forKey: "animation")
    }
    
    func createCircularLayer(strokeColor : CGColor,fillColor : CGColor,lineWidth : Int) -> CAShapeLayer {
        let startAngle = -CGFloat.pi / 2
        let endAngle = 2 * CGFloat.pi
        
        let width = frame.size.width
        let height = frame.size.height
        
        let radius = (Int(min(width, height)) - lineWidth) / 2
        
        let circularPath = UIBezierPath(arcCenter: center, radius: CGFloat(radius), startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = strokeColor
        shapeLayer.lineWidth = CGFloat(lineWidth)
        shapeLayer.fillColor = fillColor
        shapeLayer.lineCap = .round
        
        return shapeLayer
    }
    
}

extension ProgressBar : CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if (flag) {
            progressLayer.strokeEnd = 1.0
            progressLayer.removeAllAnimations()
        }
    }
}
