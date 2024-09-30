////
////  ImageSliderView.swift
////  ecommerce
////
////  Created by imac on 16/09/2024.
////
//
//import SwiftUI
//
//
//
//struct ProductCardView: View {
//    
//    @EnvironmentObject var cartManager: CartManager
//    
//    var product: Product
//    
//    var body: some View {
//        ZStack{
//            
//            Color("kSecondary")
//            
//            ZStack(alignment: .bottomTrailing){
//                VStack(alignment: .leading) {
//                    
//                    // Use AsyncImage for image loading from URL
//                    if let imageUrl = product.image, let url = URL(string: imageUrl) {
//                        
//                        AsyncImage(url: url) { image in
//                            image
//                                .resizable()
//                                
//                        } placeholder: {
//                            Color.gray
//                        }
//                        .frame(width: 175, height: 160)
//                        .cornerRadius(17)
//                        
//                    }
////                    AsyncImage(url: URL(string: product.image)) { phase in
////                        if let image = phase.image {
////                            image
////                                .resizable()
////                                .frame(width: 175, height: 160)
////                                .cornerRadius(17)
////                        } else if phase.error != nil {
////                            Color.red
////                        } else {
////                            ProgressView()
////                        }
////                    }
//
//                        
//                    Text(product.title ?? "Unknown Title")
//                        .font(.headline)
//                        .foregroundColor(.black)
//                        .padding(.vertical, 1)
//                    
//                    Text("$ \(product.price)")
//                        .foregroundColor(.black)
//                        .bold()
//                    
//                }
//                
//                Button{
//                    cartManager.addToCart(product: product)
//                } label: {
//                    Image(systemName: "plus.circle.fill")
//                        .resizable()
//                        .foregroundColor(Color("kPrimary"))
//                        .frame(width: 35, height: 35)
//                        .padding(.trailing)
//                }
//            }
//            
//        }
//        .frame(width: 185, height: 260)
//        .cornerRadius(15)
//    }
//}
//
//struct ProductCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductCardView(product: Product(id: 1, title: "", price: 109.95, category: "", description: "", image: ""))
//            .environmentObject(CartManager())
//    }
//}
