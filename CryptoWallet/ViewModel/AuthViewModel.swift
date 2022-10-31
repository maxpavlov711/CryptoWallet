//
//  AuthViewModel.swift
//  CryptoWallet
//
//  Created by Max Pavlov on 12.10.22.
//

import Foundation
import UIKit

class AuthViewModel: AuthViewModelType {

    var user = User()
     
    
    func isAuth(login: String, password: String, completion: @escaping (Bool) -> ()) {
        if login == user.login && password == user.password {
            completion(true)
        } else {
            completion(false)
        }
    }
    
    func showCryptoVC() {
        let vc = Bilder().createCryptoTableViewController()
        let nav = UINavigationController(rootViewController: vc)
        UIApplication.shared.windows.first?.rootViewController = nav
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        Default.shared.isAuth(auth: true)
    }
}
