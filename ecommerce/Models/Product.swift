//
//  Product.swift
//  ecommerce
//
//  Created by imac on 16/09/2024.
//

import Foundation

//struct ProductDisplay: Codable {
//    let results: [Product]
//}
//
//struct Product : Codable, Identifiable {
//
//    let id: Int
//    let title: String?
//    let price: Double
//    let category: String?
//    let description: String?
//    let image: String?
//
//}

//struct EventDisplay: Codable {
//    let results: [Event]
//}

struct File: Codable {
    let link: String
    let typeOfFile: String
}

struct Localisation: Codable {
    let country: String
    let region: String
    let city: String
    let headquarters: String
    let longitude: Double
    let latitude: Double
}

struct ProAccount: Codable {
    let id: Int
    let rate: Double
}

struct Tag: Codable {
    let name: String
}

struct Restaurant: Codable {
    let isHome: Bool
    let title: String
    let proAccount: ProAccount
    let prices: [String]
    let category: String
    let followers: Int
    let localisation: Localisation
    let files: [File]
    let tags: [Tag]
    let description: String
    let allowReservation: String
    let likes: Int
    let shares: Int
    let rate: Double
    let comments: Int
    let user: User
    let date: String
    let dateStr: String
    let availablePlace: Int
}

struct User: Codable {
    let vip: Bool
    let follower: Bool
    let like: Bool?
    let rate: Double?
}

struct ApiResponse: Codable {
    let status: String
    let message: Int
    let restaurants: [Restaurant]
}

//let id: Int
//let title: String
//let price: Double
//let category: String
//let description: String
//let image: String
