//
//  DashboardView.swift
//  AdvancedToDoApp


import SwiftUI

// Dashboard screen for displaying and managing all user tasks.
// Tasks are shown in a list, with toggle for filtering by completion status.
// Tasks can be deleted or tapped to view/edit in TaskDetailView.
// Includes a button to add new tasks.
struct DashboardView: View {
    // Core Data Context
    @Environment(\.managedObjectContext) private var viewContext

    // Fetch all tasks sorted by due date
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TaskEntity.dueDate, ascending: true)],
        animation: .default
    )
    private var tasks: FetchedResults<TaskEntity>

    // State Variables
    @State private var showCompletedOnly = false
    @State private var showAddTask = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack {
                    // Completion Filter Toggle
                    HStack {
                        Text("Show Completed Only")
                            .foregroundColor(.white)
                            .font(.headline)

                        Spacer()

                        Toggle("", isOn: $showCompletedOnly)
                            .toggleStyle(SwitchToggleStyle(tint: .yellow))
                            .labelsHidden()
                            .background(Color.white)
                            .clipShape(Capsule())
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)

                    // Task List
                    List {
                        if filteredTasks.isEmpty {
                            Text("No tasks found.")
                                .foregroundColor(.gray)
                                .italic()
                                .listRowBackground(Color.black)
                        } else {
                            // List of filtered tasks
                            ForEach(filteredTasks) { task in
                                NavigationLink(destination: TaskDetailView(task: task)) {
                                    VStack(alignment: .leading, spacing: 6) {
                                        // Title
                                        Text(task.title ?? "Untitled Task")
                                            .font(.headline)
                                            .foregroundColor(.white)

                                        // Due date
                                        Text("Due: \(formattedDate(task.dueDate))")
                                            .font(.subheadline)
                                            .foregroundColor(.white.opacity(0.8))

                                        // Priority and type
                                        HStack {
                                            Text("Priority: \(task.priority ?? "-")")
                                            Spacer()
                                            Text(task.taskType ?? "-")
                                        }
                                        .font(.caption)
                                        .foregroundColor(.gray)

                                        // Status indicators
                                        HStack {
                                            Text(task.isCompleted ? "✓ Completed" : "• Incomplete")
                                                .font(.caption)
                                                .foregroundColor(task.isCompleted ? .green : .red)

                                            Spacer()

                                            if isOverdue(task.dueDate) {
                                                Text("Overdue")
                                                    .font(.caption)
                                                    .foregroundColor(.red)
                                                    .bold()
                                            } else if isDueSoon(task.dueDate) {
                                                Text("Due Soon")
                                                    .font(.caption)
                                                    .foregroundColor(.orange)
                                                    .bold()
                                            }
                                        }
                                    }
                                    .padding(.vertical, 4)
                                }
                                .listRowBackground(Color.black)
                            }
                            .onDelete(perform: deleteTasks)  // Swipe to delete
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color.black)

                    // Add Task Button
                    Button(action: { showAddTask = true }) {
                        Label("Add Task", systemImage: "plus")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.yellow)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .font(.headline)
                            .padding()
                    }
                }
            }
            .navigationTitle("Tasks")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.black, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            // Present task creation sheet
            .sheet(isPresented: $showAddTask) {
                TaskCreationView()
                    .environment(\.managedObjectContext, viewContext)
            }
        }
    }

    // Task Filtering
    var filteredTasks: [TaskEntity] {
        showCompletedOnly ? tasks.filter { $0.isCompleted } : Array(tasks)
    }

    // Task Deletion
    func deleteTasks(offsets: IndexSet) {
        withAnimation {
            offsets.map { filteredTasks[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                print("Failed to delete task: \(error.localizedDescription)")
            }
        }
    }

    // Task Deletion
    func formattedDate(_ date: Date?) -> String {
        guard let date = date else { return "-" }
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }

    // Overdue Checker
    func isOverdue(_ date: Date?) -> Bool {
        guard let due = date else { return false }
        return due < Date()
    }

    // Due Soon Checker (next 24 hours)
    func isDueSoon(_ date: Date?) -> Bool {
        guard let due = date else { return false }
        let now = Date()
        let oneDayAhead = Calendar.current.date(byAdding: .hour, value: 24, to: now)!
        return due >= now && due <= oneDayAhead
    }
}

// Custom toggle style for ON = yellow, OFF = white background
struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            RoundedRectangle(cornerRadius: 20)
                .fill(configuration.isOn ? Color.yellow : Color.white)
                .frame(width: 50, height: 30)
                .overlay(
                    Circle()
                        .fill(Color.white)
                        .frame(width: 26, height: 26)
                        .offset(x: configuration.isOn ? 10 : -10)
                        .animation(.easeInOut(duration: 0.2), value: configuration.isOn)
                )
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}
