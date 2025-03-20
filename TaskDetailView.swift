//
//  TaskDetailView.swift
//  AdvancedToDoApp
//
//  Created by Nigar Ahmadova on 2025-03-03.
//

import SwiftUI

struct TaskDetailView: View {
    var task: TaskModel  // Accepts TaskModel object

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // Background color

            VStack(spacing: 20) {
                // Task Title
                Text(task.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)
                    .padding()

                // Task Status
                Text("Status: \(task.status)")
                    .font(.title2)
                    .foregroundColor(task.status == "Completed" ? .green : .red)

                // Task Description (only if available)
                if let description = task.description {
                    Text(description)
                        .font(.body)
                        .foregroundColor(.white)
                        .padding()
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Task Details")
        .navigationBarTitleDisplayMode(.inline) // Makes title smaller
    }
}

// Preview
struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(task: TaskModel(
            title: "Finish UI",
            status: "In Progress",
            dueDate: Date(),
            priority: "High",
            category: "Work",
            description: "Complete the UI implementation for task management."
        ))
    }
}
