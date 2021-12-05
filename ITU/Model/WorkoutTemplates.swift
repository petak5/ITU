//
//  ExerciseTemplates.swift
//  ITU
//
//  Created by Peter Urgoš on 04/12/2021.
//

import Foundation

public final class WorkoutTemplates: ObservableObject {
    static let shared = WorkoutTemplates()

    @Published var workouts: [Workout] = []
}
