////
////  CartProudctView.swift
////  ecommerce
////
////  Created by imac on 18/09/2024.
////
//
//import SwiftUI
//
//struct CartProductView: View {
//    
//    @EnvironmentObject var cartManager: CartManager
//    var product: Product
//    
//    var body: some View {
//        
//        HStack(spacing: 20) {
//            
////            AsyncImage(url: URL(string: product.image)) { phase in
//            if let imageUrl = product.image, let url = URL(string: imageUrl) {
//                
//                AsyncImage(url: url) { image in
//                    image
//                        .resizable()
//                        
//                } placeholder: {
//                    Color.gray
//                }
//                .frame(width: 175, height: 160)
//                .cornerRadius(17)
//                
//            }
////                if let image = phase.image {
////                    image
////                        .resizable()
////                        .aspectRatio(contentMode: .fit)
////                        .frame(width: 70)
////                        .cornerRadius(9)
////                } else if phase.error != nil {
////                    Color.red
////                } else {
////                    ProgressView()
////                }
////            }
//            
//            HStack(spacing: 5) {
//                
//                Text(product.title ?? "Unknown Title")
//                    .bold()
//                
//                Text("$\(product.price)")
//                    .bold()
//                
//            }
//            .padding()
//            
//            Spacer()
//            
//            Image(systemName: "trash")
//                .foregroundColor(.red)
//                .onTapGesture {
//                    cartManager.removedFromCart(product: product)
//                }
//            
//        }
//        .padding(.horizontal)
//        .background(Color("kSecondary"))
//        .cornerRadius(12)
//        .frame(width: .infinity, alignment: .leading)
//        .padding()
//        
//    }
//}
//
//struct CartProductView_Previews: PreviewProvider {
//    static var previews: some View {
//        CartProductView(product: Product(id: 1, title: "", price: 109.95, category: "", description: "", image: ""))
//            .environmentObject(CartManager())
//    }
//}
