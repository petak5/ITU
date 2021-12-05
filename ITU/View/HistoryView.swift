//
//  HistoryView.swift
//  ITU
//
//  Created by Peter Urgoš on 04/12/2021.
//

import SwiftUI

struct HistoryView: View {
    @ObservedObject var user = User.shared

    var body: some View {
        NavigationView {
            Form {
                Section("Previous Workouts") {
                    List {
                        ForEach(user.previousWorkouts) { w in
                            NavigationLink(destination: HistoryWorkoutDetailView(workout: w)) {
                                Text(w.name)
                            }
                        }
                        .onDelete { indexSet in
                            for i in indexSet.makeIterator().reversed() {
                                user.previousWorkouts.remove(at: i)
                            }
                        }
                    }
                }
            }
            .navigationTitle("History")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}

struct HistoryWorkoutDetailView: View {
    @State var workout: Workout

    var body: some View {
        Form {
            Section {
                Text("Gone, reduced to atoms.")
            }

            HStack {
                Button("Use as template") {
                    User.shared.currentWorkout = workout.copy()
                }
                Spacer()
                Image(systemName: "chevron.right")
            }
            .padding(.top, 6)
            .padding(.bottom, 6)

            NavigationLink(destination: WorkoutSessionView()) {
                Button("Start workout") {
                    
                }
            }
        }
    }
}
