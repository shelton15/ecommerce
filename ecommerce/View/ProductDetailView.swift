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
                        
                    }
                    
                    VStack(alignment: .leading) {
                        HStack{
                            Text(product.title)
                                .font(.title2 .bold())
                            
                            Spacer()
                            
                            
                        }
                        .padding(.vertical)
                        
                        Spacer()
                        
                        HStack {
                            
                            Button(action: {}, label: {
                                Image(systemName: "minus.circle")
                            })
                            Text("1")
                            Button(action: {}, label: {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(Color("kPrimary"))
                            })
                            .padding(.horizontal)
                            
                            Text("$\(product.price)")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.horizontal)
                            
                        }
                        
                        HStack(spacing: 10) {
                            Text("Description")
                                .font(.title3)
                                .fontWeight(.medium)
                            
                            Text(product.description)
                        }
                    }
                    
                    AddToCartButtonView(product: product)
                        .environmentObject(CartManager())
                    
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

//struct ColorDotView: View {
//
//    let color: Color
//
//    var body: some View {
//
//        color
//            .frame(width: 25, height: 25)
//            .clipShape(Circle())
//
//    }
//
//}
