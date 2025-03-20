//
//  ViewController.swift
//  FaceFame
//
//  Created by Samoilik Hleb on 19/03/2025.
//

import UIKit

final class QuizViewController: UIViewController {
    
    var questions = Question.getQuestion(count: 5)
    
    // MARK: - IBOutlets
    @IBOutlet var ActorImageView: UIImageView!
    @IBOutlet var answerButtons: [UIButton]!
    
    //MARK: - Private properties
    private var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    // MARK: - IBActions
    @IBAction func helpButtonAction() {
        showAlert(withTitle: "Подсказка", andMessage: questions[questionIndex].help)
    }
    
    @IBAction func answerButtonAction(_ sender: Any) {
    }
    
    // MARK: - Private methods
    private func updateUI() {
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        print(questions[questionIndex].currectAnswer)
        ActorImageView.image = questions[questionIndex].imageActor
        //ActorImageView.image = UIImage(named: questions[questionIndex].imageActor)
        
        for (buttonIndex, button) in answerButtons.enumerated() {
            if buttonIndex < questions.count {
                button.setTitle(questions[questionIndex].answers[buttonIndex], for: .normal)
                button.titleLabel?.textAlignment = .center
            }
        }
    }
}



