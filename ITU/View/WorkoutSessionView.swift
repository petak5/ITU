//
//  WorkoutSessionView.swift.swift
//  ITU
//
//  Created by Peter Urgoš on 05/12/2021.
//

import SwiftUI

struct WorkoutSessionView: View {
    @ObservedObject var workout: Workout

    @State var index: Int
    @State var showCancelAlert = false
    @State var done = false

    @Binding var isPresented: Bool

    let startDate = Date()

    var body: some View {
        NavigationView {
            VStack {
                if !done {
                    WorkoutSessionExerciseView(workout: workout, index: $index, done: $done)
                        .navigationTitle("\(workout.name) (\(index + 1)/\(workout.exercises.count))")
                        .toolbar {
                            Button("Cancel") {
                                showCancelAlert.toggle()
                            }
                            .alert(isPresented: $showCancelAlert) {
                                Alert(
                                    title: Text("Do you want to cancel active workout?"),
                                    message: nil,
                                    primaryButton: .default(Text("No")),
                                    secondaryButton: .destructive(Text("Yes")) {
                                        isPresented = false
                                    }
                                )
                            }
                        }
                } else {
                    WorkoutSessionDoneView(workout: workout, startDate: startDate, isPresented: $isPresented)
                        .navigationTitle("\(workout.name) (Done)")
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .interactiveDismissDisabled()
    }
}

//struct WorkoutSessionView_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkoutSessionView()
//    }
//}

struct WorkoutSessionExerciseView: View {
    @State var workout: Workout
    @Binding var index: Int
    @Binding var done: Bool

    @State var timerProgress = 0.0
    let timerStart = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        Form {
            Section {
                Text(workout.exercises[index].exercise.name)
                Text(workout.exercises[index].exercise.description)
            }

            if workout.exercises[index].exercise.unit == .Repetitions {
                HStack {
                    Text("Repetitions")
                    Spacer()
                    Text("\(workout.exercises[index].count)x")
                }
            } else {
                Section("Timer") {
                    ProgressView(value: timerProgress, total: 100)
                        .onReceive(timer) { _ in
                            if timerProgress < 100 {
                                timerProgress = 100 * Date().timeIntervalSince(timerStart) / Double(workout.exercises[index].count * 60)
                            }
                        }
                    Button("Pause") {}
                    Button("Stop") {}
                }
            }

            Section {
                Button("Next") {
                    if index == workout.exercises.count - 1 {
                        done = true
                    } else {
                        index += 1
                    }
                }
            }
        }
    }
}

struct WorkoutSessionDoneView: View {
    @State var workout: Workout
    var startDate: Date
    @Binding var isPresented: Bool

    var body: some View {
        Form {
            Section {
                Text("You made it!")
                Text("Total time: \( Int(floor(Date().timeIntervalSince(startDate) / 60)) )m \( Int(Date().timeIntervalSince(startDate)) % 60 )s")
            }

            Section {
                Button("Finish") {
                    User.shared.previousWorkouts.insert(workout.copy(), at: 0)
                    User.shared.objectWillChange.send()
                    isPresented = false
                }
            }
        }
    }
}
