//
//  MyListsViewModel.swift
//  Reminders
//
//  Created by Farhana Mustafa on 4/17/24.
//

import CoreData
import Foundation
import SwiftUI

class MyListsViewModel: NSObject, ObservableObject {
    
    @Published var myLists = [MyListViewModel]()
    private let fetchedResultsController: NSFetchedResultsController<MyList>
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
        fetchedResultsController = NSFetchedResultsController(
            fetchRequest: MyList.all,
            managedObjectContext: context,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        super.init()
        
        // Subscribe to the delegate of fetchedResultsController
        fetchedResultsController.delegate = self
        
        fetchAll()
    }

    /// Attach an item to a list
    func saveTo(list: MyListViewModel, title: String, dueDate: Date?) {
        let myListItem = MyListItem(context: context)
        myListItem.title = title
        myListItem.dueDate = dueDate
        myListItem.myList = MyList.byId(id: list.id)

        do {
            try myListItem.save()
        } catch {
            print(error)
        }
    }
    
    func delete(_ myList: MyListViewModel) {
        // Fetch first, to ensure it exists
        let myList: MyList? = MyList.byId(id: myList.id)
        if let myList = myList {
            try? myList.delete()
        }
    }
    
    private func fetchAll() {
        do {
            try fetchedResultsController.performFetch()
            
            // This data is coming from Coredata, not recommended to present this on the view
            guard let myLists = fetchedResultsController.fetchedObjects else { return
            }
            
            // Add a layer to this data before presenting to the view
            self.myLists = myLists.map(MyListViewModel.init)
        } catch {
            print(error)
        }
    }
}

extension MyListsViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let myLists = controller.fetchedObjects as? [MyList] else { return }
        
        self.myLists = myLists.map(MyListViewModel.init)
    }
}
