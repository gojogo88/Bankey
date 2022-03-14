//
//  ViewController.swift
//  Bankey
//
//  Created by Jonathan Go on 12.03.22.
//

import UIKit

protocol LoginVCDelegate: AnyObject {
    func didLogin()
}

class LoginVC: UIViewController {
    
    // MARK: - Properties
    let loginView = LoginView()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.adjustsFontForContentSizeCategory = true
        label.text = "Bankey"
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = "Your premium source for all things banking!"
        return label
    }()
    
    
    private lazy var signinButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.configuration?.imagePadding = 8 // for indicator spacing
        button.setTitle("Sign In", for: [])
        button.addTarget(self, action: #selector(signinTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var errorMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .systemRed
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    weak var delegate: LoginVCDelegate?
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        addComponents()
        layoutComponents()
    }
}

extension LoginVC {
    
    // MARK: - Private Methods
    
    private func setupViews() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func addComponents() {
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(loginView)
        view.addSubview(signinButton)
        view.addSubview(errorMessageLabel)
    }
    
    private func layoutComponents() {
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            subtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
            subtitleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subtitleLabel.bottomAnchor, multiplier: 3),
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            signinButton.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 16),
            signinButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signinButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            
            errorMessageLabel.topAnchor.constraint(equalTo: signinButton.bottomAnchor, constant: 16),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
    }
}

// MARK: - Actions
extension LoginVC {
    @objc func signinTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
        
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureErrorView(withMessage: "Username / password cannot be blank")
            return
        }
        
        if username == "Kevin" && password == "Welcome" {
            signinButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        } else {
            configureErrorView(withMessage: "Incorrect username / password")
        }
    }
    
    private func configureErrorView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
