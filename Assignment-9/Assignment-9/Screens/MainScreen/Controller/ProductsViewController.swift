//
//  ProductsViewController.swift
//  Assignment-9
//
//  Created by Sailau Almaz Maratuly on 15.01.2023.
//

import UIKit
import SnapKit

final class ProductsViewController: UIViewController {
    
    private lazy var allProducts: [[Product]] = [sushiList, pizzaList, snackList]
    private let allTitles: [String] = ["Роллы", "Пицца", "Закуски"]
    
    // Все продукты
    private var sushiList = [Product(name: "Филадельфия", image: "1.1", description: "лосось, рис, сливочный сыр, свежий огурец, водоросли нори", price: 2500),
                     Product(name: "Спайси тунец", image: "1.1", description: "тунец, сыр креметто, авокадо, огурец, зеленый лук, нори и соус спайси", price: 3200),
                     Product(name: "Калифорния", image: "1.1", description: "японский рис, снежный краб, японский майонез, огурец, авокадо, икра тобико оранжевая (красная)", price: 1300),
                     Product(name: "Сяки маки", image: "1.1", description: "водоросли нори, рис, лосось", price: 1500)]
    
    private var pizzaList = [Product(name: "Пепперони", image: "2.1", description: "сыр моцарелла, соус томатный, пепперони", price: 2300),
                     Product(name: "Ветчина с грибами", image: "2.1", description: "сыр моцарелла, соус маринара, ветчина, грибы", price: 2400)]
   
    private var snackList = [Product(name: "Куриные наггетсы", image: "3.1", description: "куриные наггетсы (200гр)", price: 1400),
                     Product(name: "Луковые кольца", image: "3.2", description: "тунец, сыр креметто, авокадо, огурец, зеленый лук, нори и соус спайси", price: 3200)]
    
    private lazy var productTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.IDENTIFIER)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        productTableView.dataSource = self
        productTableView.delegate = self
        
        setupViews()
        setupConstraints()
    }
}

//MARK: - Table view data source methods

extension ProductsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return allTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return allTitles[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allProducts[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.IDENTIFIER, for: indexPath) as! ProductTableViewCell
        cell.setText(product: allProducts[indexPath.section][indexPath.row])
        return cell
    }
}

extension ProductsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

//MARK: - Setup views and constraints methods

private extension ProductsViewController {
    
    func setupViews() {
        view.addSubview(productTableView)
    }
    
    func setupConstraints() {
        productTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

