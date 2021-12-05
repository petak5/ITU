//
//  Workout.swift
//  ITU
//
//  Created by Peter Urgoš on 04/12/2021.
//

import Foundation

class Workout: Identifiable, Equatable, ObservableObject {
    static func == (lhs: Workout, rhs: Workout) -> Bool {
        lhs.id == rhs.id
    }

    var id: String { name }

    @Published var name: String
    @Published var exercises: [WorkoutExercise]

    convenience init(name: String) {
        self.init(name: name, exercises: [])
    }

    convenience init(name: String, fromExercises exercises: [Exercise]) {
        var temp: [WorkoutExercise] = []

        for e in exercises {
            temp.append(WorkoutExercise(e, 1))
        }

        self.init(name: name, exercises: temp)
    }

    init(name: String, exercises: [WorkoutExercise]) {
        self.name = name
        self.exercises = exercises
    }

    func copy() -> Workout {
        return Workout(name: self.name, exercises: self.exercises)
    }
}
