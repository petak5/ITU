//
//  HistoryView.swift
//  ITU
//
//  Created by Peter Urgoš on 04/12/2021.
//

import SwiftUI

struct HistoryView: View {
    @ObservedObject var user = User.shared

    @Binding var selectedTab: Int

    var body: some View {
        NavigationView {
            Form {
                Section("Previous Workouts") {
                    List {
                        ForEach(user.previousWorkouts) { w in
                            NavigationLink(destination: HistoryWorkoutDetailView(workout: w, selectedTab: $selectedTab)) {
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

//struct HistoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryView()
//    }
//}

struct HistoryWorkoutDetailView: View {
    @State var workout: Workout
    @State var showSheet = false

    @Binding var selectedTab: Int

    var body: some View {
        Form {
            Section("Name") {
                Text(workout.name)
            }
            
            Section("Exercises") {
                List(workout.exercises) { e in
                    HStack {
                        HStack {
                            Text(e.exercise.name)
                            Spacer()
                            Text("\(e.count)" + (e.exercise.unit == .Repetitions ? "x" : "m"))
                        }
                    }
                }
            }

            Button("Use as template") {
                User.shared.currentWorkout = workout.copy()
                withAnimation(.interactiveSpring()) {
                    selectedTab = 2
                }
            }

            Section {
                Button("Start workout") {
                    showSheet.toggle()
                }
            }
            .sheet(isPresented: $showSheet) {
                WorkoutSessionView(workout: workout, index: 0, isPresented: $showSheet)
            }
            .disabled(workout.exercises.count == 0)
        }
    }
}
