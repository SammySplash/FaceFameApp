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
        
        if let userName = userName, !userName.isEmpty {
            usernameLabel.text = "Welcome, \(userName)!"
        } else {
            usernameLabel.text = "Welcome!"
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.setupStartButton(newGameButton)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showQuizSegue",
           let quizVC = segue.destination as? QuizViewController,
           let questions = sender as? [Question] {
            quizVC.questions = questions
        }
    }
    
    @IBAction func newGameButtonTapped() {
        let questions = Question.getQuestion(count: 5)
        self.performSegue(withIdentifier: "showQuizSegue", sender: questions)
    }
}

