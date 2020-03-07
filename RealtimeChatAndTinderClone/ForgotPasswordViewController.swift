//
//  ForgotPasswordViewController.swift
//  RealtimeChatAndTinderClone
//
//  Created by Ravi Bastola on 3/7/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Close"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Your email address"
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    lazy var forgotButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Reset Password?", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        [closeButton].forEach { (customView) in
            view.addSubview(customView)
        }
        
        // adding constraints
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            closeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
        
        // adding constraints to ui elements before adding them to the stack view
        
        NSLayoutConstraint.activate([
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            emailTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 80),
            forgotButton.widthAnchor.constraint(equalToConstant: view.frame.width - 80),
            forgotButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // stack view initialization
        
        let stackView = UIStackView(arrangedSubviews: [
            emailTextField, forgotButton
        ])
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        
        stackView.distribution = .equalSpacing
        
        stackView.spacing = 3
        
        stackView.alignment = .center
        
        // constraints for stack view
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 110)
        ])
    }
}
