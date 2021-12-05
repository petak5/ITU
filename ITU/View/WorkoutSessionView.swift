//
//  WorkoutSessionView.swift.swift
//  ITU
//
//  Created by Peter Urgoš on 05/12/2021.
//

import SwiftUI

struct WorkoutSessionView: View {
    @ObservedObject var workout: Workout

    @State var index: Int
    @State var showCancelAlert = false

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            Form {
                Text("Working out really hard... \(index)/\(workout.exercises.count - 1)")
                Button("Next") {
                    index += 1
                }
            }
            .toolbar {
                if workout.exercises.count - 1 == index {
                    Button("Finish") {
                        User.shared.previousWorkouts.insert(workout.copy(), at: 0)
                        User.shared.objectWillChange.send()
                        dismiss()
                    }
                } else {
                    Button("Cancel") {
                        showCancelAlert.toggle()
                    }
                    .alert(isPresented: $showCancelAlert) {
                        Alert(
                            title: Text("Do you want to cancel active workout?"),
                            message: nil,
                            primaryButton: .default(Text("No")),
                            secondaryButton: .destructive(Text("Yes")) {
                                dismiss()
                            }
                        )
                    }
                }
            }
        }
        .interactiveDismissDisabled()
    }
}

//struct WorkoutSessionView_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkoutSessionView()
//    }
//}
