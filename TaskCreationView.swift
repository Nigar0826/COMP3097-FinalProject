//
//  TaskCreationView.swift
//  AdvancedToDoApp
//
//  Created by Luilson Sousa on 2025-03-03.
//

import SwiftUI

struct TaskCreationView: View {
    @State private var title: String = ""
    @State private var selectedCategory: String = "Work"
    @State private var dueDate: Date = Date()
    @State private var priority: String = "Medium"
    @Environment(\.presentationMode) var presentationMode // To dismiss view

    let categories = ["Work", "Personal", "Health", "Others"]
    let priorities = ["Low", "Medium", "High"]

    var onSave: (TaskModel) -> Void // Callback to send task back

    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)

                VStack(spacing: 20) {
                    // Task Title Input
                    TextField("Enter Task Title", text: $title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                        .foregroundColor(.white)

                    // Category Picker
                    VStack(alignment: .leading) {
                        Text("Category")
                            .foregroundColor(.yellow)
                        Picker("Category", selection: $selectedCategory) {
                            ForEach(categories, id: \.self) { category in
                                Text(category)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)

                    // Due Date Picker
                    VStack(alignment: .leading) {
                        Text("Due Date")
                            .foregroundColor(.yellow)
                        DatePicker("Select Date", selection: $dueDate, displayedComponents: .date)
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)

                    // Priority Picker
                    VStack(alignment: .leading) {
                        Text("Priority")
                            .foregroundColor(.yellow)
                        Picker("Priority", selection: $priority) {
                            ForEach(priorities, id: \.self) { priority in
                                Text(priority)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    .padding()

                    // Save Task Button
                    Button(action: saveTask) {
                        Text("Save Task")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .font(.headline)
                    }
                    .padding(.horizontal)

                    Spacer()
                }
                .padding()
            }
            .navigationTitle("New Task")
            .foregroundColor(.white)
        }
    }

    // MARK: - Save Task Functionality
    func saveTask() {
        let newTask = TaskModel(
            title: title,
            status: "Pending",
            dueDate: dueDate,
            priority: priority,
            category: selectedCategory
        )
        onSave(newTask) // Send task back to Dashboard
        presentationMode.wrappedValue.dismiss() // Dismiss after saving
    }
}

// Preview
struct TaskCreationView_Previews: PreviewProvider {
    static var previews: some View {
        TaskCreationView(onSave: { _ in })
    }
}


