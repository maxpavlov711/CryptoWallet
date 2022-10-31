//
//  Bilder.swift
//  CryptoWallet
//
//  Created by Max Pavlov on 10.10.22.
//

import Foundation
import UIKit

protocol ModuleBilderProtocol {
    func createDetailViewController() -> DetailCryptoViewController
    func createCryptoTableViewController() -> CryptoTableViewController
}

class Bilder: ModuleBilderProtocol {
    func createDetailViewController() -> DetailCryptoViewController {
        return DetailCryptoViewController()
    }
    
    func createCryptoTableViewController() -> CryptoTableViewController {
        return CryptoTableViewController()
    }  
}
