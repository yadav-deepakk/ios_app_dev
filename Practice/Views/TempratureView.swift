//
//  TempratureView.swift
//  Practice
//
//  Created by Deepak Kumar Yadav on 18/09/26.
//

import SwiftUI

struct TempratureView: View {
    @State private var tempFieldVal: String = "0.00"
    @State private var currentUnit = "Fahrenheit"
    var unitList = ["Fahrenheit", "Kelvin", "Celsius"]
    var symbol: String {
        if currentUnit == "Fahrenheit"  { return "°F" }
        if currentUnit == "Kelvin" { return "K" }
        if currentUnit == "Celsius" { return "°C" }
        return ""
    }
    
    var celsiusVal: Double {
        if currentUnit == "Fahrenheit"  { return ((Double(tempFieldVal) ?? 0.00) - 32) * 5/9 }
        if currentUnit == "Kelvin" { return (Double(tempFieldVal) ?? 0.00) - 273.15 }
        return Double(tempFieldVal) ?? 0.00
    }
    var fahrenheitVal: Double { (Double(celsiusVal) * 9/5) + 32 }
    var kelvinVal: Double { Double(celsiusVal) + 273.15 }
    
    var body: some View {
        Form {
            
            Section() {
                Picker("Select Unit", selection: $currentUnit) {
                    ForEach(unitList, id: \.self) {
                        Text($0)
                    }
                }
            }
            
            Section("Enter Temprature") {
                HStack{
                    TextField("Enter temprature", text: $tempFieldVal)
                        .keyboardType(.numberPad)
                    Text("\(symbol)")
                        .fontWeight(.semibold)
                }
            }
            
            Section ("Temperature convertions") {
                Text("\(celsiusVal.formatted(.number.precision(.fractionLength(2)))) °C")
                Text("\(fahrenheitVal.formatted(.number.precision(.fractionLength(2)))) °F")
                Text("\(kelvinVal.formatted(.number.precision(.fractionLength(2)))) K")
            }
                
        }
    }
}

#Preview {
    TempratureView()
}
