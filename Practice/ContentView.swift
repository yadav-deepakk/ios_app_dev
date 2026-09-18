//
//  ContentView.swift
//  Practice
//
//  Created by Deepak Kumar Yadav on 04/09/26.
//
import SwiftUI

struct AppData {
    var symbol: String
    var appTitle: String
    var view: AnyView
}

struct ContentView: View {
    let apps: [AppData] = [
        AppData(symbol: "thermometer.sun.circle", appTitle: "Temperature", view: AnyView(TempratureView())),
        AppData(symbol: "globe", appTitle: "Length", view: AnyView(LengthView())),
        AppData(symbol: "alarm", appTitle: "Time", view: AnyView(TimeView())),
        AppData(symbol: "cube.circle", appTitle: "Volume", view: AnyView(VolumeView())),
    ]

    var body: some View {
        NavigationStack {
            List(apps, id: \.self.appTitle) { app in
                NavigationLink(destination: {
                    app.view
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                HStack {
                                    Image(systemName: app.symbol)
                                    Text("\(app.appTitle)")
                                }
                            }
                        }
                }, label: {
                    Image(systemName: app.symbol)
                    Text(app.appTitle)
                })
            }
            .navigationTitle("Unit Conversions")
        }
    }
}

#Preview {
    ContentView()
}
