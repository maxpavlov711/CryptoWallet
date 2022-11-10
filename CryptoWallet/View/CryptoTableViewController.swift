//
//  CryptoTableViewController.swift
//  CryptoWallet
//
//  Created by Max Pavlov on 20.09.22.
//

import UIKit

class CryptoTableViewController: UIViewController {

    private var viewModel: CryptoTableViewViewModelType?
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        return tableView
    }()
    
    private var loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView()
        loader.hidesWhenStopped = true
        return loader
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Crypto"
        viewModel = CryptoViewModel()
        view.backgroundColor = .white

        getData()
        setupConstrain()
        setupTableView()
    }
    
    private func getData() {
        loader.startAnimating()
        
        viewModel?.getCrypto {[weak self] crypto in
            self?.loader.stopAnimating()
            self?.setupNavigationButton()
            self?.tableView.reloadData()
        }
    }
    
    private func setupNavigationButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Exit", style: .plain, target: self, action: #selector(tabClose))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(tabFiltred))
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem?.tintColor = .black
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CryptoViewCell.self, forCellReuseIdentifier: CryptoViewCell.identifier)
    }
    
    @objc private func tabClose() {
        self.showAlert(with: "Exit?", and: "") {
            let vc = AuthViewController()
            UIApplication.shared.windows.first?.rootViewController = vc
            UIApplication.shared.windows.first?.makeKeyAndVisible()
            Default.shared.clear()
        }
    }
    
    @objc private func tabFiltred() {
        viewModel?.filtredData()
        tableView.reloadData()
    }
}

extension CryptoTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CryptoViewCell.identifier, for: indexPath)
        guard let cryptoCell = cell as? CryptoViewCell else { return cell }
        cryptoCell.viewModel = viewModel?.cellViewModel(for: indexPath)
        return cryptoCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = Bilder().createDetailViewController()
        detailVC.viewModelDetail = viewModel?.viewModelForSelectedRow(for: indexPath)
        present(detailVC, animated: true)
    }
}

// MARK: - Setup Constraints
extension CryptoTableViewController {
    func setupConstrain() {
        
        view.addSubview(tableView)
        view.addSubview(loader)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        loader.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            loader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func showAlert(with title: String, and message: String, completion: @escaping () -> Void = { }) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            completion()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}
