//
//  ecommerceApp.swift
//  ecommerce
//
//  Created by imac on 16/09/2024.
//

import SwiftUI

@main
struct ecommerceApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
