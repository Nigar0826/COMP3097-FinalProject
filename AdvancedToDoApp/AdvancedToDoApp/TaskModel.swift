//
//  TaskModel.swift
//  AdvancedToDoApp
//
//  Created by Nigar Ahmadova on 2025-03-05.
//

import Foundation // Fixes UUID and Date issues

struct TaskModel: Identifiable {
    let id = UUID() // UUID is now recognized
    let title: String
    let status: String
    let dueDate: Date // Date is now recognized
    let priority: String
    let category: String
    var description: String? // Optional to avoid errors
}


