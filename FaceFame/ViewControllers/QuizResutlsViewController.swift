//
//  QuizResutlsViewController.swift
//  FaceFame
//
//  Created by Vasiliy on 21.03.2025.
//

import UIKit

class QuizResutlsViewController: UIViewController {
    
    var currentAnswers: Int!
    var totalAnswers: Int!
    
    @IBOutlet private var headerLabel: UILabel!
    @IBOutlet private var discriptionLabel: UILabel!
    @IBOutlet private var resultImageView: UIImageView!
    @IBOutlet private var returnButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.hidesBackButton = true
        view.addVerticalGradientLayer()
        view.setButton(returnButtonLabel)
        returnButtonLabel.setTitle("Попробовать снова", for: .normal)
        discriptionLabel.textColor = .white
        headerLabel.textColor = .white
        
        updateUI()
        resultImageView.layer.cornerRadius = resultImageView.frame.height / 5
    }
    

    private func updateUI() {
        // Проверка, что переменные инициализированы
        guard let currentAnswers = currentAnswers, let totalAnswers = totalAnswers else { return }
        if Double(currentAnswers) / Double(totalAnswers) >= 0.8 {
            headerLabel.text = "Ты молодец!"
            discriptionLabel.text = "Твой результат: \(currentAnswers) / \(totalAnswers)"
            resultImageView.image = UIImage(named: "Арни_рад")
            print("currentAnswers: \(String(describing: currentAnswers))")
        } else {
            headerLabel.text = "Арни грустит"
            discriptionLabel.text = "Твой результат: \(currentAnswers) / \(totalAnswers)"
            resultImageView.image = UIImage(named: "Арни_грустит")
        }
    }
}
