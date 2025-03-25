//
//  QuizResutlsViewController.swift
//  FaceFame
//
//  Created by Vasiliy on 21.03.2025.
//

import UIKit

final class QuizResutlsViewController: UIViewController {
    
    var currentAnswers: Int!
    var totalAnswers: Int!
    
    @IBOutlet private var headerLabel: UILabel!
    @IBOutlet private var diescriptionLabel: UILabel!
    @IBOutlet private var resultImageView: UIImageView!
    @IBOutlet private var returnButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        view.addVerticalGradientLayer()
        view.setButton(returnButtonLabel)
        returnButtonLabel.setTitle("Попробовать снова", for: .normal)
        diescriptionLabel.textColor = .white
        headerLabel.textColor = .white
        
        updateUI()
        resultImageView.layer.cornerRadius = resultImageView.frame.height / 4
    }
    
    
    private func updateUI() {
        // Проверка, что переменные инициализированы
        guard let currentAnswers = currentAnswers, let totalAnswers = totalAnswers else { return }
        if Double(currentAnswers) / Double(totalAnswers) >= 0.8 {
            headerLabel.text = "Ты молодец!"
            diescriptionLabel.text = "Твой результат: \(currentAnswers) / \(totalAnswers)"
            resultImageView.image = UIImage(named: "Арни_рад")
            print("currentAnswers: \(String(describing: currentAnswers))")
        } else {
            headerLabel.text = "Арни грустит"
            diescriptionLabel.text = "Твой результат: \(currentAnswers) / \(totalAnswers)"
            resultImageView.image = UIImage(named: "Арни_грустит")
        }
        resultImageView.layer.cornerRadius = resultImageView.frame.height / 4
    }
}
