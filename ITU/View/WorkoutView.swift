//
//  WorkoutView.swift
//  ITU
//
//  Created by Peter Urgoš on 04/12/2021.
//

import SwiftUI

struct WorkoutView: View {
    var body: some View {
        NavigationView {
            Form {
                Section("Exercises") {
                    List {
                        ForEach((1...2), id:\.self) {
                            Text("Exercise \($0)")
                        }
                        .onDelete { indexSet in
                            // TODO
                        }
                    }
                }

                Section {
                    Button("Start", action: {})
                }
            }
            .navigationTitle("Workout")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                        .foregroundColor(.blue)
                }
            }
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
