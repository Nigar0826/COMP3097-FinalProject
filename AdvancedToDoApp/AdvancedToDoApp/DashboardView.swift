//
//  DashboardView.swift
//  AdvancedToDoApp
//
//  Created by Nigar Ahmadova on 2025-03-03.
//

import SwiftUI

struct DashboardView: View {
    @State private var selectedCategory: String = "All"
    @State private var showTaskCreationView = false // Controls Task Creation Screen
    let categories = ["All", "Completed", "Pending"]

    // Change tasks to a dynamic list
    @State private var tasks: [TaskModel] = [
        TaskModel(title: "Buy groceries", status: "Completed", dueDate: Date(), priority: "Medium", category: "Personal"),
        TaskModel(title: "Finish project report", status: "Pending", dueDate: Date(), priority: "High", category: "Work")
    ]

    var filteredTasks: [TaskModel] {
        if selectedCategory == "All" {
            return tasks
        } else {
            return tasks.filter { $0.status == selectedCategory }
        }
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)

                VStack {
                    // Category Picker
                    Picker("Filter", selection: $selectedCategory) {
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()

                    // Task List
                    List(filteredTasks) { task in
                        NavigationLink(destination: TaskDetailView(task: task)) {
                            HStack {
                                Text(task.title)
                                    .foregroundColor(.white)
                                Spacer()
                                Text(task.status)
                                    .foregroundColor(task.status == "Completed" ? .green : .yellow)
                            }
                        }
                        .listRowBackground(Color.black)
                    }
                    .scrollContentBackground(.hidden)

                    Spacer()

                    // Floating Add Task Button
                    HStack {
                        Spacer()
                        Button(action: {
                            showTaskCreationView = true // Open Task Creation Screen
                        }) {
                            Image(systemName: "plus")
                                .font(.title)
                                .padding()
                                .background(Color.yellow)
                                .clipShape(Circle())
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Task Dashboard")
            .foregroundColor(.white)
            .sheet(isPresented: $showTaskCreationView) { // Show Task Creation Screen
                TaskCreationView(onSave: { newTask in
                    tasks.append(newTask) // Add new task to list
                })
            }
        }
    }
}


