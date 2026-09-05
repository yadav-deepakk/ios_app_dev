//
//  MusicControlsView.swift
//  Practice
//
//  Created by Deepak Kumar Yadav on 05/09/26.
//

import SwiftUI

struct MusicControlsView: View {
    
    @Binding var isPlaying: Bool
    
    var body: some View {
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
    }
}

#Preview {
    MusicControlsView(isPlaying: .constant(false))
}
