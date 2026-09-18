//
//  TimeView.swift
//  Practice
//
//  Created by Deepak Kumar Yadav on 18/09/26.
//

import SwiftUI

struct TimeView: View {
    @State private var currSelection: String = "seconds"
    @State private var inputFieldTime: String = "0"
    var options = ["seconds", "minutes", "hours", "days"]
    
    var totalSec: Int {
        let s = Int(inputFieldTime) ?? 0
        if currSelection == "minutes" { return s * 60 }
        if currSelection == "hours" { return s * 60 * 60 }
        if currSelection == "days" { return s * 60 * 60 * 24 }
        return s
    }
    var days: Int { totalSec / (60*60*24) }
    var hours: Int { (totalSec % (60*60*24)) / 3600 }
    var minutes: Int { (totalSec % (60*60)) / 60 }
    var seconds: Int { (totalSec % 60) }
    
    var body: some View {
        Form {
            
            Section("Input Section") {
                HStack{
                    TextField("Enter time", text: $inputFieldTime)
                        .keyboardType(.numberPad)
                    Picker("", selection: $currSelection) {
                        ForEach(options, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
            }
            
            Section("Time Conversion") {
                Text("\(String(format: "%02d", days))D : \(String(format: "%02d", hours))H :  \(String(format: "%02d", minutes))M : \(String(format: "%02d", seconds))S")
            }
            
        }
    }
    
    
}

#Preview {
    TimeView()
}
