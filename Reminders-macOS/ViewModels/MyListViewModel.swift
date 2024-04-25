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
}
