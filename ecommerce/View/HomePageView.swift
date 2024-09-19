//
//  HomePageView.swift
//  ecommerce
//
//  Created by imac on 17/09/2024.
//

import SwiftUI

struct HomePageView: View {
    
    @State private var products: [Product] = []
    
    @State private var isLoading = true
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    AppBar()
                    
                    SearchView()
                    
                    HStack{
                        Text("Recommended Products")
                            .font(.title2)
                            .fontWeight(.medium)
//                            .frame(alignment: .leading)
                        
                        Spacer()
                        
                    }
                    .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(products, id: \.id) {product in
                                NavigationLink(destination: Text("")) {
                                    ProductCardView(product: product)
                                        .environmentObject(cartManager)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(products, id: \.id) {product in
                                NavigationLink(destination: Text("")) {
                                    ProductCardView(product: product)
                                        .environmentObject(cartManager)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    .onAppear {
                        fetchProducts()
                    }
                    
                }
                
            }
            .environmentObject(cartManager)
        }
    }
    
    private func fetchProducts() {
        APICaller.shared.getProducts { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedProducts):
                    self.products = fetchedProducts
                    self.isLoading = false
                case .failure(let error):
                    print("Error fetching products: \(error)")
                    self.isLoading = false
                }
            }
            
        }
    }
    
}



struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
            .environmentObject(CartManager())
    }
}

struct AppBar: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                HStack{
                    Image(systemName: "line.3.horizontal.decrease")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.trailing)
                   
                    
                    Spacer()
                    
                    NavigationLink(destination: CartView()
                        .environmentObject(cartManager)
                    ) {
                        CartButtonView(numberOfProducts: cartManager.products.count)
                    }
                }
                
                Text("Hello, Tony. \nWhat product do you want today?")
                    .font(.largeTitle .bold())
                
                
            }
        }
        .padding()
        .environmentObject(CartManager())
    }
}
