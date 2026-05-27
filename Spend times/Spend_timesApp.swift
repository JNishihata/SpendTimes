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
            TabView {
                NavigationStack{
                    ContentView()
                        .navigationTitle("Home")
                }
                    .tabItem { Label("Home", systemImage:"house")}
                NavigationStack{
                    HistoryView()
                        .navigationTitle("History")
                }
                    .tabItem { Label("History", systemImage: "clock")}
            }
        }
        .modelContainer(ModelContainerProvider.shared.container)
    }
}
