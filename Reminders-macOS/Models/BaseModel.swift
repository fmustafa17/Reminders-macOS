//
//  BaseModel.swift
//  Reminders
//
//  Created by Farhana Mustafa on 4/17/24.
//

import Foundation
import CoreData

/// Provide common functionality to the entities
/// Protocol becasue MyList is already inheriting from NSManagedObject
protocol BaseModel {
    static var viewContext: NSManagedObjectContext { get }
    func save() throws
    func delete() throws
    static func byId<T>(id: NSManagedObjectID) -> T?
}

/// Makes sure only classes inheriting NSManagedObject can conform to BaseModel
extension BaseModel where Self: NSManagedObject {
    static var viewContext: NSManagedObjectContext {
        CoreDataManager.shared.persistentContainer.viewContext
    }
    
    func save() throws {
        try Self.viewContext.save()
    }
    
    func delete() throws {
        Self.viewContext.delete(self) // marks the item for deletion
        try save() // persist the changes to the database
    }
    
    static func byId<T>(id: NSManagedObjectID) -> T? {
        viewContext.object(with: id) as? T
    }
}
