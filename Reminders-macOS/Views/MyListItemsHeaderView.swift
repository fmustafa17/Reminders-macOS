//
//  MyListItemsHeaderView.swift
//  Reminders-macOS
//
//  Created by Farhana Mustafa on 4/27/24.
//

import SwiftUI

struct MyListItemsHeaderView: View {
    var name: String
    var count: Int
    var color: Color

    var body: some View {
        HStack {
            Text(name)
                .font(.system(size: 28))
                .fontWeight(.bold)
                .foregroundStyle(color)
                .padding()
            
            Spacer()
            Text("\(count)")
                .font(.system(size: 32))
                .foregroundStyle(color)
                .padding()
        }
    }
}

#Preview {
    MyListItemsHeaderView(name: "Groceries", count: 6, color: .red)
}
