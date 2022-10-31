//
//  CryptoViewModelType.swift
//  CryptoWallet
//
//  Created by Max Pavlov on 6.10.22.
//

import Foundation

protocol CryptoDetailViewModelType {
    
    var nameCrypto: String                      { get }
    var costCrypto: Double                      { get }
    var symbolCrypto: String                    { get }
    var percentChangeUsdLast24Hours: Double     { get }
    
}
