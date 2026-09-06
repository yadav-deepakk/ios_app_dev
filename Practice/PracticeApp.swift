//
//  PracticeApp.swift
//  Practice
//
//  Created by Deepak Kumar Yadav on 04/09/26.
//

import SwiftUI

@main
struct PracticeApp: App {
    
    @State private var authStore: AuthStore = AuthStore()
        
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(authStore)
        }
    }
}
