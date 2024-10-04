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
                    List(restaurants, id: \.title) { restaurant in
                        NavigationLink(destination: EventDetailView(restaurant: restaurant)) {
                            HStack {
                                // show restaurant title
                                VStack(alignment: .leading) {
                                    Text(restaurant.title)
                                        .font(.headline)
                                    Text(restaurant.localisation.city)
                                        .font(.subheadline)
                                }
                            }
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

struct EventDetailView: View {
    let restaurant: Restaurant
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // display images
                ForEach(restaurant.files, id: \.link) { file in
                    if file.typeOfFile == "image" {
                        AsyncImage(url: URL(string: file.link)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                            case .failure:
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                            @unknown default:
                                EmptyView()
                            }
                        }
                        .frame(height: 200)
                    }
                }
                
                // restaurant title
                Text(restaurant.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                // restau description
                Text(restaurant.description)
                    .font(.body)
                
                //restau location
                VStack(alignment: .leading, spacing: 4) {
                    Text("Location: \(restaurant.localisation.city), \(restaurant.localisation.country)")
                    Text("Headquarters: \(restaurant.localisation.headquarters)")
                    Text("Latitude: \(restaurant.localisation.latitude)")
                    Text("Longitude: \(restaurant.localisation.longitude)")
                }
                .font(.subheadline)
                
                //restau rates and details
                VStack(alignment: .leading, spacing: 4) {
                    Text("Rate: \(restaurant.rate)")
                    Text("Likes: \(restaurant.likes)")
                    Text("Comments: \(restaurant.comments)")
                    Text("Followers: \(restaurant.followers)")
                }
                .font(.subheadline)
                
                // reservation button if allowed
                if restaurant.allowReservation == "click" {
                    Button(action: {
                        
                    }) {
                        Text("Make Reservation")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
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
