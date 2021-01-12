//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Shweta Shrivastava on 11/26/20.
//

import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerUrl = baseURL + "appetizers"
    
    private init() {}
    
    func getAppetizer(completion: @escaping (Result<[Appetizer], APError>) -> Void) {
        guard let url = URL(string: appetizerUrl) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (date, response, error) in
            guard error == nil else {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200  else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = date else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedRes = try decoder.decode(AppetizerResponse.self, from: data)
                completion(.success(decodedRes.request))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func downloadImage(fromURlString urlString: String, completion: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completion(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (date, response, error) in
            
            guard let data = date, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completion(image)
        }
        
        task.resume()
    }
}
