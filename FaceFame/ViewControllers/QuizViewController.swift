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
    @IBOutlet private var ActorImageView: UIImageView!
    @IBOutlet private var answerButtons: [UIButton]!
    
    //MARK: - Public properties
    var currectAnswersCount = 0
    
    //MARK: - Private properties
    private var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        questions.forEach{
            print($0.currectAnswer)
        }
    }
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    // MARK: - IBActions
    @IBAction private func helpButtonAction() {
        showAlert(withTitle: "Подсказка", andMessage: questions[questionIndex].help)
    }
    
    @IBAction private func answerButtonAction(_ sender: UIButton) {
        let currentAnswer = sender.currentTitle
        if currentAnswer == questions[questionIndex].currectAnswer {
            print("угадал")
            currectAnswersCount += 1
        } else {
            print("найн")
        }
        nextQuestion()
        
    }
    
    // MARK: - Private methods
    private func updateUI() {
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        //прнты
        
        print("текущий актер:\(questions[questionIndex].currectAnswer)")
        print("questionIndex: \(questionIndex)")
        
        ActorImageView.image = questions[questionIndex].imageActor
        
        for (buttonIndex, button) in answerButtons.enumerated() {
            if buttonIndex < questions[questionIndex].answers.count {
                button.setTitle(questions[questionIndex].answers[buttonIndex], for: .normal)
                button.titleLabel?.textAlignment = .center
                button.isHidden = false
            } else {
                button.isHidden = true
            }
        }
    }
    
    private func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
            return
        }
        // переход по сигвею
    }
}



