//
//  Task.swift
//  The_Advance_ToDo_Application
//
//  Created by Fatemeh (Fatima) Arab on 2025-03-10
import RealmSwift
import Foundation

class Task:Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String = ""
    @Persisted var category: String = ""
    @Persisted var priority: String = ""
    @Persisted var dueDate: Date?
    @Persisted var status: String = "Pending" // Default status
    
    override static func primaryKey() -> String? {
       return "id"   
    }
}
