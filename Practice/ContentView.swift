//
//  ContentView.swift
//  Practice
//
//  Created by Deepak Kumar Yadav on 04/09/26.
//

import SwiftUI

struct ContentView : View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        debugPrint("\(animationAmount)")
        
        return VStack {
            Button("Tap Me") {
                withAnimation(.spring(duration: 1.5)){
                    animationAmount += 360.0
                }
                animationAmount = 0.0
            }
                .padding(40)
                .background(.red)
                .foregroundStyle(Color.white)
                .clipShape(.circle)
                .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
        }
    }
}

#Preview {
    ContentView()
}
