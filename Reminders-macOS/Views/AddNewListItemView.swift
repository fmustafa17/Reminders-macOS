//
//  AddNewListItemView.swift
//  Reminders-macOS
//
//  Created by Farhana Mustafa on 4/27/24.
//

import SwiftUI

struct AddNewListItemView: View {
    
    @State private var title: String = ""
    @State private var dueDate: DueDate?

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image(systemName: "circle")
                    .font(.system(size: 14))
                    .opacity(0.2)
                TextField("", text: $title)
                
                Text("Notes")
                    .opacity(0.2)
                    .padding(.leading, 30)
                
                HStack {
                    DueDateSelectionView(dueDate: $dueDate)
                    
                    if dueDate != nil {
                        Button("Clear") {
                            dueDate = nil
                        }
                    }
                    
                    Button("Save") {
                        
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    AddNewListItemView()
}
