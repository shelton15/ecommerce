//
//  CartView.swift
//  ecommerce
//
//  Created by imac on 18/09/2024.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        
        ScrollView {
            
            if cartManager.products.count > 0 {
                
                ForEach(cartManager.products, id: \.id) { product in
                    CartProductView(product: product)
                }
                
                HStack {
                    Text("Your Total is ")
                    Spacer()
                    Text("$\(cartManager.total)")
                        .bold()
                }
                .padding()
            } else {
                Text("Your Cart is Empty")
            }
            
        }
        .navigationTitle(Text("My Cart"))
        .background(Color("kPrimary"))
        .padding(.top)
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
