//
//  SecondTabView.swift
//  TableViewSwiftUI
//
//  Created by Yegor Gorskikh on 24.03.2025.
//

import SwiftUI

struct SecondTabView: View {
    @StateObject private var viewModel = CharacterViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.characters) { character in
                HStack {
                    AsyncImage(url: URL(string: character.image)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())

                    VStack(alignment: .leading) {
                        Text(character.name)
                            .font(.headline)
                        Text("\(character.species) — \(character.status)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Rick & Morty")
            .onAppear {
                viewModel.loadCharacters()
            }
        }
    }
}
