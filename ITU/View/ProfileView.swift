//
//  ProfileView.swift
//  ITU
//
//  Created by Peter Urgoš on 04/12/2021.
//

import SwiftUI

struct ProfileView: View {
    @State var showSignOutAlert = false

    @Binding var loggedIn: Bool

    var body: some View {
        NavigationView {
            Form {
                HStack {
                    Text("Username"); Spacer(); Text(User.shared.username)
                }

                HStack {
                    Text("Email"); Spacer(); Text(User.shared.email)
                }

                Section {
                    HStack {
                        Text("Height"); Spacer(); Text("\(User.shared.height)")
                    }

                    HStack {
                        Text("Weight"); Spacer(); Text("\(User.shared.weight)")
                    }
                }

                Section {
                    Button("Sign Out") {
                        showSignOutAlert = true
                    }
                    .foregroundColor(.red)
                    .alert(isPresented: $showSignOutAlert) {
                        Alert(
                            title: Text("Do you want to sign out?"),
                            message: nil,
                            primaryButton: .destructive(Text("Sign Out")) {
                                withAnimation(.interactiveSpring()) {
                                    loggedIn = false
                                }
                            },
                            secondaryButton: .cancel()
                        )
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
