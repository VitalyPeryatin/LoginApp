//
//  ViewController.swift
//  LoginApp
//
//  Created by Виталий on 04.03.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let userName: String = "User"
    private let password: String = "Password"
    
    override func viewDidLoad() {
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "showWelcomeSegue" else { return }
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        
        welcomeVC.userName = userNameTextField.text ?? ""
    }
    
    @IBAction func logInPressed() {
        if userName != userNameTextField.text || password != passwordTextField.text {
            showAlert(
                title: "Invalid user name or password",
                message: "Please enter correct user name and password",
                textField: passwordTextField
            )
            return
        }
        performSegue(withIdentifier: "showWelcomeSegue", sender: nil)
    }
    
    @IBAction func unwindWelcomeSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }
    
    @IBAction func forgotUserNamePressed() {
        showAlert(title: "Oops!", message: "Your user name is \(userName)")
    }
    
    @IBAction func forgotPasswordPressed() {
        showAlert(title: "Oops!", message: "Your password is \(password)")
    }
}

extension LoginViewController {
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = nil
        }
        alertController.addAction(okButton)
        
        present(alertController, animated: true)
    }
}

extension LoginViewController : UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInPressed()
        }
        return false
    }
    
}
