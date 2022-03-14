//
//  DummyVC.swift
//  Bankey
//
//  Created by Jonathan Go on 14.03.22.
//

import UIKit

class DummyVC: UIViewController {
    
    // MARK: - Properties
    
    weak var delegate: LogouDelegate?
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = "dummy text"
        return label
    }()
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logout", for: [])
        button.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        button.configuration = .filled()
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            label,
            logoutButton
        ])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 8
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addComponents()
        layoutComponents()
    }
}

extension DummyVC {
    
    // MARK: - Private Methods
    private func addComponents() {
        view.addSubview(stackView)
    }
    
    private func layoutComponents() {
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
        ])
    }
    
    // MARK: - Acitons
    @objc func logoutTapped(_ sender: UIButton) {
        delegate?.didLogout()
    }
}
