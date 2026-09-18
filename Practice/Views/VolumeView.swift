//
//  Volume.swift
//  Practice
//
//  Created by Deepak Kumar Yadav on 18/09/26.
//

import SwiftUI

struct VolumeView: View {
    @State private var inputFieldVal: String = "0.0"
    @State private var currentSelection: String = "litres"
    var options = ["litres", "pints", "gallons", "quarts"]
    
    var litre: Double {
        let l = Double(inputFieldVal) ?? 0.0
        if currentSelection == "pints" { return l * 0.473176 }
        if currentSelection == "gallons" { return l * 3.78541 }
        if currentSelection == "quarts" { return l * 0.946353 }
        return l
    }
    var pints: Double { litre / 0.473176 }
    var gallons: Double { litre / 3.78541 }
    var quarts: Double { litre / 0.946353 }
    
    var body: some View {
        Form {
            Section("Input Volume") {
                HStack{
                    TextField("Enter volume", text: $inputFieldVal)
                        .keyboardType(.numberPad)
                    Picker("", selection: $currentSelection) {
                        ForEach(options, id:\.self ) {
                            Text("\($0.capitalized)")
                        }
                    }
                }
            }
            Section("Output Volume") {
                Text("\(litre.formatted(.number.precision(.fractionLength(2)))) litres")
                Text("\(pints.formatted(.number.precision(.fractionLength(2)))) pints")
                Text("\(gallons.formatted(.number.precision(.fractionLength(2)))) gallons")
                Text("\(quarts.formatted(.number.precision(.fractionLength(2)))) quarts")
            }
        }
    }
}

#Preview {
    VolumeView()
}
