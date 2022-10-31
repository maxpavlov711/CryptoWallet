//
//  AuthViewController.swift
//  CryptoWallet
//
//  Created by Max Pavlov on 14.09.22.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var viewModel: AuthViewModelType?
    
    private var welcomeLabel = UILabel(text: "Crypto Wallet", font: .avenir32())
    private var loginLabel = UILabel(text: "Login", font: .avenir20())
    private var passwordLabel = UILabel(text: "Password", font: .avenir20())
    
    private var loginTextField = TextField(font: .avenir20())
    private var passwordTextField = TextField(font: .avenir20(), secureText: true)
    
    private var signUpButton = UIButton(title: "Sign Up", titleColor: .white, backgroundColor: .black, font: .avenir20(), isShodow: true, cornerRadius: 6)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupContraints()
        
        viewModel = AuthViewModel()
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)

        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEditing)))
    }
    
    @objc private func endEditing() {
        view.endEditing(true)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height / 5
            }
        }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @objc private func signUpButtonTapped() {
        
        guard let login = loginTextField.text, let password = passwordTextField.text else { return }
        viewModel?.isAuth(login: login, password: password, completion: { [weak self] result in
            switch result {
            case true:
                self?.viewModel?.showCryptoVC()
            case false:
                self?.showAlert()
            }
        })
    }
}

// MARK: - Setup Constraints
extension AuthViewController {
    
    private func setupContraints() {
        
        let emailStackView = UIStackView(arrangedSubviews: [loginLabel, loginTextField], axix: .vertical, spacing: 0)
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField], axix: .vertical, spacing: 0)
        
        signUpButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let signUpStackView = UIStackView(arrangedSubviews: [emailStackView, passwordStackView, signUpButton], axix: .vertical, spacing: 35)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        signUpStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(signUpStackView)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            signUpStackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 120),
            signUpStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            signUpStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Error", message: "Неверные данные", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}

extension AuthViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
