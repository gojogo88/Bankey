//
//  LoginView.swift
//  Bankey
//
//  Created by Jonathan Go on 12.03.22.
//

import UIKit

class LoginView: UIView {
    
    // MARK: - Properties
    
    lazy var usernameTextField: UITextField = {
        let tf = UITextField()
        tf.delegate = self
        tf.placeholder = "Username"
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.delegate = self
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private lazy var dividerView: UIView = {
        let v = UIView()
        v.backgroundColor = .secondarySystemFill
        return v
    }()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            usernameTextField,
            dividerView,
            passwordTextField
        ])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 8
        return sv
    }()
    
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        addComponents()
        layoutComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView {
    
    // MARK: - Private Methods
    private func setupViews() {
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 8
        clipsToBounds = true
    }
    
    private func addComponents() {
        addSubview(stackView)
    }
    
    private func layoutComponents() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            dividerView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
}

// MARK: - UITextField Delegate
extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
