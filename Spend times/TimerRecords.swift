//
//  TimerRecords.swift
//  Spend times
//
//  Created by Jintaro Nishihata on 2026/05/27.
//

import SwiftUI
import SwiftData

@Model
class TimerRecords {
    var appName: String = ""
    var startDate: Date = Date()
    var duration: TimeInterval = 0
    
    init(appName: String, startDate: Date, duration: TimeInterval) {
        self.appName = appName
        self.startDate = startDate
        self.duration = duration
    }
}
