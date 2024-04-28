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
    
    var title: String {
        myListItem.title ?? ""
    }
}
