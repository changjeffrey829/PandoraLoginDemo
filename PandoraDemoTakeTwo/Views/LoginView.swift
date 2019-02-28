//
//  LoginView.swift
//  PandoraDemoTakeTwo
//
//  Created by Jeffrey Chang on 2/22/19.
//  Copyright © 2019 Jeffrey Chang. All rights reserved.
//

import UIKit


class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        setupViews()
    }
    
    fileprivate func setupViews(){
        setupLogo()
        let textfieldStackView = setupTextfields()
        setupButtons(textfieldStackView: textfieldStackView)
        setupBottomStackView()
    }
    
    //MARK: SETUP OBJECT CONSTRAINTS
    fileprivate func setupLogo() {
        addSubview(logoLabel)
        logoLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        logoLabel.topAnchor.constraint(equalTo: topAnchor, constant: frame.height / 4).isActive = true
        logoLabel.heightAnchor.constraint(equalToConstant: frame.height / 10).isActive = true
        logoLabel.widthAnchor.constraint(equalToConstant: frame.width / 4)
    }
    
    fileprivate func setupTextfields() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [emailTextfield, passwordTextfield])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 30).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: frame.width / 5).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -frame.width / 5).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: frame.height / 10).isActive = true
        stackView.spacing = 1
        return stackView
    }
    
    fileprivate func setupButtons(textfieldStackView: UIStackView) {
        let buttonStackView = UIStackView(arrangedSubviews: [loginButton, forgetPasswordButton])
        buttonStackView.axis = .vertical
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 5
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(buttonStackView)
        buttonStackView.topAnchor.constraint(equalTo: textfieldStackView.bottomAnchor, constant: 12).isActive = true
        buttonStackView.leadingAnchor.constraint(equalTo: textfieldStackView.leadingAnchor).isActive = true
        buttonStackView.trailingAnchor.constraint(equalTo: textfieldStackView.trailingAnchor).isActive = true
        buttonStackView.heightAnchor.constraint(equalToConstant: textfieldStackView.frame.height)
    }
    
    fileprivate func setupBottomStackView() {
        let bottomStackView = UIStackView(arrangedSubviews: [DontHaveAccountLabel, SignUpButton])
        bottomStackView.axis = .vertical
        bottomStackView.spacing = 20
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bottomStackView)
        bottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40).isActive = true
        bottomStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bottomStackView.heightAnchor.constraint(equalToConstant: frame.height / 10)
    }
    
    //MARK: UI OBJECTS
    let logoLabel: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "Pandora", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .medium), NSAttributedString.Key.foregroundColor: UIColor.white])
        label.attributedText = attributedText
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    let emailTextfield: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 5
        tf.keyboardType = .emailAddress
        tf.setLeftPaddingPoints(4)
        return tf
    }()
    
    let passwordTextfield: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.backgroundColor = .white
        tf.isSecureTextEntry = true
        tf.setLeftPaddingPoints(4)
        tf.layer.cornerRadius = 5
        return tf
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.isEnabled = false
        return button
    }()
    
    let forgetPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("forgot password?", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let DontHaveAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't have an account?"
        label.textColor = .white
        return label
    }()
    
    let SignUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up for Free", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

