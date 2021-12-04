//
//  ExerciseView.swift
//  ITU
//
//  Created by Peter Urgoš on 04/12/2021.
//

import SwiftUI

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
                            for i in indexSet.makeIterator() {
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

    @Environment(\.presentationMode) var pm

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $name)
            }

            Button("Add") {
                AvailableExercises.shared.exercises.append(Exercise(name: name))

                pm.wrappedValue.dismiss()
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
            }
        }
    }
}
