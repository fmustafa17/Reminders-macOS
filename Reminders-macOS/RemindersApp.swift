//
//  RemindersApp.swift
//  Reminders
//
//  Created by Farhana Mustafa on 4/17/24.
//

import SwiftUI

@main
struct RemindersApp: App {
    var body: some Scene {
        WindowGroup {
            let viewContext = CoreDataManager.shared.persistentContainer.viewContext // Inject as a global environment value to ensure child views are able to access
            HomeScreen().environment(\.managedObjectContext, viewContext)
        }
    }
}
