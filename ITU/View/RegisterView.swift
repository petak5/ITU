//
//  RegisterView.swift
//  ITU
//
//  Created by Peter Urgoš on 04/12/2021.
//

import SwiftUI

struct RegisterView: View {
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""

    @Binding var loggedIn: Bool
    @Binding var showLogin: Bool

    var body: some View {
        VStack(spacing: 10) {
            Spacer()

            Text("Register")
                .font(.title)
                .bold()

            Text("A nice slogan")
                .font(.subheadline)
                .padding(.bottom, 20)

            TextField("Username", text: $username)
                .textFieldStyle(.roundedBorder)

            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            Button("Register") {
                withAnimation(.interactiveSpring()) {
                    loggedIn = true
                }
            }.padding()

            HStack {
                Text("Have an account?")
                Button("Login") {
                    withAnimation(.interactiveSpring()) {
                        showLogin = true
                    }
                }
            }

            Spacer()
        }.padding()
    }
}

//struct RegisterView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterView()
//    }
//}
