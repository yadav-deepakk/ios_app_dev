//
//  ContentView.swift
//  Practice
//
//  Created by Deepak Kumar Yadav on 04/09/26.
//

import SwiftUI

enum GameState: Equatable {
    case start
    case inProgress
}

struct ShowScore: View {
    var title: String
    var score: Int
    var body: some View {
        VStack {
            Text("\(title)")
                .foregroundStyle(.white)
                .font(.headline.bold())
            Text("\(score)")
                .foregroundStyle(.white)
                .font(.largeTitle.bold())
        }
        .padding(.horizontal, 40)
        .padding(.vertical, 8)
        .background(.ultraThinMaterial)
        .cornerRadius(10)
    }
}

struct ShowChoice: View {
    var title: String
    var move: String?
    var body: some View {
        VStack{
            Text("\(title)")
                .foregroundStyle(.white)
                .font(.headline.bold())
            if let move = move {
                HStack {
                    Text("\(move)")
                        .transition(.push(from: .bottom))
                        .id(move)
                }
                .padding(20)
                .font(.system(size: 68).bold())
                .background(.white.opacity(0.2))
                .clipShape(.circle)
            }
        }
    }
}

struct ContentView: View {
    var options = ["🪨", "📄", "✂️"]
    
    @State private var isGameEnded: Bool = false
    @State private var gameState: GameState = .start
    @State private var userScore = 0
    @State private var cpuScore = 0
    @State private var userMove: String? = nil
    @State private var cpuMove: String? = nil
    @State private var resultString: String = ""
    
    var body: some View {
        ZStack {
            backgroundView
            VStack{ gameView }.padding()
        }.alert("Final Evaluation", isPresented: $isGameEnded, actions: {
            Button("OK") { resetGame() }
        }, message: { Text("You: \(userScore) || CPU: \(cpuScore).") })
    }
    
    var backgroundView : some View {
        LinearGradient(colors: [.indigo, .black], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
    }
    
    @ViewBuilder var gameView: some View {
        // title and score card
        Text(gameState == .start ? "Play the game" : "Game On")
            .foregroundStyle(.white)
            .font(.largeTitle.bold())
        
        HStack {
            Spacer()
            ShowScore(title: "You", score: userScore)
            Spacer()
            ShowScore(title: "CPU", score: cpuScore)
            Spacer()
        }
        
        Spacer()
        
        // main area
        VStack {
            if gameState == .inProgress {
                if let userMove = userMove, let cpuMove = cpuMove {
                    HStack(spacing: 10) {
                        ShowChoice(title: "YOU", move: userMove)
                        Text(":")
                        ShowChoice(title: "CPU", move: cpuMove)
                    }
                    .padding(.vertical, 10)
                    Text("\(resultString)")
                        .foregroundStyle(.white.opacity(0.9))
                }
            } else {
                Text("Tap on buttons below to play")
                    .foregroundStyle(.white)
            }
        }
        
        Spacer()
        
        // user control
        HStack(spacing: 20) {
            ForEach(options.indices, id:\.self) { i in
                Button(action: {
                    withAnimation { play(move: options[i]) }
                }, label: {
                    Text("\(options[i])")
                        .padding()
                        .font(.system(size: 44))
                        .background(.ultraThinMaterial)
                        .cornerRadius(28)
                })
            }
        }
        .padding()
        
        HStack{
            Button(
                action: {
                    if gameState == .inProgress {
                        debugPrint("game has been ended/restarted by user")
                        isGameEnded = true
                    }
                }, label: {
                    Text("⌘ Restart the game")
                        .font(.body.bold())
                        .foregroundStyle(.white)
                }
            )
        }
        .padding()
    }
    
    func play(move: String) {
        if gameState == .start { gameState = .inProgress }
        userMove = move
        debugPrint("user tapped on \(userMove ?? "")")
        cpuMove = options[Int.random(in: 0...(options.count-1))]
        
        // checkwin and update the score
        if userMove == cpuMove {
            resultString = "It's a tie 🤝"
        } else if (userMove == "🪨" && cpuMove == "✂️") || (userMove == "✂️" && cpuMove == "📄") || (userMove == "📄" && cpuMove == "🪨") {
            userScore += 1
            resultString = "You've been won! 🎉"
        } else {
            cpuScore += 1
            resultString = "CPU has been won! 🤖"
        }
        
    }
    
    func resetGame() {
        gameState = .start
        userScore = 0
        cpuScore = 0
    }
}

#Preview {
    ContentView()
}

