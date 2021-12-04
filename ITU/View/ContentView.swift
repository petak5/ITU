//
//  ContentView.swift
//  ITU
//
//  Created by Peter Urgoš on 04/12/2021.
//

import SwiftUI

struct ContentView: View {
    @State var loggedIn = true
    @State var showLogin = true

    var body: some View {
        if loggedIn {
            MainView(loggedIn: $loggedIn)
        } else {
            if showLogin {
                LoginView(loggedIn: $loggedIn, showLogin: $showLogin)
            } else {
                RegisterView(loggedIn: $loggedIn, showLogin: $showLogin)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
