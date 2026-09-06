//
//  HomeView.swift
//  Practice
//
//  Created by Deepak Kumar Yadav on 06/09/26.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(AuthStore.self) private var authStore: AuthStore
    var colors = ["black", "white", "red", "green", "blue"]
        
    var body: some View {
        VStack {
            
            Text("username: \(authStore.username)")

                Picker("Username", selection: Binding(get: { authStore.favouriteColor }, set: { authStore.favouriteColor = $0 })) {
                    ForEach(colors, id: \.self) { color in
                        Text(color).tag(color)
                    }
                }
            
            NavigationLink("Third View", destination: ThirdView())

        }
        .padding()
        .navigationTitle("Home View")
    }
}

#Preview {
    HomeView()
        .environment(AuthStore())
}
