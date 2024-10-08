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
    private let token = "dfnodfdfbnfbdbfb465df4151d65fd65f415641df516"
    
    func getEvents(completion: @escaping (Result<[Content], Error>) -> Void) {
        
        guard let url = URL(string: baseURL) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(token, forHTTPHeaderField: "Token")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            
            //Handle error scenario
            if let error = error {
                
                print("Failed to fetch data: \(error)")
                completion(.failure(error))
                return
                
            }
            
            guard let data = data else {
                
                print("No data returned")
                completion(.failure(NSError(domain: "NoData", code: -1, userInfo: nil)))
                return
                
            }
            
            do {
                
                //decode respnse as a dictionary
                let decodedResponse = try JSONDecoder().decode(ApiResponse.self, from: data)
                completion(.success(decodedResponse.content))
                
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

//struct APIErrorResponse: Codable {
//
//    let status: String
//    let message: String
//    let data: [Event] //array of events
//}
