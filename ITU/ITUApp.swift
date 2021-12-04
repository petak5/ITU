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
    }
}
