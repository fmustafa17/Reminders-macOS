//
//  AddNewListView.swift
//  Reminders
//
//  Created by Farhana Mustafa on 4/17/24.
//

import SwiftUI

struct AddNewListView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var viewModel: AddNewListViewModel
    
    init(viewModel: AddNewListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Form {
            VStack(alignment: .leading) {
                Text("New List")
                    .font(.headline)
                    .padding(.bottom, 20)
                
                HStack {
                    Text("Name")
                    TextField("", text: $viewModel.name)
                }
                
                HStack {
                    Text("Color:")
                    ColorListView(selectedColor: $viewModel.color)
                }
            }
            
            // Buttons
            HStack {
                Spacer()
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
                Button("Save") {
                    viewModel.save()
                    presentationMode.wrappedValue.dismiss()
                }.disabled(viewModel.name.isEmpty)
            }
        }
        .frame(minWidth: 300)
        .padding()
    }
}

#Preview {
    let viewContext = CoreDataManager.shared.persistentContainer.viewContext
    return AddNewListView(viewModel: AddNewListViewModel(context: viewContext))
}
