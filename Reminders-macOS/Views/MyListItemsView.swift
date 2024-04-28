//
//  MyListItemsView.swift
//  Reminders-macOS
//
//  Created by Farhana Mustafa on 4/27/24.
//

import SwiftUI

struct MyListItemsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            List(1...10, id: \.self) { index in
                Text("\(index)")
            }
            
        }
        AddNewListItemView()
    }
}

#Preview {
    MyListItemsView()
}
