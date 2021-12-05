//
//  Exercise.swift
//  ITU
//
//  Created by Peter Urgoš on 04/12/2021.
//

import Foundation

class Exercise: Identifiable, ObservableObject {
    var id: String { name }

    @Published var name: String
    @Published var description: String

    convenience init(name: String) {
        self.init(name: name, description: "Description of " + name)
    }

    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
}
