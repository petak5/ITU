//
//  ExerciseView.swift
//  ITU
//
//  Created by Peter Urgoš on 04/12/2021.
//

import SwiftUI
import Combine

struct ExerciseView: View {
    @ObservedObject var availableExercises = AvailableExercises.shared

    var body: some View {
        NavigationView {
            Form {
                Section("Available Exercises") {
                    List {
                        ForEach(availableExercises.exercises) { e in
                            NavigationLink(e.name, destination: ExerciseDetailView(exercise: e))
                        }
                        .onDelete { indexSet in
                            for i in indexSet.makeIterator().reversed() {
                                availableExercises.exercises.remove(at: i)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Exercises")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink(destination: ExerciseAddView()) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView()
    }
}

struct ExerciseAddView: View {
    @State var name = ""
    @State var description = ""
    @State var selectedUnit = Unit.Repetitions
    @State var count = "1"
    @State var showNameAlreadyTakenAlert = false

    @Environment(\.presentationMode) var pm

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
            }

            Section("Unit") {
                Picker("Unit", selection: $selectedUnit) {
                    ForEach(Unit.allCases) { u in
                        Text(u.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }

            Button("Add") {
                if (AvailableExercises.shared.exercises.contains(where: { e in e.name == name })) {
                    showNameAlreadyTakenAlert = true
                } else {
                    AvailableExercises.shared.exercises.append(Exercise(name: name, description: description, unit: selectedUnit))
                    pm.wrappedValue.dismiss()
                }
            }
            .alert(isPresented: $showNameAlreadyTakenAlert) {
                Alert(
                    title: Text("Exercise already exists"),
                    message: Text("Exercise named \(name) already exists, please pick a different name."),
                    dismissButton: .default(Text("Ok")) {
                        showNameAlreadyTakenAlert = false
                    }
                )
            }
        }
    }
}

struct ExerciseDetailView: View {
    @ObservedObject var exercise: Exercise

    var body: some View {
        Form {
            Section("Exercise details") {
                HStack {
                    Text("Name: ")
                    TextField("Name", text: $exercise.name)
                        .onDisappear {
                            AvailableExercises.shared.objectWillChange.send()
                        }
                }
                HStack {
                    Text("Description: ")
                    TextField("Description", text: $exercise.description)
                        .onDisappear {
                            AvailableExercises.shared.objectWillChange.send()
                        }
                }
            }

            Section("Unit") {
                Picker("Unit", selection: $exercise.unit) {
                    ForEach(Unit.allCases) { u in
                        Text(u.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }
        }
    }
}
