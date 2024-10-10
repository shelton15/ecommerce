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

struct EventView: View {
    @State private var events: [Content] = []
    
    var body: some View {
        NavigationView {
            List(events, id: \.id) { event in
                NavigationLink(destination: EventDetailView(event: event)) {
                    Text(event.title)
                }
            }
            .navigationTitle("Events")
            .onAppear {
                fetchEvents()
            }
        }
    }
    
    private func fetchEvents() {
        APICaller.shared.getEvents { result in
            switch result {
            case .success(let content):
                DispatchQueue.main.async {
                    self.events = content
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}


struct EventDetailView: View {
    var event: Content
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(event.title)
                    .font(.largeTitle)
                    .bold()
                    .padding(.top)
                
                //check if there are any image files
                if event.files.contains(where: { $0.typeOfFile == "image" }) {
                    
                    //swipeable image gallery using tabview
                    TabView {
                        
                        ForEach(event.files.filter { $0.typeOfFile == "image"}, id: \.link) { file in
                            
                            if let imageUrl = URL(string: file.link) {
                                
                                AsyncImage(url: imageUrl) { phase in
                                    
                                    switch phase {
                                        
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: .infinity, maxHeight: 300)
                                        
                                    case .failure:
                                        Text("Failed to load image")
                                            .foregroundColor(.red)
                                    
                                    case .empty:
                                        ProgressView()
                                    
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                                .frame(maxWidth: .infinity, maxHeight: 300)
                            }
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always)) //enables swiping
                    .frame(height: 300) //set height of tabview to match image height
                } else {
                    
                    //display if there is no available images
                    Text("No images available")
                        .foregroundColor(.red)
                }
                
                Text(event.description)
                    .font(.body)
                    .padding(.top, 10)
                
                // Display tags
                let tags = event.tags.map { $0.name }.joined(separator: ", ")
                Text("Tags: \(tags)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Event Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct EventsView_Preview: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}

struct IdentifiableError: Identifiable {
    let id = UUID()
    let message: String
}
