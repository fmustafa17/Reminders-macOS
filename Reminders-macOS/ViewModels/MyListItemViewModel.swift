//
//  MyListItemViewModel.swift
//  Reminders-macOS
//
//  Created by Farhana Mustafa on 4/27/24.
//

import CoreData
import Foundation

struct MyListItemViewModel: Identifiable {
    private let myListItem: MyListItem
    var id = UUID().uuidString
    
    init(myListItem: MyListItem) {
        self.myListItem = myListItem
    }
    
    var listItemId: NSManagedObjectID {
        myListItem.objectID
    }
    
    var title: String {
        myListItem.title ?? ""
    }
    
    var dueDate: DueDate? {
        if let date = myListItem.dueDate {
            return DueDate.from(value: date)
        }
        
        return nil
    }
    
    var isCompleted: Bool {
        myListItem.isCompleted
    }
}
