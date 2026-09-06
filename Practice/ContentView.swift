//
//  ContentView.swift
//  Practice
//
//  Created by Deepak Kumar Yadav on 04/09/26.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(AuthStore.self) private var authStore: AuthStore
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("username is = \(authStore.username)")
                TextField("username", text: Binding(
                    get: { authStore.username },
                    set: { authStore.username = $0 }
                ))
                    .padding()
                    .textInputAutocapitalization(.never)
                    .background(Color(hue: 0,saturation: 0,brightness: 0,opacity: 0.05))
                    .cornerRadius(10)
                NavigationLink("second view", destination: HomeView())
                
            }.padding()
            .navigationTitle(Text("Env object"))
        }
        
    }
}

#Preview {
    ContentView()
        .environment(AuthStore())
}
