//
//  ProductTableViewCell.swift
//  Assignment-9
//
//  Created by Sailau Almaz Maratuly on 15.01.2023.
//

import UIKit

final class ProductTableViewCell: UITableViewCell {
    
    static let IDENTIFIER = "ProductTableViewCell"
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    
    private lazy var productName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var productDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var productPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemBlue
        return label
    }()
    
    private lazy var productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "1.1")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(product: Product) {
        productName.text = product.name
        productDescription.text = product.description
        productPrice.text = "\(product.price) тг"
        productImage.image = UIImage(named: product.image)
    }
}

//MARK: - Setup views and constraints methods

private extension ProductTableViewCell {
    
    func setupViews() {
        stackView.addArrangedSubview(productName)
        stackView.addArrangedSubview(productDescription)
        stackView.addArrangedSubview(productPrice)
        contentView.addSubview(stackView)
        contentView.addSubview(productImage)
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().inset(15)
            make.width.equalToSuperview().multipliedBy(0.6)
        }
        productImage.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
            make.leading.equalTo(stackView.snp.trailing)
        }
    }
    
}
