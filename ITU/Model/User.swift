//
//  User.swift
//  ITU
//
//  Created by Peter Urgoš on 04/12/2021.
//

import Foundation

class User: Identifiable, ObservableObject {
    static var shared = User()

//    var id: String { name }

    @Published var username: String
    @Published var email: String
    private var password: String = ""

    @Published var weight: Int
    @Published var height: Int
    @Published var sexIsMale: Bool

    @Published var currentWorkout: Workout = Workout(name: "A workout")
    @Published var previousWorkouts: [Workout] = []

    convenience init() {
        self.init(username: "johndoe", email: "johndoe@mail.com", weight: 175, height: 80, sexIsMale: true)
    }

    init(username: String, email: String, weight: Int, height: Int, sexIsMale: Bool) {
        self.username = username
        self.email = email
        self.weight = weight
        self.height = height
        self.sexIsMale = sexIsMale
    }
}
