//
//  Extension + UIView.swift
//  FaceFame
//
//  Created by Vasiliy on 21.03.2025.
//

import Foundation
import UIKit

// MARK: - Set color
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
    
    func getMainColor() -> UIColor {
        let color = UIColor(
            red: 242/255,
            green: 195/255,
            blue: 130/255,
            alpha: 1
        )
        return color
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

// MARK: - Setup exit & start buttons
extension UIView {
    func setupStartButton(_ button: UIButton) {
        let cornerRadius = button.frame.height / 2
        button.layer.cornerRadius = cornerRadius
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 0.6, green: 1.0, blue: 0.6, alpha: 0.8).cgColor,
            UIColor(red: 0.2, green: 0.8, blue: 0.2, alpha: 0.8).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = button.bounds
        gradientLayer.cornerRadius = cornerRadius
        
        if let existingLayer = button.layer.sublayers?.first(
            where: { $0 is CAGradientLayer }) {
            existingLayer.removeFromSuperlayer()
        }
        button.layer.insertSublayer(gradientLayer, at: 0)
    }
}

//MARK: - Rounded Image
extension UIImageView {
    func makeRounded() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
}
