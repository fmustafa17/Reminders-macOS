//
//  SideBarView.swift
//  Reminders
//
//  Created by Farhana Mustafa on 4/17/24.
//

import SwiftUI

struct SideBarView: View {
    
    @Environment(\.managedObjectContext) var context: NSManagedObjectContext
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack {
            Text("AllItemsView")
            MyListsView(viewModel: MyListsViewModel(context: context))
            Spacer()
            HStack {
                Button(action: {
                    isPresented = true
                }) {
                    HStack {
                        Image(systemName: Constants.Icons.plusCircle)
                        Text("Add List")
                    }
                }
                .buttonStyle(.plain)
                .padding()

                Spacer()
            }.sheet(isPresented: $isPresented) {
                
            } content: {
                AddNewListView(viewModel: AddNewListViewModel(context: context))
            }
        }
    }
}

#Preview {
    SideBarView()
}
