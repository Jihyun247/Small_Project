//
//  DemoView.swift
//  RadarChart
//
//  Created by 김지현 on 2022/06/29.
//

import UIKit

class DemoView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let centerX = Int(self.frame.width)/2
        
        let paths: [CGPoint] = [
            CGPoint(x: centerX, y: 300),
            CGPoint(x: centerX - 95, y: 350),
            CGPoint(x: centerX - 100, y: 500),
            CGPoint(x: centerX + 100, y: 500),
            CGPoint(x: centerX + 95, y: 350)
        ]
        
//        let paths: [CGPoint] = [
//            CGPoint(x: centerX - 100, y: 400),
//            CGPoint(x: centerX - 100, y: 500),
//            CGPoint(x: centerX + 100, y: 500),
//            CGPoint(x: centerX + 100, y: 400)
//        ]
        
        //let polygonPath = UIBezierPath.chaikinPath(paths)
        let polygonPath = UIBezierPath.roundedCornersPath(paths, 30)
        UIColor.orange.setFill()
        polygonPath?.fill()
    }
}
