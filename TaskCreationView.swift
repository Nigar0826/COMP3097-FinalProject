//
//  TaskCreationView.swift
//  AdvancedToDoApp
//


import SwiftUI

// TaskCreationView allows users to add a new task with title, description, due date,
// priority, type, and completion status. Data is saved to Core Data.
struct TaskCreationView: View {
    // Environment
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss

    // Task Form Fields
    @State private var title = ""
    @State private var descriptionText = ""
    @State private var dueDate = Date()
    @State private var priority = "Medium"
    @State private var taskType = "Personal"
    @State private var isCompleted = false

    // Static Options
    let priorities = ["Low", "Medium", "High"]
    let taskTypes = ["Personal", "Work", "Study"]

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                    .edgesIgnoringSafeArea(.top)

                VStack(alignment: .leading, spacing: 20) {
                    // Title
                    Text("Add New Task")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top)

                    // Title & Description Inputs
                    Group {
                        TextField("Title", text: $title)
                        TextField("Description", text: $descriptionText)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)

                    // Due Date Picker
                    DatePicker("Due Date", selection: $dueDate, displayedComponents: [.date, .hourAndMinute])
                        .colorScheme(.dark)
                        .foregroundColor(.white)

                    // Priority Picker
                    Picker("Priority", selection: $priority) {
                        ForEach(priorities, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                    .foregroundColor(.white)

                    // Task Type Picker
                    Picker("Task Type", selection: $taskType) {
                        ForEach(taskTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                    .foregroundColor(.white)

                    // Completion Toggle
                    HStack {
                        Text("Completed")
                            .foregroundColor(.white)
                            .font(.headline)

                        Spacer()

                        Toggle("", isOn: $isCompleted)
                            .toggleStyle(SwitchToggleStyle(tint: Color.yellow))
                            .labelsHidden()
                            .background(Color.white)
                            .clipShape(Capsule())
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)

                    // Save Task Button
                    Button(action: saveTask) {
                        Text("Save Task")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.yellow)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .font(.headline)
                    }

                    Spacer()
                }
                .padding()
            }
            // Custom Back Button
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                    .foregroundColor(.yellow)
                }
            }
        }
    }

    // Save Task to Core Data
    func saveTask() {
        let newTask = TaskEntity(context: viewContext)
        newTask.title = title
        newTask.descriptionText = descriptionText
        newTask.dueDate = dueDate
        newTask.priority = priority
        newTask.taskType = taskType
        newTask.isCompleted = isCompleted

        do {
            try viewContext.save()
            dismiss()  // Dismiss view after saving
        } catch {
            print("Failed to save task: \(error.localizedDescription)")
        }
    }
}
