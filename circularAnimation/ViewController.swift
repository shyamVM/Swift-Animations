//
//  ViewController.swift
//  circularAnimation
//
//  Created by Shyam on 05/07/18.
//  Copyright © 2018 ajsluxurylimo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let shapelayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let satellite:UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "scheduled")
            return imageView
        }()
        let center = view.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi, clockwise: true)
        let trackLayer = CAShapeLayer()
      
        trackLayer.path = circularPath.cgPath
        view.layer.addSublayer(trackLayer)
        trackLayer.strokeEnd = 0
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 20
        trackLayer.lineCap = kCALineCapRound
        trackLayer.contents = UIImage(named: "scheduled")?.cgImage
        trackLayer.needsDisplay()
        view.layer.addSublayer(trackLayer)
        
        
        shapelayer.path = circularPath.cgPath
        view.layer.addSublayer(shapelayer)
        shapelayer.strokeEnd = 0
        shapelayer.strokeColor = UIColor.red.cgColor
        shapelayer.lineWidth = 10
        shapelayer.lineCap = kCALineCapRound
        shapelayer.fillColor = UIColor.white.cgColor
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
    }
    
    @objc func handleTap()  {
        
        let basicAnimation  = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 45
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        shapelayer.add(basicAnimation, forKey: "urSoBasic")
    }
    
    
    
}

