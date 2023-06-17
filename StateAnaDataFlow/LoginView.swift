//
//  LoginView.swift
//  StateAnaDataFlow
//
//  Created by Alexey Efimov on 14.06.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var name = ""
    @State private var charCount = 0
    @EnvironmentObject private var user: UserSettings
    
    var body: some View {
        VStack {
            TextField("Enter your name...", text: $name)
                .multilineTextAlignment(.center)
                .onChange(of: name) { newValue in
                    charCount = newValue.count
                }
            Button(action: login) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                    Text("\(charCount)")
                        .foregroundColor(textColor)
                }
            }
        }
    }
    
    private func login() {
        if !name.isEmpty {
            user.name = name
            user.isLoggedIn.toggle()
        }
    }
    
    private var textColor: Color {
            return charCount >= 3 ? .green : .red
        }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
