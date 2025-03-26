//
//  HomeViewController.swift
//  FaceFame
//
//  Created by Samoilik Hleb on 26/03/2025.
//

import UIKit

final class HomeViewController: UIViewController {
    
    var userName: String!
    
    @IBOutlet private var avatarImageView: UIImageView!
    @IBOutlet private var usernameLabel: UILabel!
    @IBOutlet private var slider: UISlider!
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var newGameButton: UIButton!
    
    private var newGameButtonGradientLayer: CAGradientLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text = "Welcome, \(userName ?? "")!"
        view.addVerticalGradientLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupNewGameButton()
    }
    
    func setupNewGameButton() {
        let cornerRadius = newGameButton.frame.height / 2
        newGameButton.layer.cornerRadius = cornerRadius
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 0.6, green: 1.0, blue: 0.6, alpha: 0.8).cgColor,
            UIColor(red: 0.2, green: 0.8, blue: 0.2, alpha: 0.8).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = newGameButton.bounds
        gradientLayer.cornerRadius = cornerRadius
        
        if let existingLayer = newGameButton.layer.sublayers?.first(
            where: { $0 is CAGradientLayer }) {
            existingLayer.removeFromSuperlayer()
        }
        newGameButton.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @IBAction func newGameButtonTapped(_ sender: UIButton) {
        print("New Game Started")
    }
}

