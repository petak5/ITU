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
    @Published var exercises: [Exercise]

    convenience init(name: String) {
        self.init(name: name, exercises: [])
    }

    init(name: String, exercises: [Exercise]) {
        self.name = name
        self.exercises = exercises
    }

    func copy() -> Workout {
        return Workout(name: self.name, exercises: self.exercises)
    }
}
