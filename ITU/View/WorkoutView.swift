//
//  WorkoutView.swift
//  ITU
//
//  Created by Peter Urgoš on 04/12/2021.
//

import SwiftUI
import Combine

struct WorkoutView: View {
    @State var templateSelection = 0
    @State var isEditable = false
    @State var showSheet = false

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

                Section("Name") {
                    TextField("Name", text: $user.currentWorkout.name)
                }

                Section("Exercises") {
                    List {
                        ForEach(user.currentWorkout.exercises) { e in
                            HStack {
                                Text(e.exercise.name)
                                Spacer()
                                Text("\(e.count)" + (e.exercise.unit == .Repetitions ? "x" : "m"))
                            }
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
                    Button("Start") {
                        showSheet.toggle()
                    }
                }
                .sheet(isPresented: $showSheet) {
                    WorkoutSessionView(workout: user.currentWorkout, index: 0, isPresented: $showSheet)
                }
                .disabled(user.currentWorkout.exercises.count == 0)
            }
            .navigationTitle("Workout")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if user.currentWorkout.exercises.count > 0 {
                    EditButton()
                }
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
    @State var count = "1"

    @ObservedObject var availableExercises = AvailableExercises.shared

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

            Section {
                HStack {
                    if availableExercises.exercises[selectedExercise].unit == .Repetitions {
                        Text("Repetitions:")
                    } else {
                        Text("Duration (m):")
                    }

                    TextField("", text: $count)
                        .keyboardType(.numberPad)
                        .onReceive(Just(count)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.count = filtered
                            }
                    }
                }
            }

        }
        .toolbar {
            Button("Add") {
                User.shared.currentWorkout.exercises.append(WorkoutExercise(AvailableExercises.shared.exercises[selectedExercise], Int(count) ?? 1))
                User.shared.objectWillChange.send()
                pm.wrappedValue.dismiss()
            }
        }
    }
}

struct WorkoutExerciseDetailView: View {
    var body: some View {
        Text("")
    }
}
