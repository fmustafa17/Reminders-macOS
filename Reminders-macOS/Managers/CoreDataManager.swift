//
//  CoreDataManager.swift
//  Reminders
//
//  Created by Farhana Mustafa on 4/17/24.
//

import CoreData
import Foundation

/// Set up the core data stack and and be able to access the view context
class CoreDataManager {
    var persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    /// Private because you should not be able to create an instance
    private init() {
        ValueTransformer.setValueTransformer(
            NSColorTransformer(),
            forName: NSValueTransformerName( "NSColorTransformer")
        )
        
        persistentContainer = NSPersistentContainer(name: "RemindersModel")
        persistentContainer.loadPersistentStores(completionHandler: {
            description, error in
            
            if let error {
                fatalError("Unable to initialize: \(error)")
            }
        })
    }
}
