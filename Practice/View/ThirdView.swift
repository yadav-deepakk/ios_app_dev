//
//  ThirdView.swift
//  Practice
//
//  Created by Deepak Kumar Yadav on 06/09/26.
//

import SwiftUI

struct ThirdView: View {
    
    @Environment(AuthStore.self) private var authStore: AuthStore
    
    var body: some View {
        Text("favorite color is : \(authStore.favouriteColor)")
    }
}

#Preview {
    ThirdView()
        .environment(AuthStore())
}
