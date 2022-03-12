//
//  ViewController.swift
//  Bankey
//
//  Created by Jonathan Go on 12.03.22.
//

import UIKit

class LoginVC: UIViewController {
    
    let loginView = LoginView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        addComponents()
        layoutComponents()
    }


}

extension LoginVC {
    
    private func setupViews() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func addComponents() {
        view.addSubview(loginView)
    }
    
    private func layoutComponents() {
        NSLayoutConstraint.activate([
            loginView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
    }
}
