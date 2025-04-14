//
//  PersistenceController.swift
//  AdvancedToDoApp


import CoreData

// A singleton class that manages the Core Data stack.
// Initializes and configures the NSPersistentContainer used for storing tasks
struct PersistenceController {
    // Shared Instance
    static let shared = PersistenceController()

    // Core Data Container
    let container: NSPersistentContainer

    // Initializes the persistent container with the specified data model.
    // Parameter inMemory
    init(inMemory: Bool = false) {
        // Create persistent container
        container = NSPersistentContainer(name: "TaskModel") // <-- match .xcdatamodeld filename

        // If using in-memory store override URL
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        // Load persistent stores
        container.loadPersistentStores { description, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }

        // Automatically merge changes from parent contexts 
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}

