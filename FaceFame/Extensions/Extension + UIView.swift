//
//  Extension + UIView.swift
//  FaceFame
//
//  Created by Vasiliy on 21.03.2025.
//

import Foundation
import UIKit

// MARK: - Set background color
extension UIView {
    func addVerticalGradientLayer() {
        let primaryColor = UIColor(
            red: 57/255,
            green: 55/255,
            blue: 192/255,
            alpha: 1
        )
        
        let secondaryColor = UIColor(
            red: 0/255,
            green: 117/255,
            blue: 212/255,
            alpha: 1
        )
        
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [primaryColor.cgColor, secondaryColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}

// MARK: - Set animations
extension UIView {
    func shake() {
         let animation = CABasicAnimation(keyPath: "position")
         animation.duration = 0.07
         animation.repeatCount = 4
         animation.autoreverses = true
         animation.fromValue = CGPoint(x: self.center.x - 10, y: self.center.y)
         animation.toValue = CGPoint(x: self.center.x + 10, y: self.center.y)

         self.layer.add(animation, forKey: "position")
     }
}

// MARK: - Set elements view
extension UIView {
    func setButton(_ button: UIButton) {
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = button.frame.height / 2
        button.backgroundColor = nil
        button.setTitleColor(.white, for: .normal)
    }
}
