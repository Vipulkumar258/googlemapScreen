//
//  MyCustomView.swift
//  Bday
//
//  Created by Appinventiv on 24/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import Foundation
import UIKit

class MyCustomView :UIView{
    
    override func draw(_ rect: CGRect) {
        
        let myBezier = UIBezierPath()
        myBezier.move(to: CGPoint(x: 0, y: 0))
        myBezier.addLine(to: CGPoint(x: self.frame.width+20, y: 0))
        myBezier.addLine(to: CGPoint(x: self.frame.width+5, y: self.frame.height))
        myBezier.addLine(to: CGPoint(x: 0, y: self.frame.height))
        myBezier.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        shapeLayer.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        shapeLayer.path = myBezier.cgPath
        self.layer.addSublayer(shapeLayer)
        
    }
    
    
}
