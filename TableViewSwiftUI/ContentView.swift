//
//  ContentView.swift
//  TableViewSwiftUI
//
//  Created by Yegor Gorskikh on 24.03.2025.
//

import SwiftUI
import UIKit


struct ContentView: View {
    @State private var selectedTab = 0
    @State private var selectedItem: String? = nil
    @State private var showModal = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FirstTabView(selectedTab: $selectedTab, selectedItem: $selectedItem)
                .tabItem {
                    Text("First")
                }
                .tag(0)

            SecondTabView()
                .tabItem {
                    Text("Rick and Morty")
                }
                .tag(1)

            ThirdTabView(showModal: $showModal)
                .tabItem {
                    Text("Third")
                }
                .tag(2)
        }
        // Здесь же отображаем модальное окно (sheet)
        .sheet(isPresented: $showModal) {
            ModalView()
        }
    }
}

#Preview {
    ContentView()
}
