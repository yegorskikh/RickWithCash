//
//  NetworkService.swift
//  TableViewSwiftUI
//
//  Created by Yegor Gorskikh on 13.06.2025.
//

import Foundation

struct CharacterData: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
}

struct APIResponse: Codable {
    let results: [CharacterData]
}

// MARK: - Network & Caching Service

class NetworkService {
    private let baseURL = URL(string: "https://rickandmortyapi.com/api/character")!
    private let cacheKey = "cachedCharacters"
    
    func fetchCharacters(completion: @escaping (Result<[CharacterData], Error>) -> Void) {
        URLSession.shared.dataTask(with: baseURL) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            do {
                let response = try JSONDecoder().decode(APIResponse.self, from: data)
                let characters = response.results
                // Cache to UserDefaults
                self.saveToCache(characters)
                completion(.success(characters))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    private func saveToCache(_ characters: [CharacterData]) {
        do {
            let data = try JSONEncoder().encode(characters)
            UserDefaults.standard.set(data, forKey: cacheKey)
        } catch {
            print("Failed to encode cache: \(error)")
        }
    }
    
    func fetchCachedCharacters() -> [CharacterData]? {
        guard let data = UserDefaults.standard.data(forKey: cacheKey) else {
            return nil
        }
        do {
            let characters = try JSONDecoder().decode([CharacterData].self, from: data)
            return characters
        } catch {
            print("Failed to decode cache: \(error)")
            return nil
        }
    }
    
    enum NetworkError: Error {
        case noData
    }
}
