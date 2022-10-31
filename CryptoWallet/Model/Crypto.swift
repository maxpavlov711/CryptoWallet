//
//  Crypto.swift
//  CryptoWallet
//
//  Created by Max Pavlov on 24.09.22.
//

import Foundation

// MARK: - TokenDetails
struct Crypto: Decodable {
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Decodable {
    let id: String
    let symbol: String
    let name: String
    let metrics: Metrics
}

// MARK: - Metrics
struct Metrics: Decodable {
    let marketData: MarketData
    
    enum CodingKeys: String, CodingKey {
        case marketData = "market_data"
    }
}

// MARK: - MarketData
struct MarketData: Decodable {
    let priceUsd: Double
    let percentLast24Hours: Double

    enum CodingKeys: String, CodingKey {
        case priceUsd = "price_usd"
        case percentLast24Hours = "percent_change_usd_last_24_hours"
    }
}
