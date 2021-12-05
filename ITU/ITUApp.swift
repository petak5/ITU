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

    func createDummyData() {
        
        let exercises = [
            Exercise(name: "Bench press"),
            Exercise(name: "Pull up"),
            Exercise(name: "Push up"),
            Exercise(name: "Squat"),
            Exercise(name: "Stretch"),
            Exercise(name: "Swimming"),
            Exercise(name: "Roll"),
            Exercise(name: "Jump"),
            Exercise(name: "Plank"),
            Exercise(name: "Dead lift"),
            Exercise(name: "Campus board"),
            Exercise(name: "Cycling"),
            Exercise(name: "Climbing"),
            Exercise(name: "Running")
        ]
        AvailableExercises.shared.exercises.append(contentsOf: exercises)

        let workouts = [
            Workout(name: "Leg day", exercises: [exercises[0], exercises[2], exercises[5]]),
            Workout(name: "Cardio", exercises: [exercises[4], exercises[5], exercises[7]])
        ]
        WorkoutTemplates.shared.workouts.append(contentsOf: workouts)
        WorkoutTemplates.shared.objectWillChange.send()

        User.shared.previousWorkouts = [
            Workout(name: "Cardio", exercises: [exercises[4], exercises[5], exercises[7], exercises[3]]),
            Workout(name: "Running", exercises: [exercises[1], exercises[2], exercises[3], exercises[1]])
        ]
    }
}
