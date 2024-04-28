//
//  MyList.swift
//  Reminders
//
//  Created by Farhana Mustafa on 4/17/24.
//

import AppKit
import CoreData
import Foundation

@objc(MyList)
public class MyList: NSManagedObject, BaseModel {
    static var all: NSFetchRequest<MyList> {
        let request: NSFetchRequest<MyList> = MyList.fetchRequest()
        request.sortDescriptors = []
        return request
    }
}

extension MyList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyList> {
        return NSFetchRequest<MyList>(entityName: "MyList")
    }

    @NSManaged public var color: NSColor?
    @NSManaged public var name: String?
    @NSManaged public var items: NSSet?

}

extension MyList : Identifiable {

}
