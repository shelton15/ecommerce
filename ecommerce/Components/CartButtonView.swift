//
//  CartButtonView.swift
//  ecommerce
//
//  Created by imac on 17/09/2024.
//

import SwiftUI

struct CartButtonView: View {
    
    var numberOfProducts: Int
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            
            Image(systemName: "bag.fill")
                .foregroundColor(Color("kPrimary"))
                .padding(5)
            
            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .font(.caption2)
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .background(.orange)
                    .cornerRadius(50) 
            }
            
        }
    }
}

struct CartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CartButtonView(numberOfProducts: 1)
    }
}
