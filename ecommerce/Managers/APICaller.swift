//
//  APICaller.swift
//  ecommerce
//
//  Created by imac on 17/09/2024.
//

import Foundation

struct Constants {
    
    static let baseURL = "https://fakestoreapi.com/products"
    
}

enum APIError: Error {
    
    case failedTogetData
    
}

class APICaller {
    
    static let shared = APICaller()
    
    func getProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(APIError.failedTogetData))
                return
            }
            
            do {
                let results = try JSONDecoder().decode(ProductDisplay.self, from: data)
                completion(.success(results.results))
                
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
            
        }
        
        task.resume()
        
    }
}
