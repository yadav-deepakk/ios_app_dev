//
//  HomeView.swift
//  Practice
//
//  Created by Deepak Kumar Yadav on 04/09/26.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(AuthStore.self) private var authStore: AuthStore
    
    @State private var isPlaying: Bool = false
    
    var body: some View {
        VStack{
            Text(authStore.getUsername() + " welcome").font(.title)
            Image(systemName: "music.note")
                .resizable()
                .padding(10)
                .frame(width: 200, height: 200, alignment: .topLeading)
                .background(Color.teal.opacity(0.5))
                .cornerRadius(10)
            
            Text("\(self.isPlaying ? "Playing":"Paused")")
                .font(.title3)
                .fontWeight(.semibold)
            
            MusicControlsView(isPlaying: $isPlaying)

        }.padding()
    }
}

#Preview {
    HomeView()
        .environment(AuthStore())
}
