//
//  Product.swift
//  ecommerce
//
//  Created by imac on 16/09/2024.
//

import Foundation

struct ProductDisplay: Codable {
    let results: [Product]
}

struct Product : Codable, Identifiable {
    
    let id: Int
    let title: String
    let price: Double
    let description: String
    let image: String
    
}
