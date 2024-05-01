//
//  MyListItemsView.swift
//  Reminders-macOS
//
//  Created by Farhana Mustafa on 4/27/24.
//

import SwiftUI

struct MyListItemsView: View {
    /// Pass this to the parent
    typealias ItemAdded = ((String, Date?) -> Void)?
    
    var onItemAdded: ItemAdded
    
    init(onItemAdded: ItemAdded = nil) {
        self.onItemAdded = onItemAdded
    }

    var body: some View {
        VStack(alignment: .leading) {
            List(1...10, id: \.self) { index in
                Text("\(index)")
            }
            
        }
        AddNewListItemView { title, dueDate in
            onItemAdded?(title, dueDate)
        }
    }
}

#Preview {
    MyListItemsView()
}
