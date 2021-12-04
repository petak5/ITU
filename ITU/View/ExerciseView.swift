//
//  ExerciseView.swift
//  ITU
//
//  Created by Peter Urgoš on 04/12/2021.
//

import SwiftUI

struct ExerciseView: View {
    var body: some View {
        NavigationView {
            Form {
                Section("Available Exercises") {
                    List {
                        ForEach((1...10), id:\.self) { i in
                            HStack {
                                Button(action: {}) {
//                                    Label("Exercise \(i)", systemImage: "chevron.right")
                                    HStack {
                                        Text("Exercise \(i)")
                                            .foregroundColor(.black)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.blue)
                                    }
                                }
                            }
                        }
                        .onDelete { indexSet in
                            // TODO
                        }
                    }
                }
            }
            .navigationTitle("Exercises")
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

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView()
    }
}
