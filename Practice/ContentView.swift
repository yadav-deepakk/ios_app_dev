//
//  ContentView.swift
//  Practice
//
//  Created by Deepak Kumar Yadav on 04/09/26.
//

import SwiftUI

struct FlagImage: View {
    var name: String
    @ViewBuilder var body: some View {
        Image("\(name)")
            .clipShape(.capsule)
            .shadow(radius: 4)
    }
}

struct TitleText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .font(.largeTitle.bold())
    }
    
}

extension View {
    func setTitleStyle() -> some View {
        self.modifier(TitleText())
    }
}

struct ContentView: View {
    @State private var countries: [String] = [ "Estonia", "France", "Germany","Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Spain", "UK", "US", "Ukraine" ].shuffled()
    @State private var score: Int = 0
    @State private var correctAnswerIndex: Int = Int.random(in: 0...2)
    @State private var totalQuestionCount: Int = 0
    @State private var showGuessResultAlert: Bool = false
    @State private var guessAlertTitle: String = ""
    @State private var guessAlertMessage: String = ""
    @State private var showResultAlert: Bool = false
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.55, green: 0.1, blue: 0.1), location: 0.3),
                .init(color: Color(red: 0.1, green: 0.1, blue: 0.38), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {

                Text("Guess the flag")
                    .setTitleStyle()
                
                VStack(spacing: 14) {
                    
                    VStack {
                        Text("Tap on the flag of")
                            .foregroundStyle(.secondary)
                            .font(.title3.bold())
                        
                        Text("\(countries[correctAnswerIndex])")
                            .foregroundStyle(.primary)
                            .font(.title.bold())
                    }
                    
                    ForEach(0..<3) { index in
                        Button(action:{
                            showGuessResult(index)
                        }, label: {
                            FlagImage(name: countries[index])
                        })
                        .alert("\(guessAlertTitle)", isPresented: $showGuessResultAlert, actions: {
                            Button("OK", role: .confirm) { askQuestion() }
                        }, message: {
                            Text("\(guessAlertMessage)")
                        })
                    }
                    
                }
                .padding(.vertical, 18)
                .frame(maxWidth: .infinity)
                .background(.regularMaterial)
                .cornerRadius(12)
                
                Text("Score \(score)")
                    .foregroundStyle(.white)
                    .font(.title2.bold())

            }
            .padding(.horizontal, 12)
            .alert("Final Evaluation", isPresented: $showResultAlert, actions: {
                Button("Restart") {
                    totalQuestionCount = 0
                    score = 0
                    askQuestion()
                }
            }, message: {
                Text("Your Score : \(score)/8")
            })

        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswerIndex = Int.random(in: 0...2)
    }
    
    func showGuessResult(_ index: Int) {
        totalQuestionCount += 1
        if correctAnswerIndex == index {
            guessAlertTitle = "That's Correct!"
            score += 1
        } else {
            guessAlertTitle = "Oops! Incorrect. Try Again."
        }
        guessAlertMessage = "You tapped on flag of \(countries[index])"
        showGuessResultAlert = true
        if totalQuestionCount == 8 {
            showResultAlert = true
        }
    }
}

#Preview {
    ContentView()
}
