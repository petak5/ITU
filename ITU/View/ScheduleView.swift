//
//  ScheduleView.swift
//  ITU
//
//  Created by Peter Urgoš on 04/12/2021.
//

import SwiftUI

struct ScheduleView: View {
    var body: some View {
        NavigationView {
            Form {
                Section("Scheduled Workouts") {
                    List {
                        ForEach((1...10), id:\.self) { i in
                            HStack {
                                Button(action: {}) {
//                                    Label("Exercise \(i)", systemImage: "chevron.right")
                                    HStack {
                                        Text("Workout on day \(i)")
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
            .navigationTitle("Schedule")
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

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
