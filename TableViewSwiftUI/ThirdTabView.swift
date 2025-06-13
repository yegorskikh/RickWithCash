//
//  ThirdTabView.swift
//  TableViewSwiftUI
//
//  Created by Yegor Gorskikh on 24.03.2025.
//

import SwiftUI

struct ThirdTabView: View {
    @Binding var showModal: Bool
    
    var body: some View {
        VStack(spacing: 16) {
            UIKitLabel()
                .frame(height: 50)
            Button("Open Modal") {
                showModal = true
            }
        }
        .padding()
    }
}

// MARK: - Модальное окно
struct ModalView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Ого, это модальное окно!")
                .font(.title)
            Text("Закройте меня, потяни вниз :(")
                .foregroundColor(.gray)
        }
        .padding()
    }
}

struct UIKitLabel: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.text = "Привет из UIKit!"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
    }
}
