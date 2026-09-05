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
            
            HStack{
                Button(action: {
                    
                }, label:{
                    Image(systemName: "backward.fill")
                        .resizable()
                        .frame(width: 34, height: 30)
                        .padding()
                })
                
                Button(action: {
                    self.isPlaying.toggle()
                }, label:{
                    Image(systemName: !self.isPlaying ? "play.fill" : "pause.fill")
                        .resizable()
                        .frame(width: 34, height: 30)
                        .padding()
                })
                
                Button(action: {
                    
                }, label:{
                    Image(systemName: "forward.fill")
                        .resizable()
                        .frame(width: 34, height: 30)
                        .padding()
                })
                
            }.padding()

        }.padding()
    }
}

#Preview {
    HomeView()
        .environment(AuthStore())
}
