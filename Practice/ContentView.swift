//
//  ContentView.swift
//  Practice
//
//  Created by Deepak Kumar Yadav on 04/09/26.
//

import SwiftUI

struct ContentView : View {
    
    @State private var dateSelection = Date.now
    @State private var sleepValue: Double = 8
    
    var body: some View {
        Text(Date.now, format: .dateTime.month().year().day())
        Text(Date.now.formatted(date: .complete, time: .omitted))
        Stepper("\(sleepValue.formatted()) hours", value: $sleepValue, in: 4...12, step: 0.25)
        DatePicker("Please enter a date", selection: $dateSelection, in: Date.now...)
            .labelsHidden()
    }
    
    func someDate() -> Date {
        let now = Date.now
        let tomorrow = Date.now.addingTimeInterval(24*60*60)
        _ = now...tomorrow
        return now
    }
    
    func exampleDate() {
        var component = DateComponents()
        component.hour = 10
        component.minute = 10
        _ = Calendar.current.date(from: component) ?? Date.now
        
        var someComponent = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
        var hr = someComponent.hour ?? 0
        var min = someComponent.minute ?? 0
        debugPrint("\(hr) \(min)")
        
    }
}

#Preview {
    ContentView()
}
