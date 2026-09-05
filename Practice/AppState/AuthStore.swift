//
//  AuthStore.swift
//  Practice
//
//  Created by Deepak Kumar Yadav on 04/09/26.
//
import SwiftUI
import Observation

@Observable
final class AuthStore {
    private var user: User?
    
    func isUserLoggedIn() -> Bool {
        return self.user != nil
    }
    
    func setUser(user: User) {
        self.user = user
    }
    
    func getUsername() -> String{
        return self.user?.username ?? "Anonymous"
    }
    
    func logout() {
        self.user = nil
    }
    
}
