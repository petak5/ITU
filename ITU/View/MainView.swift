//
//  MainView.swift
//  ITU
//
//  Created by Peter Urgoš on 04/12/2021.
//

import SwiftUI

struct MainView: View {
    @Binding var loggedIn: Bool

    var body: some View {
        TabView {

            // MARK: - History
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "clock")
                }

            // MARK: - Exercises
            ExerciseView()
                .tabItem {
                    Label("Exercises", systemImage: "list.bullet")
                }

            // MARK: - Workout
            WorkoutView()
                .tabItem {
                    Label("Workout", systemImage: "hare")
                }

            // MARK: - Schedule
            ScheduleView()
                .tabItem {
                    Label("Schedule", systemImage: "calendar")
                }

            // MARK: - Profile
            ProfileView(loggedIn: $loggedIn)
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
