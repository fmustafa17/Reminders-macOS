//
//  HomeScreen.swift
//  Reminders
//
//  Created by Farhana Mustafa on 4/17/24.
//

import SwiftUI

/// The root view
struct HomeScreen: View {
    var body: some View {
        NavigationView {
            SideBarView()
            Text("Hello")
        }
    }
}

#Preview {
    HomeScreen()
}
