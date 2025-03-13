//
//  The_Advance_ToDo_ApplicationApp.swift
//  The_Advance_ToDo_Application
//
//  Created by Fatemeh (Fatima) Arab on 2025-03-10.
//

import SwiftUI
import RealmSwift

@main
struct The_Advance_ToDo_ApplicationApp: SwiftUI.App {
    //Initialize Realm with Schema Migration
    init(){
        let config = Realm.Configuration(
            schemaVersion: 1,
            migrationBlock:{migration,oldSchemaVersion in
                if oldSchemaVersion < 1 {
                    
                }
        }
        )
        Realm.Configuration.defaultConfiguration = config
        
        do{
            _ = try Realm()
            print("Realm configured successfully!")
        }catch{
            print("Error configuring Realm: \(error)")
        }
    }
    var body: some Scene{
        WindowGroup {
            ContentView()
        }
    }
}
