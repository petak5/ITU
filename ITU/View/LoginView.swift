//
//  LoginView.swift
//  ITU
//
//  Created by Peter Urgoš on 04/12/2021.
//

import SwiftUI

struct LoginView: View {
    @State var username = ""
    @State var password = ""
    @State var showIncorrectLoginAlert = false

    @Binding var loggedIn: Bool
    @Binding var showLogin: Bool

    var body: some View {
        VStack(spacing: 10) {
            Spacer()

            Text("Login")
                .font(.title)
                .bold()

            Text("A nice slogan")
                .font(.subheadline)
                .padding(.bottom, 20)

            TextField("Username", text: $username)
                .textFieldStyle(.roundedBorder)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            Button("Login") {
                if password == "heslo" {
                    withAnimation(.interactiveSpring()) {
                        loggedIn = true
                    }
                } else {
                    showIncorrectLoginAlert = true
                }
            }
            .padding()
            .alert(isPresented: $showIncorrectLoginAlert) {
                Alert (
                    title: Text("Incorrect login"),
                    message: nil,
                    dismissButton: .default(Text("Ok")) {
                        showIncorrectLoginAlert = false
                    }
                )
            }

            HStack {
                Text("Don't have an account?")
                Button("Register") {
                    withAnimation(.interactiveSpring()) {
                        showLogin = false
                    }
                }
            }

            Spacer()
        }.padding()
    }
}


//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
