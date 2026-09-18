//
//  ContentView.swift
//  Practice
//
//  Created by Deepak Kumar Yadav on 04/09/26.
//

import SwiftUI

struct ContentView: View {
    @State private var amountFieldVal: String = "0.00"
    @State private var peopleCount: Int = 2
    @State private var tipPercentage: Int = 20
    @FocusState private var amountFieldFocus: Bool
    var percentageList = [5,10,15,20,0]
    
    var finalTotalPerPerson : Double {
        debugPrint("Amount:\(amountFieldVal), People:\(peopleCount),  Tip:\(tipPercentage)")
        let a = (Double(amountFieldVal) ?? 0.0)
        let tip = Double(tipPercentage)
        let people = Double(peopleCount)
        debugPrint("total: \(a+(a*tip/100)), people: \(people)")
        debugPrint("total per person: \( (a + (a*tip/100) ) / people)")
        return (a + (a*tip/100) ) / people
    }
    
    var body: some View {
        
        NavigationStack(){
            Form{
                Section{
                    TextField("Enter Amount", text: $amountFieldVal)
                        .keyboardType(.numberPad)
                        .focused($amountFieldFocus)
                    Picker("People:", selection: $peopleCount){
                        ForEach(2...40, id: \.self) {
                            Text("\($0) People")
                        }
                    }
                }
                Section("Tip Percentage"){
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach(percentageList, id: \.self) {
                            Text("\(Int($0))%")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Final Amount(Per Person)"){
                    Text("\(finalTotalPerPerson)")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar(){
                Button("Done"){
                    self.amountFieldFocus = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
