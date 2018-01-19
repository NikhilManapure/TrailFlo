//
//  ViewController.swift
//  Trail Flo
//
//  Created by Nikhil Manapure on 19/01/18.
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userNameTextField.becomeFirstResponder()
    }

    @IBAction func loginButtonTouched() {
        guard let user = User.all.first else {
            // Something wrong
            return
        }
        
        guard let username = userNameTextField.text?.trimmingCharacters(in: .whitespaces),
            !username.isEmpty else {
                userNameTextField.shake()
                userNameTextField.text = ""
                userNameTextField.becomeFirstResponder()
                return
        }
        
        guard let password = passwordTextField.text?.trimmingCharacters(in: .whitespaces),
            !password.isEmpty else {
                passwordTextField.shake()
                passwordTextField.text = ""
                passwordTextField.becomeFirstResponder()
                return
        }

        guard user.userName.caseInsensitiveCompare(username) == .orderedSame else {
            userNameTextField.shake()
            userNameTextField.selectFull()
            userNameTextField.becomeFirstResponder()
            return
        }
        
        guard user.password == password else {
            passwordTextField.shake()
            passwordTextField.selectFull()
            passwordTextField.becomeFirstResponder()
            return
        }
        
        performSegue(withIdentifier: "ToTheList", sender: nil)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            loginButtonTouched()
        }
        return false
    }
}
