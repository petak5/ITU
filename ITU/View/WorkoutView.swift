//
//  WorkoutView.swift
//  ITU
//
//  Created by Peter Urgoš on 04/12/2021.
//

import SwiftUI

struct WorkoutView: View {
    @State var templateSelection = 0
    @State var isEditable = false

    @ObservedObject var workoutTemplates = WorkoutTemplates.shared
    @ObservedObject var user = User.shared

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker(selection: $templateSelection, label: Text("Template")) {
                        Text("None").tag(0)
                        ForEach(workoutTemplates.workouts) { w in
                            Text(w.name).tag((workoutTemplates.workouts.firstIndex(of: w) ?? -1) + 1)
                        }
                        .onChange(of: templateSelection) { tag in
                            user.currentWorkout = workoutTemplates.workouts[templateSelection - 1].copy()
                        }
                    }
                }

                Section("Exercises") {
                    List {
                        ForEach(user.currentWorkout.exercises) { e in
                            Text(e.name)
                        }
                        .onDelete { indexSet in
                            for i in indexSet.makeIterator().reversed() {
                                user.currentWorkout.exercises.remove(at: i)
                                user.objectWillChange.send()
                            }
                        }
                        .onMove(perform: move)

                        NavigationLink(destination: WorkoutExerciseAddView()) {
                            Button("Add", action: {})
                        }
                    }
                }

                Section {
                    Button("Start", action: {})
                }
            }
            .navigationTitle("Workout")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                EditButton()
            }
        }
    }

    func move(from source: IndexSet, to destination: Int) {
        user.currentWorkout.exercises.move(fromOffsets: source, toOffset: destination)
        user.objectWillChange.send()
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}

struct WorkoutExerciseAddView: View {
    @State var selectedExercise = 0

    @Environment(\.presentationMode) var pm

    var body: some View {
        Form {
            Section {
                Picker("Exercise", selection: $selectedExercise) {
                    ForEach(0..<AvailableExercises.shared.exercises.count) { i in
                        Text(AvailableExercises.shared.exercises[i].name).tag(i)
                    }
                }
                .pickerStyle(.wheel)
            }

        }
        .toolbar {
            Button("Add") {
                User.shared.currentWorkout.exercises.append(AvailableExercises.shared.exercises[selectedExercise])
                User.shared.objectWillChange.send()
                pm.wrappedValue.dismiss()
            }
        }
    }
}
