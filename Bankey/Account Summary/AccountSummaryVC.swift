//
//  AccountSummaryVC.swift
//  Bankey
//
//  Created by Jonathan Go on 24.03.22.
//

import UIKit

class AccountSummaryVC: UIViewController {
    // MARK: - Properties
    private let games = [
        "Pacman",
        "Space Invaders",
        "Space Patrol",
    ]
    
    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.dataSource = self
        //tv.register(FactCell.self, forCellReuseIdentifier: FactCell.reuseIdentifier)
        tv.tableFooterView = UIView()
        //tv.backgroundColor = .secondaryBackground
        return tv
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addComponents()
        layoutComponents()
        setupTableHeaderView()
    }
}

extension AccountSummaryVC {
    // MARK: - Private Methods
    
    private func addComponents() {
        view.addSubview(tableView)
    }
    
    private func layoutComponents() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupTableHeaderView() {
        let header = AccountSummaryHeaderView(frame: .zero)
        
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)  // height
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        
        tableView.tableHeaderView = header
    }
}

// MARK: - tableView Datasource
extension AccountSummaryVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = games[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
}

extension AccountSummaryVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
