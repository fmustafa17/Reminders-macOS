//
//  ColorListView.swift
//  Reminders
//
//  Created by Farhana Mustafa on 4/17/24.
//

import SwiftUI

/// Display randomly generated colors and allow the user to select a color
struct ColorListView: View {
    static var randomColors = [
        Color.random(),
        Color.random(), 
        Color.random(), 
        Color.random(), 
        Color.random()
    ]

    // Reflect a color change in the parent
    @Binding var selectedColor: Color

    var body: some View {
        HStack {
            ForEach(Self.randomColors, id: \.self) { color in
                Image(systemName: selectedColor == color ?
                      Constants.Icons.recordCircleFill : Constants.Icons.circleFill)
                .foregroundColor(color)
                .font(.system(size: 16))
                .clipShape(Circle())
                .onTapGesture {
                    selectedColor = color
                }
            }
        }
    }
}

#Preview {
    ColorListView(selectedColor: .constant(.pink))
        .frame(minWidth: 300, minHeight: 200)
}
