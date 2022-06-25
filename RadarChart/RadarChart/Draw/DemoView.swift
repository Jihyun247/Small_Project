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
        
        let graphPaths: [CGPoint] = [
            CGPoint(x: centerX, y: 350),
            CGPoint(x: centerX - 55, y: 350),
            CGPoint(x: centerX - 50, y: 450),
            CGPoint(x: centerX + 50, y: 450),
            CGPoint(x: centerX + 55, y: 350)
        ]
        
        makePolygonPath(paths: paths, radius: 30, color: .orange)
        makePolygonPath(paths: graphPaths, radius: 30, color: .purple)
    }
    
    private func makePolygonPath(paths: [CGPoint], radius: CGFloat, color: UIColor) {
        
        let polygonPath = UIBezierPath.roundedCornersPath(paths, radius)
        color.setFill()
        polygonPath?.fill()
    }
}
