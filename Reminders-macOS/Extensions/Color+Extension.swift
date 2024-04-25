//
//  Color+Extension.swift
//  Reminders
//
//  Created by Farhana Mustafa on 4/17/24.
//

import SwiftUI
import Foundation

public extension Color {

    static func random(randomOpacity: Bool = false) -> Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            opacity: randomOpacity ? .random(in: 0...1) : 1
        )
    }
}
