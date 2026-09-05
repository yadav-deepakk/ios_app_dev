//
//  LoginView.swift
//  Practice
//
//  Created by Deepak Kumar Yadav on 04/09/26.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(AuthStore.self) private var authStore: AuthStore
    
    @State private var username: String = String()
    @State private var password: String = String()
    
    var body: some View {
        
        ZStack{
            
            VStack {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.vertical, 4)

                Text("Learning swiftui to make ios apps")
                    .font(.subheadline)
                    .fontWeight(.none)
                
                TextField("username", text: $username)
                    .padding()
                    .background(Color(hue: 0,saturation: 0,brightness: 0,opacity: 0.05))
                    .cornerRadius(10)
                
                SecureField("password", text: $password)
                    .padding()
                    .background(Color(hue: 0,saturation: 0,brightness: 0,opacity: 0.05))
                    .cornerRadius(10)
                
                Button(action: {
                    if username.isEmpty { return }
                    if password.isEmpty { return }
                    let user = User(username: username)
                    authStore.setUser(user: user)
                }, label: {
                    Text("Login")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding()
                })
                
            }.padding()
            
        }
        
    }
}

#Preview {
    LoginView()
        .environment(AuthStore())
}
