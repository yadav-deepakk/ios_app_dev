//
//  ContentView.swift
//  Practice
//
//  Created by Deepak Kumar Yadav on 04/09/26.
//
import SwiftUI

struct ContentView : View {
    @State private var show = false
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation(.spring(duration: 1).delay(0.2)) {
                    show.toggle()
                }
            }
            if show {
                Rectangle()
                    .frame(width: 200, height: 200)
                    .foregroundStyle(.red)
                    .cornerRadius(12)
                    .transition(
                        .asymmetric(
                            insertion: .opacity,
                            removal: .push(from: .top)
                        )
                    )
            }
        }
    }
}

#Preview {
    ContentView()
}

