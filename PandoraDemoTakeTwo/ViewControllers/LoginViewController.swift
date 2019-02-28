//
//  ViewController.swift
//  PandoraDemoTakeTwo
//
//  Created by Jeffrey Chang on 2/22/19.
//  Copyright © 2019 Jeffrey Chang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, TextValidatable {
    
    let loginView = LoginView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configButtonsAndTextfield()
        hideKeyboard()
    }
    
    fileprivate func setupView() {
        view = loginView
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = #imageLiteral(resourceName: "Blue Background")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
    }
    
    fileprivate func configButtonsAndTextfield() {
        loginView.emailTextfield.addTarget(self, action: #selector(ValidateEmailText), for: .editingChanged)
        loginView.passwordTextfield.addTarget(self, action: #selector(validatePasswordText), for: .editingChanged)
        loginView.loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        loginView.forgetPasswordButton.addTarget(self, action: #selector(launchForgotPasswordVC), for: .touchUpInside)
        loginView.SignUpButton.addTarget(self, action: #selector(launchSignUpVC), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    fileprivate func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func ValidateEmailText() {
        let email = loginView.emailTextfield.text ?? ""
        if emailTextValidation(email: email) {
            loginView.emailTextfield.textColor = .black
            loginView.loginButton.isEnabled = true
        } else {
            loginView.emailTextfield.textColor = .red
            loginView.loginButton.isEnabled = false
        }
    }
    
    @objc func validatePasswordText() {
        let password = loginView.passwordTextfield.text ?? ""
        if passwordTextValidation(password: password) {
            loginView.passwordTextfield.textColor = .black
            loginView.loginButton.isEnabled = true
        } else {
            loginView.emailTextfield.textColor = .red
            loginView.loginButton.isEnabled = false
        }
    }
    
    @objc func handleLogin() {
        guard
            let email = loginView.emailTextfield.text,
            let password = loginView.passwordTextfield.text
            else {return}
        print("attempt to login with email: \(email), and password: \(password)")
    }
    
    @objc func launchForgotPasswordVC() {
        let vc = ForgotPasswordViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func launchSignUpVC() {
        let vc = SignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

