//
//  APICaller.swift
//  ecommerce
//
//  Created by imac on 17/09/2024.
//

import Foundation

//struct Constants {
//    static let baseURL = "https://wazupapp.com/list_restaurant_event"
//    static let token = "dfnodfdfbnfbdbfb465df4151d65fd65f415641df516"
//}

//enum APIError: Error {
//
//    case failedTogetData
//
//}

class APICaller {
    
    static let shared = APICaller()
    
    private let baseURL = "https://wazupapp.com/list_restaurant_event"
//    private let token = "dfnodfdfbnfbdbfb465df4151d65fd65f415641df516"
    
    func getEvents(completion: @escaping (Result<[Event], Error>) -> Void) {
        
        guard let url = URL(string: baseURL) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
        request.setValue("dfnodfdfbnfbdbfb465df4151d65fd65f415641df516", forHTTPHeaderField: "Token")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(error!))
                return
            }
            
            //print json data
            if let jsonString = String(data: data, encoding: .utf8) {
                print("JSON Response: \(jsonString)")
            }
            
            do {
                let errorResponse = try JSONDecoder().decode(APIErrorResponse.self, from: data)
                print("API Error: \(errorResponse.message)")
                completion(.failure(error!))
            } catch {
                
            }
            
            do {
                
                let events = try JSONDecoder().decode([Event].self, from: data)
                completion(.success(events))
            } catch {
                print("Decoding Error: \(error)")
                completion(.failure(error))
            }
        }
        task.resume()
        
    }
    
//    func getProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
//
//        guard let url = URL(string: "\(Constants.baseURL)/products") else {return}
//
//        let config = URLSessionConfiguration.default
//        config.timeoutIntervalForRequest = 30.0
//        let session = URLSession(configuration: config)
//
//        let task = session.dataTask(with: URLRequest(url: url)) {data, _, error in
//            guard let data = data, error == nil else {
////                completion(.failure(APIError.failedTogetData))
//                return
//            }
//
//            do {
//                let results = try JSONDecoder().decode(ProductDisplay.self, from: data)
//                completion(.success(results.results))
//
//            } catch {
//                completion(.failure(APIError.failedTogetData))
//            }
//
//        }
//
//        task.resume()
//
//    }
}

struct APIErrorResponse: Codable {
    
    let status: String
    let message: String
}
