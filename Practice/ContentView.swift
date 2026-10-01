//
//  ContentView.swift
//  Practice
//
//  Created by Deepak Kumar Yadav on 04/09/26.
//
import SwiftUI

struct ContentView : View {
    @State private var dragAmount: CGSize = .zero

    var body: some View {
        VStack {
            LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 280, height: 180)
                .cornerRadius(12)
                .offset(dragAmount)
                .gesture(
                    DragGesture()
                        .onChanged { dragAmount = $0.translation }
                        .onEnded { _ in withAnimation { dragAmount = .zero } }
                )
        }
    }
}

#Preview {
    ContentView()
}

