//
//  SearchView.swift
//  ecommerce
//
//  Created by imac on 16/09/2024.
//

import SwiftUI

struct SearchView: View {
    
    @State private var search: String = ""
    
    var body: some View {
        HStack {
            HStack{
                Image(systemName: "magnifyingglass")
                    .padding(.leading)
                
                TextField("Search For Product", text: $search)
                    .padding()
                
            }
            
            .background(Color("kSecondary"))
            .cornerRadius(12)
            
            Image(systemName: "slider.horizontal.3")
                .padding()
                .foregroundColor(.black)
                
        }
            .padding(.horizontal)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
