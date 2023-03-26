//
//  NetworkManager.swift
//  SampleListingsApp
//
//  Created by Muhammad Zulqurnain on 26/03/2023.
//

import Foundation

protocol NetworkManagerProtocol {
  func fetchListings(completion: @escaping ([Listing]) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchListings(completion: @escaping ([Listing]) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {
            return
        }
        
        Task {
            do {
                let (data, response) = try await URLSession.shared.data(from: url)
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    print("Failed to fetch data")
                    return
                }
                let decoder = JSONDecoder()
                let decodedListings = try decoder.decode([Listing].self, from: data)
                completion(decodedListings)
            } catch {
                print("Error fetching listings: \(error)")
            }
        }
    }
}
