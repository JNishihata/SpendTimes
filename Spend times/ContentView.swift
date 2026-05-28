//
//  ContentView.swift
//  Spend times
//
//  Created by Jintaro Nishihata on 2026/05/27.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                MainView()
                    .navigationTitle("Home")
            }
            .tabItem { Label("Home", systemImage:"house")}
            NavigationStack{
                HistoryView()
                    .navigationTitle("History")
            }
                .tabItem { Label("History", systemImage: "clock")}
            NavigationStack{
                SettingsView()
                    .navigationTitle("Settings")
            }.tabItem{ Label("Settigns", systemImage: "gear")}
        }
    }
}

#Preview {
    let container = try! ModelContainer(for: TimerRecords.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    let context = container.mainContext
    context.insert(TimerRecords(appName: "Safari", startDate: .now.addingTimeInterval(-3600), duration: 1200))
    context.insert(TimerRecords(appName: "メール", startDate: .now.addingTimeInterval(-7200), duration: 900))
    return ContentView()
        .modelContainer(container)
}
