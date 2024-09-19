//
//  AddToCartButtonView.swift
//  ecommerce
//
//  Created by imac on 19/09/2024.
//

import SwiftUI

struct AddToCartButtonView: View {
    
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    
    var body: some View {
        Button(action: {
            cartManager.addToCart(product: product)
        }) {
            HStack {
                Image(systemName: "heart")
                    .foregroundColor(Color("kPrimary"))
                
                Text("Add To Cart")
                    .bold()
            }
            .padding()
            .background(Color("kPrimary"))
            .cornerRadius(17)
        }
    }
}

struct AddToCartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartButtonView(product: Product(id: 3, title: "", price: 123.8, category: "", description: "", image: ""))
            .environmentObject(CartManager())
    }
}
