//
//  Product.swift
//  ecommerce
//
//  Created by imac on 16/09/2024.
//

import Foundation

// Main response model
struct ApiResponse: Codable {
    let status: String
    let message: Int
    let content: [Content]
    let apiVersion: String

    enum CodingKeys: String, CodingKey {
        case status
        case message
        case content
        case apiVersion = "api_version"
    }
}

// Content Model
struct Content: Codable {
    let isHome: Bool
    let id: Int
    let title: String
    let proAccount: ProAccount
    let prices: [Price]
    let localisation: [Localisation]
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

    enum CodingKeys: String, CodingKey {
        case isHome = "is_home"
        case id
        case title
        case proAccount = "pro_account"
        case prices
        case localisation
        case files
        case tags
        case description
        case allowReservation = "allow_reservation"
        case likes
        case shares
        case rate
        case comments
        case user
        case date
        case dateStr = "date_str"
        case availablePlace = "available_place"
    }
}

// ProAccount Model
struct ProAccount: Codable {
    let id: Int
    let name: String
    let category: String
    let followers: Int
    let rate: Double
}

// Price Model (if it exists)
struct Price: Codable {
    let id: Int
    let amount: Int
    let name: String
    let description: [String]
}

// Localisation Model
struct Localisation: Codable {
    let name: String
    let country: String
    let region: String
    let department: String
    let city: String
    let district: String
    let headquarters: String
    let longitude: Double
    let latitude: Double
}

// File Model
struct File: Codable {
    let link: String
    let typeOfFile: String

    enum CodingKeys: String, CodingKey {
        case link
        case typeOfFile = "type_of_file"
    }
}

// Tag Model
struct Tag: Codable {
    let name: String
}

// User Model
struct User: Codable {
    let vip: Bool
    let follower: Bool
    let like: Bool
    let rate: Double?
}


