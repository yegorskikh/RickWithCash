//
//  CharacterViewModel.swift
//  TableViewSwiftUI
//
//  Created by Yegor Gorskikh on 13.06.2025.
//

import Combine
import Foundation

class CharacterViewModel: ObservableObject {
    @Published var characters: [CharacterData] = []
    @Published var isOffline = false
    
    private let service = NetworkService()
    
    func loadCharacters() {
        service.fetchCharacters { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.characters = data
                    self?.isOffline = false
                case .failure:
                    self?.characters = self?.service.fetchCachedCharacters() ?? []
                    self?.isOffline = true
                }
            }
        }
    }
}
