//
//  WorkoutExercise.swift
//  ITU
//
//  Created by Peter Urgoš on 05/12/2021.
//

import Foundation

class WorkoutExercise: Identifiable, ObservableObject {
    @Published var exercise: Exercise
    @Published var count: Int

    init(_ exercise: Exercise, _ count: Int) {
        self.exercise = exercise
        self.count = count
    }
}
