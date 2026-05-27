//
//  StartTimerIntent.swift
//  Spend times
//
//  Created by Jintaro Nishihata on 2026/05/27.
//


import AppIntents
import ActivityKit
import SwiftData

struct StartTimerIntent: LiveActivityIntent {
    static var title: LocalizedStringResource = "タイマー開始"
    static var description = IntentDescription("Spend Timesのタイマーを開始します")
    
    @Parameter(title: "アプリ名")
    var appName: String
    
    func perform() async throws -> some IntentResult {
        // すでに動いてるActivityがあれば終了
        for activity in Activity<SpendTimesAttributes>.activities {
            await activity.end(nil, dismissalPolicy: .immediate)
        }
        
        let attributes = SpendTimesAttributes(appName: appName)
        let state = SpendTimesAttributes.ContentState(startDate: Date())
        
        let content = ActivityContent(state: state, staleDate: nil)
        _ = try Activity.request(
            attributes: attributes,
            content: content,
            pushType: nil
        )
        
        return .result()
    }
}

struct StopTimerIntent: LiveActivityIntent {
    static var title: LocalizedStringResource = "タイマー停止"
    static var description = IntentDescription("Spend Timesのタイマーを停止します")
    
    func perform() async throws -> some IntentResult {
        let endDate = Date()
        for activity in Activity<SpendTimesAttributes>.activities {
            let startDate = activity.content.state.startDate
            let duration = endDate.timeIntervalSince(startDate)
            let appName = activity.attributes.appName
            print(appName, startDate, duration)
            
            let container = await ModelContainerProvider.shared.container
            let context = ModelContext(container)
            let record = TimerRecords(appName: appName, startDate: startDate, duration: duration)
            context.insert(record)
            try context.save()
            await activity.end(nil, dismissalPolicy: .immediate)
        }
        return .result()
    }
}
