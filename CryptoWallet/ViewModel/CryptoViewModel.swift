//
//  CryptoViewModel.swift
//  CryptoWallet
//
//  Created by Max Pavlov on 24.09.22.
//

import Foundation

class CryptoViewModel: CryptoTableViewViewModelType {
    
    private var user: User?
    private var networkManager = CryptoNetworking()
    private var crypto: Crypto?
    private var isSelect = false
    private var filteredData: [Datum] = []
    
    func numberOfRows() -> Int {
        return isSelect ? filteredData.count : crypto?.data.count ?? 0
        
    }
    
    func cellViewModel(for indexPath: IndexPath) -> CryptoViewCellViewModelType? {
        let data = crypto?.data.sorted(by: { $0.metrics.marketData.priceUsd > $1.metrics.marketData.priceUsd })
        let crypto = isSelect ? filteredData[indexPath.row] : data?[indexPath.row]
        
        return CryptoViewCellViewModel(crypto: crypto)
    }
    
    func getCrypto(completion: @escaping (Crypto) -> ()) {
        networkManager.sendRequest { [weak self] crypto in
            DispatchQueue.main.async {
                guard let self = self else {return}
                self.crypto = crypto
                completion(crypto)
            }
        }
    }
    
    func viewModelForSelectedRow(for indexPath: IndexPath) -> CryptoDetailViewModelType? {
        let data = crypto?.data.sorted(by: { $0.metrics.marketData.priceUsd > $1.metrics.marketData.priceUsd } )
        let crypto = isSelect ? filteredData[indexPath.row] : data?[indexPath.row]
        
        return CryptoDetailViewModel(crypto: crypto)
    }
    
    func filtredData() {
        isSelect = !isSelect
        guard let data = crypto?.data else { return }
        if isSelect {
            filteredData = data.sorted(by: { $0.metrics.marketData.priceUsd < $1.metrics.marketData.priceUsd } )
        }
    }
}
