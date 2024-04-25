//
//  AddNewListViewModel.swift
//  Reminders
//
//  Created by Farhana Mustafa on 4/17/24.
//

import CoreData
import Foundation
import SwiftUI

class AddNewListViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var color: Color = .blue
    
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func save() {
        do {
            let myList = MyList(context: context)
            myList.name = name
            myList.color = NSColor(color)
            try myList.save()
        } catch {
            print(error)
        }
        
    }
}
