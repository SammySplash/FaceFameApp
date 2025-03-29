//
//  HomeViewController.swift
//  FaceFame
//
//  Created by Samoilik Hleb on 26/03/2025.
//

import UIKit

final class HomeViewController: UIViewController {
    
    var userName: String!
    var questions: [Question] = []
    var typeOfQestions: Theme = .male
    
    @IBOutlet private var avatarImageView: UIImageView!
    @IBOutlet private var usernameLabel: UILabel!
    @IBOutlet private var slider: UISlider!
    @IBOutlet private var newGameButton: UIButton!
    @IBOutlet private var ScrollViewLabel: UILabel!
    
    @IBOutlet var maleSwitch: UISwitch!
    
    @IBOutlet var femaleSwitch: UISwitch!
    private var newGameButtonGradientLayer: CAGradientLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.minimumTrackTintColor = view.getMainColor()
        slider.maximumTrackTintColor = .black
        
        ScrollViewLabel.text = "Количество вопросов \(Int(slider.value))"
        
        view.addVerticalGradientLayer()
        
        if let userName = userName, !userName.isEmpty {
            usernameLabel.text = "Welcome, \(userName)!"
        } else {
            usernameLabel.text = "Welcome!"
        }
    }

    
    @IBAction func swchersAction(_ sender: UISwitch) {
        switch sender {
        case maleSwitch:
            if !sender.isOn && !femaleSwitch.isOn {
                sender.isOn = true
            }
        case femaleSwitch:
            if !sender.isOn && !maleSwitch.isOn {
                sender.isOn = true
            }
        default:
            break
        }
        
        switch (maleSwitch.isOn, femaleSwitch.isOn) {
        case (true, true):
            typeOfQestions = .mixed
        case (true, false):
            typeOfQestions = .male
        case (false, true):
            typeOfQestions = .female
        default:
            break
        }
    }
    @IBAction func sliderAction() {
        ScrollViewLabel.text = "Количество вопросов \(Int(slider.value))"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.setupStartButton(newGameButton)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           let quizVC = segue.destination as? QuizViewController
        quizVC?.questions = questions
    }
    
    @IBAction func newGameButtonTapped() {
        questions = Question.getQuestion(count: Int(slider.value), theme: typeOfQestions)
    }
}

