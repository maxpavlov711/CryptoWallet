//
//  CryptoViewCellViewModel.swift
//  CryptoWallet
//
//  Created by Max Pavlov on 3.10.22.
//

import Foundation

class CryptoViewCellViewModel: CryptoViewCellViewModelType {

    var crypto: Datum?
    
    var symbolCrypto: String {
        guard let name = crypto?.symbol else { return "" }
        return name
    }
    
    var costCrypto: Double {
        guard let priceUsd = crypto?.metrics.marketData.priceUsd else  { return 0 }
        return priceUsd
    }
    
    init(crypto: Datum?) {
        self.crypto = crypto
    }
}
