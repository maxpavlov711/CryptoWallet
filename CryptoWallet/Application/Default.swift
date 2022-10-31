//
//  Default.swift
//  CryptoWallet
//
//  Created by Max Pavlov on 4.10.22.
//

import Foundation

class Default {
    
    static let shared = Default()
    
    enum Keys: String {
        case isAuth
    }
    
    private init() {}
    
    private let defaults = UserDefaults.standard
    
    func isAuth(auth: Bool) {
        defaults.set(auth, forKey: Keys.isAuth.rawValue)
    }
    
    func getAuth() -> Bool {
        return (defaults.value(forKey: Keys.isAuth.rawValue) as? Bool ?? false )
    }
    
    func clear() {
        defaults.removeObject(forKey: Keys.isAuth.rawValue)
    }

}
