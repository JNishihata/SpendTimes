//
//  HistoryView.swift
//  Spend times
//
//  Created by Jintaro Nishihata on 2026/05/27.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \TimerRecords.startDate, order: . reverse) var records : [TimerRecords]
    
    var body: some View {
        VStack {
            List(records) { record in
                HStack{
                    VStack{
                        HStack{
                            Text(record.appName)
                                .bold()
                            Spacer()
                        }
                        HStack{
                            Text(Self.recordDateFormatter.string(from: record.startDate))
                            Spacer()
                        }
                    }
                    Spacer()
                    Text("\(Int(record.duration / 60))分")
                }
            }
            
        }
        .padding()
    }
    
    static let recordDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd HH:mm"
        return formatter
    }()
}

#Preview {
    let container = try! ModelContainer(for: TimerRecords.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    let context = container.mainContext
    context.insert(TimerRecords(appName: "Safari", startDate: .now.addingTimeInterval(-3600), duration: 1200))
    context.insert(TimerRecords(appName: "メール", startDate: .now.addingTimeInterval(-7200), duration: 900))
    return HistoryView()
        .modelContainer(container)
}
