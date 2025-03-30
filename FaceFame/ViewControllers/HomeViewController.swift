//
//  HomeViewController.swift
//  FaceFame
//
//  Created by Samoilik Hleb on 26/03/2025.
//

import UIKit

final class HomeViewController: UIViewController {
    
    var user: User!
    var questions: [Question] = []
    var typeOfQuestions: Theme = .male
    
    @IBOutlet private var avatarImageView: UIImageView!
    @IBOutlet private var usernameLabel: UILabel!
    @IBOutlet private var slider: UISlider!
    @IBOutlet private var newGameButton: UIButton!
    @IBOutlet private var ScrollViewLabel: UILabel!
    
    @IBOutlet var maleSwitch: UISwitch!
    @IBOutlet var femaleSwitch: UISwitch!
    
    private var newGameButtonGradientLayer: CAGradientLayer?
    
    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addVerticalGradientLayer()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.setupStartButton(newGameButton)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let quizVC = segue.destination as? QuizViewController
        quizVC?.questions = questions
    }
    
    // MARK: - IBActions
    @IBAction func switchAction(_ sender: UISwitch) {
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
            typeOfQuestions = .mixed
        case (true, false):
            typeOfQuestions = .male
        case (false, true):
            typeOfQuestions = .female
        default:
            break
        }
    }
    
    @IBAction func sliderAction() {
        ScrollViewLabel.text = "Количество вопросов \(Int(slider.value))"
    }
    
    @IBAction func newGameButtonTapped() {
        questions = Question.getQuestion(count: Int(slider.value), theme: typeOfQuestions)
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        slider.minimumTrackTintColor = view.getMainColor()
        slider.maximumTrackTintColor = .black
        ScrollViewLabel.text = "Количество вопросов \(Int(slider.value))"
        
        usernameLabel.text = user?.person.fullName.isEmpty == false ? "Добро пожаловать, \(user.person.fullName)!" : "Добро пожаловать, Гость!"
        avatarImageView.image = UIImage(named: user?.person.photo ?? "Image 1")
    }
}
