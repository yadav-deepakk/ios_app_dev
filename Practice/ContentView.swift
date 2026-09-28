//
//  ContentView.swift
//  Practice
//
//  Created by Deepak Kumar Yadav on 04/09/26.
//

import CoreML
import SwiftUI

struct ContentView : View {
    
    @State private var wakeUp: Date = defaultWakeUp
    @State private var sleep: Double = 8
    @State private var cup : Int = 2
    
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    
    static var defaultWakeUp: Date {
        Calendar.current.date(
            bySettingHour: 7,
            minute: 0,
            second: 0,
            of: Date()
        ) ?? Date()
    }
    
    var bedTime: String? {  returnBedTime()  }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("When do you want to wake up?") {
                    DatePicker("Please select time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                Section("Desired amount of sleep") {
                    Stepper("\(sleep.formatted()) hours", value: $sleep, in: 4...12)
                }
                Section("Daily coffee intake") {
                    Stepper("^[\(cup) cup](inflect: true)", value: $cup, in:1...20)
                }
                Section("Estimated Bedtime") {
                    Text("\(bedTime ?? "")")
                        .font(.title2.bold())
                }
            }
            .navigationTitle("BetterRest")
            .navigationBarTitleDisplayMode(.inline)
//            .toolbar(){
//                Button(action: showBedTimeAlert, label: { Text("Calculate") })
//            }
            .alert(alertTitle, isPresented: $showAlert) { } message: { Text(alertMessage) }
        }
    }
    
    func returnBedTime() -> String? {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let dateComponent = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (dateComponent.hour ?? 0) * 60 * 60
            let min = (dateComponent.minute ?? 0) * 60
            // prediction
            let prediction = try model.prediction(wake: Double(hour + min), estimatedSleep: sleep, coffee: Double(cup))
            return (wakeUp - prediction.actualSleep).formatted(date: .omitted, time: .shortened)
        } catch {
            debugPrint("Error in calculating bedtime: " + error.localizedDescription)
            return nil
        }
    }
    
    func showBedTimeAlert() {
        
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let dateComponent = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (dateComponent.hour ?? 0) * 60 * 60
            let min = (dateComponent.minute ?? 0) * 60
            
            // prediction
            let prediction = try model.prediction(wake: Double(hour + min), estimatedSleep: sleep, coffee: Double(cup))
            let time: Date = wakeUp - prediction.actualSleep
            alertTitle = "Your estimated bedtime is..."
            alertMessage = time.formatted(date: .omitted, time: .shortened)
        }
        catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was some error calculating your bedtime."
        }
        
        showAlert = true
    }
    
}

#Preview {
    ContentView()
}
