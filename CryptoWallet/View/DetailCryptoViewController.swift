//
//  DetailViewController.swift
//  CryptoWallet
//
//  Created by Max Pavlov on 5.10.22.
//

import UIKit

class DetailCryptoViewController: UIViewController {
    
    var viewModelDetail: CryptoDetailViewModelType?
    
    let detailLabel: UILabel = {
        let label = UILabel()
        label.font = .avenir26()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupContraints()
        
        setupViewModel()
    }
    
    func setupViewModel() {
        guard let viewModelDetail = viewModelDetail else { return }
        detailLabel.text = "\(viewModelDetail.nameCrypto) /  \(viewModelDetail.symbolCrypto)\nPrice: \(viewModelDetail.costCrypto) USD\nPrice 24 hours ago:\n \(viewModelDetail.percentChangeUsdLast24Hours) USD"
    }
}

extension DetailCryptoViewController {
    private func setupContraints() {

        view.addSubview(detailLabel)
        
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            detailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