//JSON Response: {"status": "success", "message": 145, "content": [{"is_home": false, "id": 101, "title": "K\u0112VA", "pro_account": {"id": 63, "name": "K\u0112VA", "category": "restaurant", "followers": 2, "rate": 2.5}, "prices": [], "localisation": [{"name": "K\u0112VA", "country": "Cameroun", "region": "Littoral", "department": "-", "city": "Douala", "district": "-", "headquarters": "Bonapriso", "longitude": 9.767729, "latitude": 4.079041}], "files": [{"link": "/files/files/Keva_2.jpeg", "type_of_file": "image"}, {"link": "/files/files/Keva_3.jpeg", "type_of_file": "image"}, {"link": "/files/files/Keva.mp4", "type_of_file": "video"}], "tags": [{"name": "Keva"}], "description": "Vous r\u00eavez des soir\u00e9es d\u00e9tente aux sonorit\u00e9s d'ailleurs, des mariachis qui jouent juste pour vous? KEVA Lounge c'est la bonne adresse pour vous.\r\n\r\nNotre \u00e9tablissement permet de reconnecter l\u2019homme \u00e0 la nature dans une ambiance chaleureuse et un esprit de KEVA !\r\n\r\nFaites plaisir \u00e0 vos sens dans une fusion parfaite entre le culturel et le culinaire.", "allow_reservation": "click", "likes": 5, "shares": 0, "rate": 2.5, "comments": 0, "user": {"vip": false, "follower": false, "like": false, "rate": null}, "date": "2024-10-05 08:00:00+00:00", "date_str": "demain", "available_place": 100}, {"is_home": false, "id": 113, "title": "FAIRY APARTMENTS", "pro_account": {"id": 69, "name": "Fairy Apartments", "category": "restaurant", "followers": 3, "rate": 2.5}, "prices": [], "localisation": [{"name": "Fairy Apartments", "country": "Cameroun", "region": "Centre", "department": "-", "city": "Yaound\u00e9", "district": "-", "headquarters": "Jouvence - Biyem Assi", "longitude": 11.48413502525956, "latitude": 3.829579683983824}], "files": [{"link": "/files/files/FA_1.jpg", "type_of_file": "image"}, {"link": "/files/files/FA_7.jpg", "type_of_file": "image"}, {"link": "/files/files/FA_5.jpg", "type_of_file": "image"}, {"link": "/files/files/FA_8.jpg", "type_of_file": "image"}, {"link": "/files/files/FA_6.jpg", "type_of_file": "image"}, {"link": "/files/files/FA_3.jpg", "type_of_file": "image"}, {"link": "/files/files/REEL_FA_001.mp4", "type_of_file": "video"}], "tags": [{"name": "yaounde"}, {"name": "yaounde"}], "description": "Bonjour,\r\nBienvenu chez FAIRY-APARTMENTS\ud83d\ude4f\ud83c\udffd\r\nContact: 651 67 46 38 / 699 00 97 10\r\nLocalisation\u00a0\r\nau lieu dit NOUVELLE ROUTE TAM-TAM - Jouvence \u2014 Yaound\u00e9\r\nYANGO \ud83d\udc49\ud83c\udffe Rue 7.438 \u00a0\u00a0\r\n\r\n\r\nTous les logements disposent d'une salle de bains privative avec baignoire ou douche, de la climatisation, d'une t\u00e9l\u00e9vision \u00e0 \u00e9cran plat et d'un four. Un micro-ondes, un r\u00e9frig\u00e9rateur, une machine \u00e0 caf\u00e9 et une bouilloire sont \u00e9galement fournis.\r\nVous pourrez profiter d'une terrasse.\r\n\r\nNous offrons\u00a0\r\n\u2022\u2060  \u2060appartement meubl\u00e9 de luxe \u2013 Fibre optique / Wi-Fi haut debit gratuit \u2014 Netflix + Canal Sat + TV connect\u00e9 \u2013 Climatisation \u2013 forage (pas de probl\u00e8me d'eau) \u2014 Groupe \u00e9lectrique en cas de coupure \u2013 gardien 24\u00a0h/24 - cam\u00e9ra de surveillance\u00a0\u00e0 l'ext\u00e9rieur - parking priv\u00e9 gratuits.\r\n", "allow_reservation": "click", "likes": 4, "shares": 0, "rate": 2.5, "comments": 0, "user": {"vip": false, "follower": false, "like": false, "rate": null}, "date": "2024-10-05 13:00:00+00:00", "date_str": "demain", "available_place": 100}, {"is_home": false, "id": 20, "title": "ONE ROOF TOP", "pro_account": {"id": 18, "name": "ONE ROOF TOP - DLA", "category": "restaurant", "followers": 14, "rate": 2.5}, "prices": [], "localisation": [{"name": "One rooftop, Douala", "country": "Cameroun", "region": "Littoral", "department": "Littoral", "city": "Douala", "district": "Douala", "headquarters": "Bonapriso", "longitude": 9.70726174559038, "latitude": 4.0304205724195885}], "files": [{"link": "/files/files/one_rooftop_dl_4_9kLRgit.jpg", "type_of_file": "image"}, {"link": "/files/files/one_rooftop_dl_1_sx4mNbb.jpg", "type_of_file": "image"}, {"link": "/files/files/one_rooftop_dl_2_qc2QMCp.jpg", "type_of_file": "image"}, {"link": "/files/files/Bildschirmfoto_2022-05-18_um_22.35.34-2.png", "type_of_file": "image"}, {"link": "/files/files/Affichage_One_Rooftop_2-2.jpg", "type_of_file": "image"}], "tags": [{"name": "roof"}], "description": "Restaurant | Lounge - Bar - Terrace | Steakhouse - Sushi\r\nOpen Mon - Sun | Doors open at 4:00 PM", "allow_reservation": "click", "likes": 6, "shares": 0, "rate": 2.5, "comments": 0, "user": {"vip": false, "follower": false, "like": false, "rate": null}, "date": "2024-10-06 14:00:00+00:00", "date_str": "6 octobre 2024", "available_place": 100}, {"is_home": false, "id": 115, "title": "KENNY'S", "pro_account": {"id": 33, "name": "KENNY'S GREAT HOUSE", "category": "restaurant", "followers": 4, "rate": 2.5}, "prices": [{"id": 376, "amount": 1000, "name": "test_kennys", "description": ["Description prix 1"]}], "localisation": [{"name": "KENNY'S GREAT HOUSE", "country": "Cameroun", "region": "Centre", "department": "Centre", "city": "Yaound\u00e9", "district": "Yaound\u00e9", "headquarters": "Nkol Eton", "longitude": 11.512624826983313, "latitude": 3.8979063298927565}], "files": [{"link": "/files/files/Kennys_2_dwpCwgt.jpg", "type_of_file": "image"}, {"link": "/files/files/Kennys_1_PNzFYgj.jpg", "type_of_file": "image"}, {"link": "/files/files/kennys_3_uKR3yYM.jpg", "type_of_file": "image"}, {"link": "/files/files/tinywow_79d2bb97c05d49bca2c55868b01eaa65_48756083.mp4", "type_of_file": "video"}], "tags": [{"name": "bastos"}, {"name": "bastos"}], "description": "\u2023 \ud835\udc11\ud835\udc04\ud835\udc12\ud835\udc13\ud835\udc00\ud835\udc14\ud835\udc11\ud835\udc00\ud835\udc0d\ud835\udc13 \ud835\udc06\ud835\udc00\ud835\udc12\ud835\udc13\ud835\udc11\ud835\udc0e\ud835\udc0d\ud835\udc0e\ud835\udc0c\ud835\udc08\ud835\udc10\ud835\udc14\ud835\udc04\r\n\u2023 Hotel 4 \u00c9toiles | Night club | Pool", "allow_reservation": "paid", "likes": 3, "shares": 0, "rate": 2.5, "comments": 9, "user": {"vip": false, "follower": false, "like": false, "rate": null}, "date": "2024-10-05 08:00:00+00:00", "date_str": "demain", "available_place": 294}, {"is_home": false, "id": 94, "title": "TASSA", "pro_account": {"id": 60, "name": "TASSA", "category": "restaurant", "followers": 1, "rate": 2.5}, "prices": [], "localisation": [{"name": "Tassa", "country": "Cameroun", "region": "Centre", "department": "-", "city": "Yaound\u00e9", "district": "-", "headquarters": "Bastos", "longitude": 11.512446173409964, "latitude": 3.885862592047632}], "files": [{"link": "/files/files/Tassa_Yde_1_MivknzU.jpg", "type_of_file": "image"}, {"link": "/files/files/Tassa_Yde_2_Qn2qKmR.jpg", "type_of_file": "image"}, {"link": "/files/files/5A4170ACFB98162309A430FBCE26BCB2_video_dashinit.mp4", "type_of_file": "video"}], "tags": [{"name": "tassa"}, {"name": "bastos"}], "description": "Restaurant Tassa\r\n\r\nTous les vendredis chez Tassa \ud83c\udf3f !\r\nDe 15h \u00e0 19 h \ud83d\udd70\ufe0f\r\n1 boisson achet\u00e9e la 2i\u00e8me offerte ! \ud83c\udf79\ud83c\udf78", "allow_reservation": "paid", "likes": 2, "shares": 0, "rate": 2.5, "comments": 0, "user": {"vip": false, "follower": false, "like": false, "rate": null}, "date": "2024-10-05 09:00:00+00:00", "date_str": "demain", "available_place": 300}, {"is_home": false, "id": 116, "title": "THE YARD", "pro_account": {"id": 71, "name": "THE YARD", "category": "restaurant", "followers": 1, "rate": 2.5}, "prices": [], "localisation": [{"name": "The Yard", "country": "Cameroun", "region": "Littoral", "department": "-", "city": "Douala", "district": "-", "headquarters": "Bonapriso", "longitude": 9.700928138690415, "latitude": 4.028613933300022}], "files": [{"link": "/files/files/Yard_2.jpg", "type_of_file": "image"}, {"link": "/files/files/Yard_1.jpg", "type_of_file": "image"}, {"link": "/files/files/Yard_3.jpg", "type_of_file": "image"}, {"link": "/files/files/Yard_4.jpg", "type_of_file": "image"}, {"link": "/files/files/Yard_video.mp4", "type_of_file": "video"}], "tags": [{"name": "yard"}, {"name": "bonapriso"}], "description": "The Yard | RESTAURANT & BAR\r\nRestaurant Bar Terrace", "allow_reservation": "paid", "likes": 1, "shares": 0, "rate": 2.5, "comments": 0, "user": {"vip": false, "follower": false, "like": false, "rate": null}, "date": "2024-10-04 11:00:00+00:00", "date_str": "aujourd'hui", "available_place": 300}], "api_version": "v1"}
