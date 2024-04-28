//
//  DueDate.swift
//  Reminders-macOS
//
//  Created by Farhana Mustafa on 4/27/24.
//

import Foundation

enum DueDate {
    case today
    case tomorrow
    case yesterday
    case custom(Date)
}

extension DueDate {
    var value: Date {
        switch self {
        case .today:
            return Date.today
        case .tomorrow:
            return Date.tomorrow
        case .yesterday:
            return Date.yesterday
        case .custom(let date):
            return date
        }
    }

    var title: String {
        self.value.formatAsString
    }
    
    var isPastDue: Bool {
        value < Date()
    }
    
    static func from(value: Date) -> DueDate {
        let calendar = NSCalendar.current
        
        if calendar.isDateInToday(value) {
            return DueDate.today
        } else if calendar.isDateInTomorrow(value) {
            return DueDate.tomorrow
        } else if calendar.isDateInYesterday(value) {
            return DueDate.yesterday
        }
        
        return DueDate.custom(value)
    }

}
