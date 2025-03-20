//
//  ViewController.swift
//  FaceFame
//
//  Created by Samoilik Hleb on 19/03/2025.
//

import UIKit

final class QuizViewController: UIViewController {
    
    var questions = Question.getQuestion(count: 5)
    
    @IBOutlet var ActorImageView: UIImageView!
    @IBOutlet var AnswerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateNewQuestion()
    }
    
    func generateNewQuestion() {
        currentQuestion = Question.generate(from: DataStore.maleActors)
        updateUI()
    }
    
    //Вот это для проверки!
    func updateUI() {
        guard let question = currentQuestion else { return }
        print("Правильный актёр: \(question.correctActor)")
        print("Подсказка: \(question.hint)")
        print("Варианты: \(question.options)")
        
        ActorImageView.image = UIImage(named: question.correctActor)
        
        /// Обновляем текст кнопок с вариантами ответа.
        AnswerButton.setTitle(question.correctActor, for: .normal)
        //button2.setTitle(question.options[1], for: .normal)
        //button3.setTitle(question.options[2], for: .normal)
        //button4.setTitle(question.options[3], for: .normal)
    }
    
    @IBAction func selectedAnswer(_ sender: UIButton) {
        
        //        guard let selectedAnswer = sender.titleLabel?.text,
        //              let question = currentQuestion else { return }
        //
        //        if selectedAnswer == question.correctActor {
        //            showAlert(message: "Правильно!")
        //        } else {
        //            showAlert(message: "Неправильно! Это был \(question.correctActor).")
        //        }
    }
    
    @IBAction func hintButtonTapped() {
        
        //guard let question = currentQuestion else { return }
        showAlert(withTitle: "Whoops", andMessage: question.hint)
    }
    
    private func showAlert(withTitle title: String, andMessage message: String, handler: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) {_ in
            handler?()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    
}



