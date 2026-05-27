//
//  ModelContainerProvider.swift
//  Spend times
//
//  Created by Jintaro Nishihata on 2026/05/27.
//

import SwiftData

final class ModelContainerProvider {
    static let shared = ModelContainerProvider()
    
    let container: ModelContainer
    
    private init() {
        container = try! ModelContainer(for: TimerRecords.self)
    }
}
