//
//  SpendTimesAttributes.swift
//  Spend times
//
//  Created by Jintaro Nishihata on 2026/05/27.
//


import ActivityKit
import Foundation

struct SpendTimesAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var startDate: Date
    }
    
    var appName: String
}