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
        if(authStore.isUserLoggedIn()){
            HomeView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    ContentView()
        .environment(AuthStore())
}
