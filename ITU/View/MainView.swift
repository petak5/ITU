//
//  MainView.swift
//  ITU
//
//  Created by Peter Urgoš on 04/12/2021.
//

import SwiftUI

struct MainView: View {
    @State var selection = 2

    @Binding var loggedIn: Bool

    var body: some View {
        TabView(selection: $selection) {

            // MARK: - History
            HistoryView(selectedTab: $selection)
                .tabItem {
                    Label("History", systemImage: "clock")
                }
                .tag(0)

            // MARK: - Exercises
            ExerciseView()
                .tabItem {
                    Label("Exercises", systemImage: "list.bullet")
                }
                .tag(1)

            // MARK: - Workout
            WorkoutView()
                .tabItem {
                    Label("Workout", systemImage: "hare")
                }
                .tag(2)

//            // MARK: - Schedule
//            ScheduleView()
//                .tabItem {
//                    Label("Schedule", systemImage: "calendar")
//                }
//                .tag(3)

            // MARK: - Profile
            ProfileView(loggedIn: $loggedIn)
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
                .tag(4)
        }
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
