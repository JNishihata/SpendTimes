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
                Image(systemName: "timer")
                Text(context.state.startDate, style: .timer)
                    .monospacedDigit()
                Text(context.attributes.appName)
                    .foregroundStyle(.secondary)
            }
            .padding()
        } dynamicIsland: { context in
            DynamicIsland {
                // 展開時
                DynamicIslandExpandedRegion(.center) {
                    HStack {
                        Image(systemName: "timer")
                        Text(context.state.startDate, style: .timer)
                            .monospacedDigit()
                            .font(.title2)
                    }
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text(context.attributes.appName)
                        .foregroundStyle(.secondary)
                        .font(.caption)
                }
            } compactLeading: {
                // コンパクト左（カメラ左側）
                Image(systemName: "timer")
                    .foregroundStyle(.green)
            } compactTrailing: {
                // コンパクト右（カメラ右側）
                Text(context.state.startDate, style: .timer)
                    .monospacedDigit()
                    .font(.caption2)
                    .frame(width: 40)
            } minimal: {
                // 最小表示
                Image(systemName: "timer")
            }
        }
    }
}

//#Preview("Notification", as: .content, using: SpendTimesWidgetAttributes.preview) {
//   SpendTimesWidgetLiveActivity()
//} contentStates: {
//    SpendTimesWidgetAttributes.ContentState.smiley
//    SpendTimesWidgetAttributes.ContentState.starEyes
//}
