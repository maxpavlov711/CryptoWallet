//
//  CryptoDetailViewModel.swift
//  CryptoWallet
//
//  Created by Max Pavlov on 6.10.22.
//

import Foundation

class CryptoDetailViewModel: CryptoDetailViewModelType {
    
    var crypto: Datum?
    
    var nameCrypto: String {
        guard let name = crypto?.name else { return "" }
        return name
    }
    
    var costCrypto: Double {
        guard let cost = crypto?.metrics.marketData.priceUsd else { return 0 }
        return cost
    }
    
    var symbolCrypto: String {
        guard let symbol = crypto?.symbol else { return "" }
        return symbol
    }
    
    var percentChangeUsdLast24Hours: Double {
        guard let price24Hours = crypto?.metrics.marketData.percentLast24Hours else { return 0 }
        guard let cost = crypto?.metrics.marketData.priceUsd else { return 0 }
        return ((cost / 100) * price24Hours) + cost
    }
    
    init(crypto: Datum?) {
        self.crypto = crypto
    }
}
