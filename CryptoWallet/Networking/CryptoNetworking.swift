//
//  CryptoNetworking.swift
//  CryptoWallet
//
//  Created by Max Pavlov on 24.09.22.
//

import Foundation

class CryptoNetworking {
    
    private var urlString = "https://data.messari.io/api/v1/assets"
    
    public func sendRequest(completion: @escaping (_ crypto: Crypto) -> ()) {

        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data, error == nil else { return }

            do {
                var result: Crypto?
                result = try JSONDecoder().decode(Crypto.self, from: data)
                guard let mainData = result else { return }
                completion(mainData)
            } catch let error {
                print("Error serialization JSON", error.localizedDescription)
            }
        }.resume()
    }
}
