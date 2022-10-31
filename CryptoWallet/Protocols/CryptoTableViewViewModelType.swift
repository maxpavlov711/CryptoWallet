//
//  TableViewViewModelType.swift
//  CryptoWallet
//
//  Created by Max Pavlov on 24.09.22.
//

import Foundation

protocol CryptoTableViewViewModelType {
    func numberOfRows() -> Int
    func cellViewModel(for indexPath: IndexPath) -> CryptoViewCellViewModelType?
    
    func getCrypto(completion: @escaping (_ crypto: Crypto) -> ())
    
    func viewModelForSelectedRow(for indexPath: IndexPath) -> CryptoDetailViewModelType?
    
    func filtredData()
}
