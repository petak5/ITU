//
//  User.swift
//  ITU
//
//  Created by Peter Urgoš on 04/12/2021.
//

import Foundation

public struct User {
    var username: String
    var email: String
    var password: String

    var weight: Int
    var height: Int
    var sexIsMale: Bool

    var workout: Workout
    var previousWorkouts: [Workout]
}
