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
        
        view.addVerticalGradientLayer()
        
        usernameLabel.text = "Welcome, \(userName ?? "")!"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.setupStartButton(newGameButton)
    }
    
    @IBAction func newGameButtonTapped(_ sender: UIButton) {
        print("New Game Started")
    }
}

