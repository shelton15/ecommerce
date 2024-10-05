//
//  HomePageView.swift
//  ecommerce
//
//  Created by imac on 17/09/2024.
//

import SwiftUI

//struct HomePageView: View {
//
////    @State private var products: [Product] = []
//
//    @State private var isLoading = true
//
//    @EnvironmentObject var cartManager: CartManager
//
//    var body: some View {
//        NavigationStack {
//            ZStack(alignment: .top) {
//                Color.white
//                    .edgesIgnoringSafeArea(.all)
//
//                VStack {
//                    AppBar()
//
//                    SearchView()
//
//                    HStack{
//                        Text("Events")
//                            .font(.title2)
//                            .fontWeight(.medium)
////                            .frame(alignment: .leading)
//
//                        Spacer()
//
//                    }
//                    .padding()
//
////                    ScrollView(.horizontal, showsIndicators: false) {
////                        HStack(spacing: 10) {
////                            ForEach(products, id: \.id) {product in
////                                NavigationLink(destination: ProductDetailView(product: product)) {
////                                    ProductCardView(product: product)
////                                        .environmentObject(cartManager)
////                                }
////                            }
////                        }
////                    }
////                    .padding()
////                    .onAppear {
////                        fetchProducts()
////                    }
//
//                }
//
//            }
//            .environmentObject(cartManager)
//        }
//    }
//
////    private func fetchProducts() {
////        APICaller.shared.getProducts { result in
////            DispatchQueue.main.async {
////                switch result {
////                case .success(let fetchproducts):
////                    self.products = fetchproducts
////                    self.isLoading = false
////                case .failure(let error):
////                    print("Error fetching products: \(error)")
////                    self.isLoading = false
////                }
////            }
////
////        }
////    }
//
//}
//
//
//
//struct HomePageView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomePageView()
//            .environmentObject(CartManager())
//    }
//}
//
//struct AppBar: View {
//
//    @EnvironmentObject var cartManager: CartManager
//
//    var body: some View {
//        NavigationStack{
//            VStack(alignment: .leading) {
//                HStack{
//                    Image(systemName: "line.3.horizontal.decrease")
//                        .resizable()
//                        .frame(width: 20, height: 20)
//                        .padding(.trailing)
//
//
//                    Spacer()
//
////                    NavigationLink(destination: CartView()
////                        .environmentObject(cartManager)
////                    ) {
////                        CartButtonView(numberOfProducts: cartManager.products.count)
////                    }
//                }
//
//                Text("Hello, Shelton. \nWhat events will you attend today?")
//                    .font(.largeTitle .bold())
//
//
//            }
//        }
//        .padding()
//        .environmentObject(CartManager())
//    }
//}

struct EventsView: View {
    
    @State private var restaurants: [Restaurant] = []
    @State private var isLoading = true //loading state
    @State private var errorMessage: String? = nil //error message state
    var body: some View {
        
        NavigationView {
            
            Group {
                if isLoading {
                    ProgressView("Loading events...")
                } else if let errorMessage = errorMessage {
                    Text("Error: \(errorMessage)")
                } else {
                    List(restaurants, id: \.id) { restaurant in
                        NavigationLink(destination: EventDetailView(restaurant: restaurant)) {
                            RestaurantRow(restaurant: restaurant)
                        }
                    }
                }
            }
            .navigationTitle("Events")
            .onAppear {
                fetchEvents() // fetch the restaurants on view load
            }
            
        }
        
    }
    
    private func fetchEvents() {
        
        APICaller.shared.getEvents { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let events):
                    self.restaurants = events
                    self.isLoading = false
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
            }
        }
        
    }
    
}

struct RestaurantRow: View {
    let restaurant: Restaurant
    
    var body: some View {
        HStack {
            if let imageURL = URL(string: restaurant.files.first?.link ?? "") {
                AsyncImage(url: imageURL)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }
            VStack(alignment: .leading) {
                Text(restaurant.title)
                    .font(.headline)
                Text(restaurant.localisation.country)
                    .font(.subheadline)
            }
        }
    }
}

struct EventDetailView: View {
    let restaurant: Restaurant
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // display images
                if let imageURL = URL(string: restaurant.files.first?.link ?? "") {
                    AsyncImage(url: imageURL)
                        .frame(height: 300)
                        .cornerRadius(10)
                        .padding()
                }
                
                // restaurant title
                Text(restaurant.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding([.leading, .trailing])
                
                // restau description
                Text(restaurant.description)
                    .font(.body)
                    .padding([.leading, .trailing])
                
                //restau location
                HStack {
                    Text("Location: ")
                        .fontWeight(.bold)
                    Text("\(restaurant.localisation.city), \(restaurant.localisation.country)")
                }
                .padding([.leading, .trailing])
                
                HStack {
                    Text("Followers: ")
                        .fontWeight(.bold)
                    Text("\(restaurant.followers)")
                }
                
            }
            .navigationTitle(restaurant.title)
        }
    }
}

struct EventsView_Preview: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}

struct IdentifiableError: Identifiable {
    let id = UUID()
    let message: String
}
