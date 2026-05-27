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
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: SpendTimesAttributes.self) { context in
            // ロック画面・バナー表示
            HStack {
                
                
                Text(context.state.startDate, style: .timer)
                    .monospacedDigit()
                Text(context.attributes.appName)
                    .foregroundStyle(.secondary)
                
            }
            .padding()
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
                    .frame(width: 40)
            } minimal: {
                Image(systemName: "timer")
            }
        }
    }
}

#Preview("Dynamic Island", as: .dynamicIsland(.expanded), using: SpendTimesAttributes(appName: "X")) {
    SpendTimesWidgetLiveActivity()
} contentStates: {
    SpendTimesAttributes.ContentState(startDate: .now)
}
