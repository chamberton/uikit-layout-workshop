//
//  DrawingTriangleViewController.swift
//  ukit-workshop
//
//  Created by Serge Mbamba on 2023/02/21.
//

import UIKit

class DrawingTriangleViewController: UIViewController {
    let xOrigin = 50.0
    let yOrigin = 100.0
    let kTriangleFirstSideWidth = 200.0
    let kTriangleSecondSideWidth = 300.0
    
    private lazy var trigleOrigin = CGPoint(x: xOrigin, y: 100.0)
    
    private lazy var trianglePath = {
        let trianglePath = UIBezierPath()
        trianglePath.move(to: trigleOrigin)
        trianglePath.addLine(to: CGPoint(x: xOrigin, y: yOrigin + kTriangleFirstSideWidth))
        trianglePath.addLine(to: CGPoint(x: xOrigin + kTriangleSecondSideWidth, y: yOrigin + kTriangleFirstSideWidth))
        trianglePath.close()
        return trianglePath
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // addTriangle(color: .blue)
    }
    
    private func addTriangle(color: UIColor) {
        let triangleMaskLayer = CAShapeLayer()
        triangleMaskLayer.path = trianglePath.cgPath
        let view = UIView(frame: self.view.frame)
        view.backgroundColor = color
        view.layer.mask = triangleMaskLayer
        self.view.backgroundColor = .white
        self.view.addSubview(view)
    }

}
