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
    
    @State private var events: [Event] = []
    @State private var errorMessage: IdentifiableError?
    var body: some View {
        
        NavigationView {
            
            List(events) {event in
                NavigationLink(destination: EventDetailView(event: event)) {
                    
                    HStack(alignment: .top, spacing: 10) {
                        if let imageUrl = event.image, let url = URL(string: imageUrl) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(8)
                            } placeholder: {
                                ProgressView()
                            }
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .cornerRadius(8)
                                .foregroundColor(.gray)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(event.name)
                                .font(.headline)
                            
                            Text(event.date)
                                .font(.subheadline)
                            
                            Text(event.location)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                }
            }
            .navigationTitle("Events")
            .onAppear {
                fetchEvents()
            }
            .alert(item: $errorMessage) { error in
                Alert(title: Text("Error"), message: Text(error.message), dismissButton: .default(Text("OK")))
            }
            
        }
        
    }
    
    private func fetchEvents() {
        
        APICaller.shared.getEvents { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let events):
                    self.events = events
                case .failure(let error):
                    self.errorMessage = IdentifiableError(message: error.localizedDescription)
                }
            }
        }
        
    }
    
}

struct EventDetailView: View {
    var event: Event

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Display the event image
                if let imageUrl = event.image, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .clipped()
                    } placeholder: {
                        ProgressView()
                    }
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text(event.name)
                        .font(.title)
                        .bold()

                    Text("Date: \(event.date)")
                        .font(.subheadline)

                    Text("Location: \(event.location)")
                        .font(.subheadline)

                    if let description = event.description {
                        Text(description)
                            .font(.body)
                            .padding(.top)
                    } else {
                        Text("No description available.")
                            .font(.body)
                            .italic()
                    }
                }
                .padding()
            }
        }
        .navigationTitle(event.name)
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
