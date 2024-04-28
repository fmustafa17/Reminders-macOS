//
//  MyListViewModel.swift
//  Reminders
//
//  Created by Farhana Mustafa on 4/17/24.
//

import CoreData
import Foundation
import SwiftUI

/// for an individual list
struct MyListViewModel: Identifiable {
    private let myList: MyList

    init(myList: MyList) {
        self.myList = myList
    }
    
    var id: NSManagedObjectID {
        myList.objectID
    }
    
    var name: String {
        myList.name ?? ""
    }
    
    var color: Color {
        Color(myList.color ?? .clear)
    }
    
    var itemsCount: Int {
        items.count
    }
    
    var items: [MyListItemViewModel] {
        guard let items = myList.items,
              let myItems = (items.allObjects as? [MyListItem]) else { return [] }
        
        return myItems.filter { $0.isCompleted == false }
            .map(MyListItemViewModel.init)
    }
}
