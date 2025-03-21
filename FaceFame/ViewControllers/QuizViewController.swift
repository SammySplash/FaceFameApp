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
    @IBOutlet var progressBarView: UIProgressView!
    
    //MARK: - Public properties
    var currectAnswersCount = 0
    
    //MARK: - Private properties
    private var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
            let titleLabel = UILabel()
            titleLabel.text = "FaceFame"
            titleLabel.textAlignment = .center
            titleLabel.font = UIFont.boldSystemFont(ofSize: 40)
        titleLabel.textColor = UIColor(
            red: 242/255,
            green: 195/255,
            blue: 130/255,
            alpha: 1
        )
            titleLabel.sizeToFit()
            self.navigationItem.titleView = titleLabel
        
        updateUI()
        view.addVerticalGradientLayer()
        
        questions.forEach{
            print($0.currectAnswer)
        }
            answerButtons.forEach{ button in
                button.layer.borderColor = UIColor.white.cgColor
                button.layer.borderWidth = 2
                button.layer.cornerRadius = button.frame.height / 2
            }
        
        ActorImageView.layer.cornerRadius = ActorImageView.frame.height / 5
    }
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultVC = segue.destination as? QuizResutlsViewController {
            // что-то передадим
        }
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
                if button.currentTitle == questions[questionIndex].currectAnswer {
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
        performSegue(withIdentifier: "showResult", sender: nil)
    }
}



