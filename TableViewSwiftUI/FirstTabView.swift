//
//  FirstTabView.swift
//  TableViewSwiftUI
//
//  Created by Yegor Gorskikh on 24.03.2025.
//

import SwiftUI

// MARK: - Первый таб
struct FirstTabView: View {
    @Binding var selectedTab: Int
    @Binding var selectedItem: String?
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Первый таб")
                .font(.title)
            
            Button("Открыть второй таб и пункт \"Banana\"") {
                selectedItem = "Banana"
                selectedTab = 1
            }
        }
        .padding()
    }
}
