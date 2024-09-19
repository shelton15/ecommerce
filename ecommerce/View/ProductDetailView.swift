//
//  ProductDetailView.swift
//  ecommerce
//
//  Created by imac on 19/09/2024.
//

import SwiftUI

struct ProductDetailView: View {
    
    var product: Product
    
    var body: some View {
        
        ScrollView {
            ZStack {
                Color.white
                
                VStack(alignment: .leading){
                    
                    ZStack(alignment: .topTrailing) {
                        AsyncImage(url: URL(string: product.image)) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .ignoresSafeArea(edges: .top)
                                    .frame(height: 300)
                                    .cornerRadius(17)
                            } else if phase.error != nil {
                                Color.red
                            } else {
                                ProgressView()
                            }
                        }
                        
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(.top, 63)
                            .padding(.trailing, 20)
                        
                    }
                    
                    VStack(alignment: .leading) {
                        HStack{
                            Text(product.title)
                                .font(.title2 .bold())
                            
                            Spacer()
                            
                            Text("$\(product.price)")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.horizontal)
                        }
                        .padding(.vertical)
                        
                        HStack(spacing: 10) {
                            Text("Description")
                                .font(.title3)
                                .fontWeight(.medium)
                            
                            Text(product.description)
                        }
                    }
                    
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product(id: 4, title: "", price: 23.3, category: "", description: "", image: ""))
    }
}
