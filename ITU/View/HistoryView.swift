//
//  HistoryView.swift
//  ITU
//
//  Created by Peter Urgoš on 04/12/2021.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        NavigationView {
            Form {
                Section("Previous Workouts") {
                    List {
                        ForEach((1...15), id:\.self) { i in
                            HStack {
                                Text("Workout \(i)")
                                Spacer()
                                Button(action: {}) {
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                        .onDelete { indexSet in
                            // TODO
                        }
                    }
                }
            }
            .navigationTitle("History")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
