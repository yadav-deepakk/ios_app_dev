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
            Spacer()
            Stepper("Animation amount: \(animationAmount.formatted())", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true)
            ), in: 1...10)
                .padding(.horizontal, 20)
            Spacer()
            Button("Tap Me") { animationAmount += 1 }
                .padding(28)
                .background(.red)
                .foregroundStyle(Color.white)
                .clipShape(.circle)
                .scaleEffect(animationAmount)
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
