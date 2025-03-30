//
//  AuthViewController.swift
//  FaceFame
//
//  Created by Samoilik Hleb on 26/03/2025.
//

import UIKit

final class AuthViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet private var userNameTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    
    @IBOutlet var entryButton: UIButton!
    @IBOutlet var guestEntryButton: UIButton!
    
    private let user: User = .user
    
    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addVerticalGradientLayer()
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        view.setupStartButton(entryButton)
        view.setButton(guestEntryButton)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as? TabBarController
        if let guestUser = sender as? User {
            tabBarController?.user = guestUser
        } else {
            tabBarController?.user = user
        }
    }
    
    // MARK: - Overrides Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTextField.text == user.login, passwordTextField.text == user.password else {
            showAlert(
                message: "Пожалуйста, введите корректные данные",
                with: "Не верный логин или пароль") {
                    self.passwordTextField.text = ""
                }
            return false
        }
        return true
    }
    
    // MARK: - IBActions
    @IBAction func GuestButtonTapped(_ sender: UIButton) {
        let guestUser = User(
            login: "",
            password: "",
            person: Person(name: "Гость", surname: "", photo: "Image 1")
        )
        performSegue(withIdentifier: "homeScreen", sender: guestUser)
    }
    
    @IBAction private func unwindToAuthViewController(_ segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        showAlert(
            message: "Твой \(sender.tag == 0 ? "логин" : "пароль"): \(sender.tag == 0 ? user.login : user.password)",
            with: "Не забывай"
        )
    }
    
    // MARK: - Private Methods
    private func configureUI() {
        userNameTextField.text = user.login
        passwordTextField.text = user.password
        configureKeyboard()
    }
    
    private func configureKeyboard() {
        [userNameTextField, passwordTextField].forEach {
            $0?.delegate = self
            $0?.returnKeyType = $0 == passwordTextField ? .done : .next
            $0?.setupRoundedTextField()
        }
    }
    
    private func showAlert(message: String, with title: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Extensions
extension UITextField {
    func setupRoundedTextField() {
        let cornerRadius = self.frame.height / 2
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.clipsToBounds = true
        self.backgroundColor = UIColor.white.withAlphaComponent(0.8)
    }
}

