//
//  DueDateSelectionView.swift
//  Reminders-macOS
//
//  Created by Farhana Mustafa on 4/27/24.
//

import SwiftUI

struct DueDateSelectionView: View {
    @Binding var dueDate: DueDate?
    @State private var selectedDate: Date = Date.today
    @State private var showCalandar: Bool = false
    
    var body: some View {
        Menu {
            Button{
                // action
                dueDate = .today
            } label: {
                Text("\(Date.today.formatAsString)")
            }
        } label: {
            Label(dueDate == nil ? "Add Date:" : dueDate!.title, systemImage: "calendar")
        }
    }
}

#Preview {
    DueDateSelectionView(dueDate: nil)
}
