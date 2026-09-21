//
//  ContentView.swift
//  Practice
//
//  Created by Deepak Kumar Yadav on 04/09/26.
//

import SwiftUI

struct CapsuleModifier: ViewModifier {
    var bgColor: Color?
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 10)
            .padding(.horizontal, 10)
            .foregroundStyle(.white)
            .background(bgColor ?? .green)
            .clipShape(.capsule)
            .shadow(radius: 4)
    }
}

extension View {
    func capsuleStyle(bgColor: Color? = nil) -> some View {
        modifier(CapsuleModifier(bgColor: bgColor))
    }
}

struct CapsuleButton : View {
    var text: String
    var bgColor: Color?
    var action: () -> Void
    var body: some View {
        Button(action: self.action, label: {
            Text(text.capitalized)
                .capsuleStyle(bgColor: bgColor)
        })
    }
}

struct ContentView: View {
    @State private var count: Int = 0
    var body : some View {
        Text("\(count)")
            .font(.largeTitle.bold())
        HStack{
            CapsuleButton(text: "UP") { count += 1 }
            CapsuleButton(text: "DOWN", bgColor: .red) { count -= 1 }
        }
    }
}

#Preview {
    ContentView()
}
