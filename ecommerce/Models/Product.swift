//
//  Product.swift
//  ecommerce
//
//  Created by imac on 16/09/2024.
//

import Foundation

//struct ProductDisplay: Codable {
//    let results: [Product]
//}
//
//struct Product : Codable, Identifiable {
//
//    let id: Int
//    let title: String?
//    let price: Double
//    let category: String?
//    let description: String?
//    let image: String?
//
//}

//struct EventDisplay: Codable {
//    let results: [Event]
//}

struct Event: Codable, Identifiable {
    
    let id: Int
    let name: String
    let date: String
    let location: String
    let description: String?
    let image: String?
    
}

//let id: Int
//let title: String
//let price: Double
//let category: String
//let description: String
//let image: String
