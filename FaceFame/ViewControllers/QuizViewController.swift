//
//  ViewController.swift
//  FaceFame
//
//  Created by Samoilik Hleb on 19/03/2025.
//

import UIKit

final class QuizViewController: UIViewController {
    
    var currentQuestion: Question?
    var question: Question!
    
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
        
        guard let selectedAnswer = sender.titleLabel?.text,
              let question = currentQuestion else { return }
        
        if selectedAnswer == question.correctActor {
            showAlert(message: "Правильно!")
        } else {
            showAlert(message: "Неправильно! Это был \(question.correctActor).")
        }
    }
    
    @IBAction func hintButtonTapped() {

        //guard let question = currentQuestion else { return }
        showAlert(message: question.hint)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Подсказка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}



