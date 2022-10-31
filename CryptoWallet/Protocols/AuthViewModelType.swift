//
//  AuthViewModelType.swift
//  CryptoWallet
//
//  Created by Max Pavlov on 12.10.22.
//

import Foundation

protocol AuthViewModelType {
    
    func isAuth(login: String, password: String, completion: @escaping (Bool) -> ()) 
    func showCryptoVC()
}
