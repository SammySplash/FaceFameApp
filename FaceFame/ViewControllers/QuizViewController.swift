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
    @IBOutlet private var progressBarView: UIProgressView!
    @IBOutlet private var helpButtonOutlet: UIButton!
    
    //MARK: - Public properties
    var currectAnswersCount = 0
    
    //MARK: - Private properties
    private var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        let titleLabel = UILabel()
        titleLabel.text = "Угадай звезду"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 40)
        titleLabel.textColor = view.getMainColor()
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
        
        updateUI()
        view.addVerticalGradientLayer()
        answerButtons.forEach{ view.setButton($0) }
        view.setButton(helpButtonOutlet)
        progressBarView.progressTintColor = view.getMainColor()
        questions.forEach{
            print($0.correctAnswer)
        }
        
        
        ActorImageView.layer.cornerRadius = ActorImageView.frame.height / 5
        progressBarView.layer.cornerRadius = progressBarView.frame.height / 2
    }
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultVC = segue.destination as? QuizResutlsViewController {
            resultVC.currentAnswers = currectAnswersCount
            resultVC.totalAnswers = questions.count
        }
    }
    
    // MARK: - IBActions
    @IBAction private func helpButtonAction() {
        showAlert(withTitle: "Подсказка", andMessage: questions[questionIndex].help)
    }
    
    @IBAction private func answerButtonAction(_ sender: UIButton) {
        let currentAnswer = sender.currentTitle
        if currentAnswer == questions[questionIndex].correctAnswer {
            print("угадал")
            currectAnswersCount += 1
            
            UIView.animate(withDuration: 0.3, animations: {
                sender.backgroundColor = .green
            }) { _ in
                UIView.animate(withDuration: 0.3, animations: {
                    sender.backgroundColor = .clear
                }, completion: { _ in
                    self.nextQuestion()
                })
            }
            
        } else {
            print("найн")
            
            for button in answerButtons {
                if button.currentTitle == questions[questionIndex].correctAnswer {
                    UIView.animate(withDuration: 0.3, animations: {
                        button.backgroundColor = .green
                    }) { _ in
                        UIView.animate(withDuration: 0.3, animations: {
                            button.backgroundColor = .clear
                        }, completion: { _ in
                        })
                    }
                }
            }
            
            UIView.animate(withDuration: 0.3, animations: {
                sender.backgroundColor = .red
                sender.shake()
            }) { _ in
                UIView.animate(withDuration: 0.3, animations: {
                    sender.backgroundColor = .clear
                }, completion: { _ in
                    self.nextQuestion()
                })
            }
        }
        
    }
    
    // MARK: - Private methods
    private func updateUI() {
        
        let currentProgress = Float(questionIndex) / Float(questions.count)
        progressBarView.setProgress(currentProgress, animated: true)
        
        //прнты
        
        print("текущий актер:\(questions[questionIndex].correctAnswer)")
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
        performSegue(withIdentifier: "showResult", sender: nil)
    }
}



