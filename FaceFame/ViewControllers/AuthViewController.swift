//
//  AuthViewController.swift
//  FaceFame
//
//  Created by Samoilik Hleb on 26/03/2025.
//

import UIKit

final class AuthViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet private var userNameTF: UITextField!
    @IBOutlet private var passwordTF: UITextField!
    
    private let validUsername = "1"
    private let validPassword = "1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        configureKeyboard()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let greetingVC = segue.destination as? HomeViewController
        greetingVC?.userName = userNameTF.text
    }
    
    @IBAction private func loginButtonTapped() {
        login()
    }
    
    @IBAction private func unwindToAuthViewController(_ segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction private func forgotUserNameAction() {
        showAlert(message: "Your name is «1»", with: "Oops!")
    }
    
    @IBAction private func forgotPasswordAction() {
        showAlert(
            message: "Please, enter correct login and password",
            with: "Invalid login or password"
        )
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else if textField == passwordTF {
            textField.resignFirstResponder()
            login()
        }
        return true
    }
    
    // MARK: - Private Methods
    private func configureKeyboard() {
        userNameTF.delegate = self
        passwordTF.delegate = self
        
        userNameTF.returnKeyType = .next
        passwordTF.returnKeyType = .done
    }
    
    private func login() {
        guard userNameTF.text == validUsername && passwordTF.text == validPassword else {
            showAlert(message: "Invalid login or password", with: "Error") {
                self.passwordTF.text = ""
            }
            return
        }
        performSegue(withIdentifier: "homeScreen", sender: self)
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

