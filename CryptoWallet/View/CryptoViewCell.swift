//
//  CryptoViewCell.swift
//  CryptoWallet
//
//  Created by Max Pavlov on 2.10.22.
//

import UIKit

class CryptoViewCell: UITableViewCell {
    
    static let identifier = "CryptoViewCell"
    
    private var nameLabel = UILabel(text: "name", font: .avenir20())
    
    private var costLabel: UILabel = {
        let label = UILabel()
        label.font = .avenir20()
        label.textColor = .green
        return label
    }()
    
    var viewModel: CryptoViewCellViewModelType? {
        didSet {
            guard let nameCrypto = self.viewModel?.symbolCrypto else { return }
            guard let costCrypto = self.viewModel?.costCrypto else { return }
            self.nameLabel.text = nameCrypto
            self.costLabel.text = String(format: "%.5f USD", costCrypto) 
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContraints()
        self.selectionStyle = UITableViewCell.SelectionStyle.none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CryptoViewCell {
    private func setupContraints() {
        let cryptoCell = UIStackView(arrangedSubviews: [nameLabel, costLabel], axix: .horizontal, spacing: 1)
        cryptoCell.translatesAutoresizingMaskIntoConstraints = false
        cryptoCell.distribution = .equalCentering
        contentView.addSubview(cryptoCell)
        
        NSLayoutConstraint.activate([
            cryptoCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            cryptoCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5),
            cryptoCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cryptoCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
}
