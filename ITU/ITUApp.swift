//
//  ITUApp.swift
//  ITU
//
//  Created by Peter Urgoš on 04/12/2021.
//

import SwiftUI

@main
struct ITUApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear() {
                    DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) {
                        DispatchQueue.main.async {
                            createDummyData()
                        }
                    }
//                    createDummyData()
                }
        }
    }

    // MARK: - Dummy data
    func createDummyData() {
        let exercises = [
            Exercise(name: "Pause", description: "Take a break", unit: .Time),
            Exercise(name: "Stretch", description: "Stretch your muscles", unit: .Time),
            Exercise(name: "Pull up", description: "Pull up on pull up bar", unit: .Repetitions),
            Exercise(name: "Push up", description: "Do a push up", unit: .Repetitions),
            Exercise(name: "Plank", description: "Do a plank with your hands straight", unit: .Time),
            Exercise(name: "Dead lift", description: "Do a dead lift", unit: .Repetitions),
            Exercise(name: "Running", description: "Run for given ammount of time", unit: .Time),
            Exercise(name: "Cycling", description: "Ride a bike for given ammount of time", unit: .Time)
        ]
        AvailableExercises.shared.exercises.append(contentsOf: exercises)

        let workouts = [
            Workout(name: "Legs day", fromExercises: [exercises[1], exercises[6], exercises[0], exercises[5], exercises[0], exercises[5]]),
            Workout(name: "Cardio", fromExercises: [exercises[1], exercises[7], exercises[0], exercises[6]])
        ]
        WorkoutTemplates.shared.workouts.append(contentsOf: workouts)
        WorkoutTemplates.shared.objectWillChange.send()

        User.shared.previousWorkouts = [
            Workout(name: "Cardio", fromExercises: [exercises[1], exercises[7], exercises[0], exercises[6]]),
            Workout(name: "Legs day", fromExercises: [exercises[4], exercises[5], exercises[7], exercises[3]]),
            Workout(name: "Running", fromExercises: [exercises[1], exercises[2], exercises[3], exercises[1]])
        ]
    }
}
