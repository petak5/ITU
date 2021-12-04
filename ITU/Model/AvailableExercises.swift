//
//  AvailableExercises.swift
//  ITU
//
//  Created by Peter Urgoš on 04/12/2021.
//

import Foundation

public final class AvailableExercises: ObservableObject {
    static let shared = AvailableExercises()

    @Published var exercises: [Exercise] = []
}
