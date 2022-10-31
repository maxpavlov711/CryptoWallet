//
//  UITextField.swift
//  CryptoWallet
//
//  Created by Max Pavlov on 14.09.22.
//

import UIKit

class TextField: UITextField {
    
    convenience init(font: UIFont? = .avenir20(), secureText: Bool = false) {
        self.init()
        
        self.font = font
        self.borderStyle = .none
        self.keyboardType = .namePhonePad
        self.returnKeyType = .done
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if secureText {
            self.isSecureTextEntry = true
        }
        
        var bottomView = UIView()
        bottomView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        bottomView.backgroundColor = .black
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bottomView)

        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
