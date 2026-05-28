//
//  Spend_timesApp.swift
//  Spend times
//
//  Created by Jintaro Nishihata on 2026/05/27.
//

import SwiftUI
import SwiftData

@main
struct Spend_timesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(ModelContainerProvider.shared.container)
    }
}


#Preview {
    ContentView()
}
