//
//  StackView + Extensions.swift
//  CryptoWallet
//
//  Created by Max Pavlov on 14.09.22.
//

import UIKit

extension UIStackView {
    
    convenience init(arrangedSubviews: [UIView], axix: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axix
        self.spacing = spacing
    }
}
