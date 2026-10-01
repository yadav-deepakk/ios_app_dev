//
//  ContentView.swift
//  Practice
//
//  Created by Deepak Kumar Yadav on 04/09/26.
//
import SwiftUI

struct ContentView : View {
    @State private var dragAmount: CGSize = .zero
    @State private var enabled = false
    var letters = Array("Hacking with swiftui")
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                ForEach(0..<letters.count, id:\.self) { i in
                    Text(String(letters[i]))
                        .padding(3)
                        .font(.title3.bold())
                        .foregroundStyle(.white)
                        .background(enabled ? .red : .blue)
                        .offset(dragAmount)
                        .animation(.linear.delay(Double(i)/25), value: dragAmount)
                }
            }
            .gesture (
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in
                        withAnimation {
                            dragAmount = .zero
                            enabled.toggle()
                        }
                    }
            )
        }
    }
}

#Preview {
    ContentView()
}

