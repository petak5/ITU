//
//  Exercise.swift
//  ITU
//
//  Created by Peter Urgoš on 04/12/2021.
//

import Foundation

class Exercise: Identifiable, ObservableObject {
    static let units = ["Repetitions", "Time"]

    var id: String { name }

    @Published var name: String
    @Published var description: String
    @Published var unit: Unit

    convenience init(name: String) {
        self.init(name: name, description: "Description of " + name, unit: .Repetitions)
    }

    init(name: String, description: String, unit: Unit) {
        self.name = name
        self.description = description
        self.unit = unit
    }
}

public enum Unit: String, CaseIterable, Identifiable {
    case Repetitions
    case Time

    public var id: Unit { self }
}
