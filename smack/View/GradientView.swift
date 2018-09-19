//
//  GradientView.swift
//  smack
//
//  Created by Rohit Goud on 19/09/18.
//  Copyright © 2018 Rohit Goud. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {

    @IBInspectable var topColor: UIColor  = #colorLiteral(red: 0.2901960784, green: 0.3019607843, blue: 0.8470588235, alpha: 1) {
        //set the color we choose from inferface then go ahead & update the view
        didSet{
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0.1725490196, green: 0.831372549, blue: 0.8470588235, alpha: 1) {
        //set the color we choose from inferface then go ahead & update the view
        didSet{
            self.setNeedsLayout()
        }
    }
    
    //Called whenever layoutUpdates basically (setNeedsLayout())
    override func layoutSubviews() {
        //Creating a Gradient Layer which Takes in the colors, start and end Points and size of the view and inserting 
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        
        self.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    

}
