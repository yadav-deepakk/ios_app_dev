//
//  LengthView.swift
//  Practice
//
//  Created by Deepak Kumar Yadav on 18/09/26.
//

import SwiftUI

struct LengthView: View {
    @State private var inputUnitSelect: String = "meters"
    @State private var inputFieldVal: String = "0.00"
    var options: [String] = [ "meters", "kilometers", "feet", "yard", "miles" ]
    
    var outputMeter: Double {
        let length = Double(inputFieldVal) ?? 0.00
        if inputUnitSelect == "kilometers" { return length * 1000 }
        if inputUnitSelect == "feet" { return length * 0.3048 }
        if inputUnitSelect == "yard" { return length * 0.9144 }
        if inputUnitSelect == "miles" { return length * 1609.344 }
        return length
    }
    var outputKilometer: Double { outputMeter / 1000 }
    var outputFeet: Double { outputMeter / 0.3048 }
    var outputYard: Double { outputMeter / 0.9144 }
    var outputMile: Double { outputMeter / 1609.344 }
    
    var body: some View {
        Form {
            Section("Input") {
                HStack{
                    TextField("input", text: $inputFieldVal)
                    Picker("", selection: $inputUnitSelect){
                        ForEach(options, id:\.self) { unit in
                            Text("\(unit.capitalized)")
                        }
                    }
                }
            }
            Section("Conversion") {
                Text("\(outputMeter.formatted(.number.precision(.fractionLength(2)))) meters")
                Text("\(outputKilometer.formatted(.number.precision(.fractionLength(2)))) kilometers")
                Text("\(outputFeet.formatted(.number.precision(.fractionLength(2)))) feets")
                Text("\(outputYard.formatted(.number.precision(.fractionLength(2)))) yards")
                Text("\(outputMile.formatted(.number.precision(.fractionLength(2)))) miles")

            }
        }
    }
}

#Preview {
    LengthView()
}
