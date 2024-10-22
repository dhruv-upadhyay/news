//
//  NetworkService.swift
//  News
//
//  Created by Dhruv Upadhyay on 14/10/24.
//

import Foundation


class NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    // Method to fetch data from a given URL
    func fetchData<T: Decodable>(from url: URL, type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Handle any errors
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Ensure data is not nil
            guard let data = data else {
                let noDataError = NSError(domain: "FetchDataError", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                completion(.failure(noDataError))
                return
            }
            
            do {
                // Decode the data to the specified type
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedObject))
            } catch {
                // Handle decoding errors
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
