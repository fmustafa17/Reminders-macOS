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
            
            Button{
                // action
                dueDate = .tomorrow
            } label: {
                Text("\(Date.tomorrow.formatAsString)")
            }
            
            Button{
                // action
                showCalandar = true
            } label: {
                Text("Custom")
            }
        } label: {
            Label(dueDate == nil ? "Add Date:" : dueDate!.title, systemImage: "calendar")
        }
        .menuStyle(.borderedButton)
        .fixedSize()
        .popover(isPresented: $showCalandar, content: {
            DatePicker("Custom", selection: $selectedDate, displayedComponents: .date)
                .labelsHidden()
                .datePickerStyle(.graphical)
                .onChange(of: selectedDate) { newValue in
                    dueDate = .custom(newValue)
                    showCalandar = false
                }
        })
    }
}

#Preview {
    DueDateSelectionView(dueDate: .constant(nil))
}
