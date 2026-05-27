//
//  SpendTimesWidgetBundle.swift
//  SpendTimesWidget
//
//  Created by Jintaro Nishihata on 2026/05/27.
//

import WidgetKit
import SwiftUI

@main
struct SpendTimesWidgetBundle: WidgetBundle {
    var body: some Widget {
        SpendTimesWidget()
        SpendTimesWidgetControl()
        SpendTimesWidgetLiveActivity()
    }
}
