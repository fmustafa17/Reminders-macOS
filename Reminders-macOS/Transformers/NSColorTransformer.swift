//
//  NSColorTransformer.swift
//  Reminders
//
//  Created by Farhana Mustafa on 4/17/24.
//

import AppKit
import Foundation

/// Tranform data into NSColor, and back from NSColor into data
class NSColorTransformer: ValueTransformer {
    /// Convert the user's selected NSColor into data to store into CoreData
    /// - Parameter value: NSColor
    /// - Returns: data
    override func transformedValue(_ value: Any?) -> Any? {
        guard let color = value as? NSColor else {
            return nil
        }
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: true)
            return data
        } catch {
            print(error)
            return nil
        }
    }

    /// Reverse the stored data back into NSColor
    /// - Parameter value: data thahas been transformed
    /// - Returns: NSColor
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else { return nil }
        
        do {
            let color = try NSKeyedUnarchiver.unarchivedObject(ofClass: NSColor.self, from: data)
            return color
        } catch {
            print(error)
            return nil
        }
    }
}
