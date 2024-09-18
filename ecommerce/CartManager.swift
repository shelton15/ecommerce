//
//  CardManager.swift
//  ecommerce
//
//  Created by imac on 16/09/2024.
//

import Foundation

class CartManager: ObservableObject {
    
    @Published private(set) var products: [Product] = []
    
    @Published private(set) var total: Double = 0
    
    func addToCart(product: Product) {
        
        products.append(product)
        total += product.price
        
    }
    
    func removedFromCart(product: Product) {
        
        products = products.filter{$0.id != product.id}
        total -= product.price
        
    }
    
}
