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

    init(name: String) {
        self.name = name
    }
}
