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
            Button("Tap Me") { animationAmount += 1 }
                .padding(28)
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(.circle)
                .scaleEffect(animationAmount)
                .blur(radius: (animationAmount - 1) * 2)
                .animation(.bouncy, value: animationAmount)
        }
    }
}

#Preview {
    ContentView()
}
