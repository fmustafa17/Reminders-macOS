//
//  MyListsView.swift
//  Reminders
//
//  Created by Farhana Mustafa on 4/17/24.
//

import SwiftUI

struct MyListsView: View {

    // Create only one instance so that the fetching logic doesn't happen again and again
    @StateObject var viewModel: MyListsViewModel

    init(viewModel: MyListsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                Text("My Lists")
                ForEach(viewModel.myLists) { myList in
                    
                    NavigationLink {
                        MyListItemsHeaderView()
                    } label : {
                        HStack {
                            Image(systemName: "line.3.horizontal.circle.fill")
                                .font(.title)
                                .foregroundColor(myList.color)
                            Text(myList.name)
                        }
                    }.contextMenu {
                        Button {
                            viewModel.delete(myList)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let context = CoreDataManager.shared.persistentContainer.viewContext
    return MyListsView(viewModel: MyListsViewModel(context: context))
}
