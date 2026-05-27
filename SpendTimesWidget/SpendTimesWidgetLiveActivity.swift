//
//  SpendTimesWidgetLiveActivity.swift
//  SpendTimesWidget
//
//  Created by Jintaro Nishihata on 2026/05/27.
//

import ActivityKit
import SwiftUI
import WidgetKit

struct SpendTimesWidgetLiveActivity: Widget {
    @State var timer = ""
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: SpendTimesAttributes.self) { context in
            // ロック画面・バナー表示
            VStack {
                HStack{
                    Text("Spend Times")
                        .font(.caption)
                    Spacer()
                    Text("X")
                }
                HStack{
                    Text(context.attributes.appName)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(context.state.startDate, style: .timer)
                        .font(.largeTitle)
                        .bold()
                        
                }
                
            }
            .padding()
            .onChange(of: context.state.startDate) {
                timer = Self.dateFormatter.string(from: context.state.startDate)
            }
        } dynamicIsland: { context in
            DynamicIsland {
                // 展開時
                DynamicIslandExpandedRegion(.leading){
                    Image(systemName: "timer")
                        .foregroundStyle(.cyan)
                        .font(.system(size:44))
                }
                DynamicIslandExpandedRegion(.center){
                    HStack {
                        Text(context.attributes.appName)
                            .foregroundStyle(.secondary)
                            .font(.callout)
                            .multilineTextAlignment(.trailing)
                    }
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text(context.state.startDate, style: .timer)
                        .monospacedDigit()
                        .font(.system(size:44))
                        .fontWeight(.semibold)
                }
            } compactLeading: {
                Image(systemName: "timer")
                    .foregroundStyle(.cyan)
            } compactTrailing: {
                Text(context.state.startDate, style: .timer)
                    .monospacedDigit()
                    .font(.caption2)
                    .frame(width: 29)
            } minimal: {
                Image(systemName: "timer")
            }
        }
    }
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
}

#Preview("Dynamic Island", as: .dynamicIsland(.expanded), using: SpendTimesAttributes(appName: "X")) {
    SpendTimesWidgetLiveActivity()
} contentStates: {
    SpendTimesAttributes.ContentState(startDate: .now)
}
