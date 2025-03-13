//
//  ContentView.swift
//  The_Advance_ToDo_Application
//
//  Created by Fatemeh (Fatima) Arab on 2025-03-10.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @ObservedResults(Task.self) var tasks // to fetch all tasks from Realm
    
    var body: some View {
        VStack {
            Button ("Add Task"){
                saveTaskToDatabase()
            }
            
            List{
                ForEach(tasks){task in
                    VStack(alignment: .leading){
                        Text(task.title).font(.headline)
                        Text("Category: \(task.category)").font(.subheadline)
                        Text("Priority: \(task.priority)").font(.subheadline)
                        Text("Status: \(task.status)").font(.subheadline)
                    }
                    .padding(5)
                }
            }
        }
    
    }
    
    // save task to Realm
    func saveTaskToDatabase(){
        let newTask = Task()
        newTask.title = "Buy Groceries"
        newTask.category = "Personal"
        newTask.priority = "Medium"
        newTask.dueDate = Calendar.current.date(byAdding: .day, value: 2, to: Date())
        newTask.status = "Not Started"
        
        do{
            let realm = try Realm()
            try realm.write{
                realm.add(newTask)
            }
            print("Task saved: \(newTask.title)")
        }catch{
            print("Error saving task: \(error)")
        }
    }
}

#Preview {
    ContentView()
}
