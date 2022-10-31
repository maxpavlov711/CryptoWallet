//
//  UILabel + Extensions.swift
//  CryptoWallet
//
//  Created by Max Pavlov on 14.09.22.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont? = .avenir20()) {
        self.init()
        
        self.text = text
        self.font = font
        
        
    }
}
