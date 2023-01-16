//
//  Product.swift
//  Assignment-9
//
//  Created by Sailau Almaz Maratuly on 16.01.2023.
//

import UIKit
import Foundation

final class Product {
    var name: String
    var image: String
    var description: String
    var price: Int
    
    
    init(name: String, image: String, description: String, price: Int){
        self.name = name
        self.image = image
        self.description = description
        self.price = price
    }
}
