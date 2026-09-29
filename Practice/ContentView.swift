//
//  ContentView.swift
//  Practice
//
//  Created by Deepak Kumar Yadav on 04/09/26.
//

import SwiftUI

struct ContentView : View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            Button("Tap Me") { }
                .padding(28)
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(.circle)
                .overlay {
                    Circle()
                        .stroke(.pink)
                        .scaleEffect(animationAmount)
                        .opacity(2 - animationAmount)
                        .animation(
                            .easeOut(duration: 1)
                                .repeatForever(autoreverses: false),
                            value: animationAmount
                        )
                }
                .onAppear { animationAmount = 2 }

        }
    }
}

#Preview {
    ContentView()
}
